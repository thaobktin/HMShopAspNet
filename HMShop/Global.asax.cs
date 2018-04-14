using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web.Security;
using System.Web.Routing;
using System.Web;
using System.Web.UI;
using HM.Services;
using HM.Util;

namespace HMShop
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            //System.Diagnostics.Debugger.Break();

            // Code that runs on application startup
            Application["UserOnline"] = 0;

            //var abc = ReverseMapPath(@"~/HMShop/Qwerty/Default.aspx"); //~/Qwerty/Default.aspx
            RegisterRoutes(RouteTable.Routes);
        }

        public static void RegisterRoutes(RouteCollection routes)
        {
            // login System.Web.Hosting.HostingEnvironment.MapPath
            //routes.MapPageRoute("Admin", "Qwerty", HttpApplication.Server.MapPath("~/Qwerty/Default.aspx"));
            //routes.MapPageRoute("Admin", "Qwerty", System.Web.Hosting.HostingEnvironment.MapPath("~/Qwerty/Default.aspx"));

            routes.MapPageRoute("Admin", "Qwerty", "~/Qwerty/Default.aspx");
            routes.MapPageRoute("Login", "{admin}", "~/Qwerty/{admin}.aspx", false, null,
                new RouteValueDictionary { { "admin", "Login|LoginFb" } });

            routes.MapPageRoute("PublicPages", "{page}", "~/{page}.aspx", false, null,
                new RouteValueDictionary { { "page", "Default|ProductDetail|ShoppingCart|Login|SignUp" } });
            
            routes.Ignore("{WebResource}.axd/{*pathInfo}");
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            try
            {
                // Code that runs when a new session is started
                //Response.Redirect("~/Qwerty/Login.aspx", false);
                //Context.ApplicationInstance.CompleteRequest();

                //StatisticBLL.UpdateStatistic();
                int count_visit = 0;

                //Kiem tra file CountVisit.txt neu không ton tai thì
                if (!System.IO.File.Exists(Server.MapPath("~/LogFiles/CountVisit.txt")))
                {
                    count_visit = 1;
                }

                if (System.IO.File.Exists(Server.MapPath("~/LogFiles/CountVisit.txt")))
                {
                    using (var read = new System.IO.StreamReader(Server.MapPath("~/LogFiles/CountVisit.txt")))
                    {
                        count_visit = int.Parse(read.ReadLine());
                        read.Close();
                        count_visit++;
                    }
                }

                Application.Lock();
                Application["UserOnline"] = (int)Application["UserOnline"] + 1;
                Application["CountVisit"] = count_visit;
                Application.UnLock();

                using (var writer = new System.IO.StreamWriter(Server.MapPath("~/LogFiles/CountVisit.txt")))
                {
                    writer.WriteLine(count_visit);
                }
            }
            catch(Exception ex)
            {
                var url = "~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message;
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {
            ////Fires upon attempting to authenticate the use
            //if (!(HttpContext.Current.User == null))
            //{
            //    if (HttpContext.Current.User.Identity.IsAuthenticated)
            //    {
            //        if (HttpContext.Current.User.Identity.GetType() == typeof(FormsIdentity))
            //        {
            //            FormsIdentity fi = (FormsIdentity)HttpContext.Current.User.Identity;
            //            FormsAuthenticationTicket fat = fi.Ticket;

            //            String[] astrRoles = fat.UserData.Split('|');
            //            HttpContext.Current.User = new GenericPrincipal(fi, astrRoles);
            //        }
            //    }
            //}
        }
        
        protected void Application_Error(object sender, EventArgs e)
        {
            HttpContext ctx = HttpContext.Current;
            // Get last error from the server
            Exception exc = ctx.Server.GetLastError().GetBaseException();

            if (exc is HttpUnhandledException)
            {
                if (exc.InnerException != null)
                {
                    exc = new Exception(exc.InnerException.Message);
                    Server.Transfer("~/LogPages/HttpErrorPage.aspx?handler=Application_Error-Global.asax",
                        true);
                }
            }

            // Handle HTTP errors
            if (exc.GetType() == typeof(HttpException))
            {
                if (exc.Message.Contains("NoCatch") || exc.Message.Contains("maxUrlLength"))
                    return;

                //Redirect HTTP errors to HttpError page
                Server.Transfer("~/LogPages/HttpErrorPage.aspx");
            }

            // Log the exception and notify system operators
            ExceptionUtils.LogException(exc, "~/Default.aspx");
            ExceptionUtils.NotifySystemOps(exc);

            // Clear the error from the server
            Server.ClearError();
        }

        protected void Global_Error(object sender, EventArgs e)
        {
            Exception ex = Server.GetLastError();
            //Response.Redirect("~/LogPages/ServerErrorPage.aspx");
        }

        protected void Session_End(object sender, EventArgs e)
        {
            Application.Lock();
            Application["UserOnline"] = (int)Application["UserOnline"] - 1;
            Application.UnLock();
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }

        public string ReverseMapPath(string path)
        {
            var appPath = HttpContext.Current.Server.MapPath("/");
            var res = string.Format("~{0}", path.Replace(appPath, "").Replace("\\", "/"));
            return res;
        }
    }
}