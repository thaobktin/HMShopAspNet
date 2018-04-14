using System;
using System.Diagnostics;
using System.Web;
using System.Web.Security;

namespace HM.Util
{
    public class AuthenUtils
    {
        public static string GetUserOrEmail(string prefix)
        {
            return HttpContext.Current.User.Identity.Name.Replace(prefix, string.Empty);
        }

        public static bool IsAuthenticated(string prefix)
        {
            var current = HttpContext.Current;
            return (current.User.Identity.IsAuthenticated && 
                (current.User.Identity.Name.IndexOf(prefix, StringComparison.CurrentCulture) != -1));
        }

        public static void LoginByInfo(string info, bool persistent)
        {
            //LogoutUser();
            FormsAuthentication.Initialize();
            var ticket = new FormsAuthenticationTicket(1, info, DateTime.Now, DateTime.Now.AddMinutes(45.0),
                persistent, "", FormsAuthentication.FormsCookiePath);
            Trace.Write(FormsAuthentication.FormsCookiePath + FormsAuthentication.FormsCookieName);
            var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, FormsAuthentication.Encrypt(ticket));
            HttpContext.Current.Response.SetCookie(cookie);
        }
        
        public static void LogoutUser(string userInfo)
        {
            HttpContext.Current.Items.Remove(userInfo);
            HttpContext.Current.Session.Clear();
            HttpContext.Current.Session.Abandon();
            FormsAuthentication.SignOut();
        }
    }

    public static class SessionFacade
    {
        public static int UserId
        {
            get
            {
                if (HttpContext.Current.Session["UserId"] == null)
                    HttpContext.Current.Session["UserId"] = 0;
                return (int)HttpContext.Current.Session["UserId"];
            }
            set
            {
                HttpContext.Current.Session["UserId"] = value;
            }
        }
    }
}

