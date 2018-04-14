using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using HM.Model;
using HM.Util;
using HM.Services;

using HM.Common;

namespace HMShop.UserControls
{
    public partial class Profile : System.Web.UI.UserControl
    {
        List<LinkInfo> lstLink = new List<LinkInfo>();
        string userName = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if(HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                    userName = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;

                if (!IsPostBack) // Important: If remove check, when update shopping cart will lose value quantity.
                {
                    BindProfile(userName);
                }
            }
            catch (Exception ex)
            {
                var url = Page.ResolveClientUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        public void BindProfile(string userName)
        {
            if (!string.IsNullOrEmpty(userName))
            {
                lstLink = new List<LinkInfo>
                {
                    new LinkInfo { Url = Page.ResolveUrl("~/Customer/Profile.aspx"), Text = "Tài khoản" },
                    new LinkInfo { Url = Page.ResolveUrl("~/Customer/OrderListByCust.aspx"), Text = "Đơn hàng" }
                };
            }
            else
            {
                lstLink = new List<LinkInfo>
                {
                    new LinkInfo { Url = Page.ResolveUrl("~/Login.aspx"), Text = "Đăng nhập" },
                    new LinkInfo { Url = Page.ResolveUrl("~/SignUp.aspx"), Text = "Đăng ký" }
                };
            }
            
            rptProfile.DataSource = lstLink;
            rptProfile.DataBind();
        }

        protected void rptProfile_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                if (lstLink.Count < 0) return;

                if (e.Item.ItemType == ListItemType.Footer)
                {
                    var btnLogInOut = (Button)e.Item.FindControl("btnLogInOut");
                    if (!string.IsNullOrEmpty(userName))
                    {
                        btnLogInOut.Visible = true;
                        btnLogInOut.Text = "Đăng xuất";
                        //btnLogInOut.Click += BtnLogOut_Click;
                    }
                    else
                    {
                        btnLogInOut.Visible = false;
                        btnLogInOut.Text = string.Empty;
                    }
                }
            }
            catch (Exception ex)
            {
                var url = Page.ResolveClientUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void rptProfile_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "logout")
                {
                    AuthenUtils.LogoutUser(SessionConfig.ADMIN_INFO);
                    Response.Redirect(Request.RawUrl, false);
                    Context.ApplicationInstance.CompleteRequest();
                }
            }
            catch (Exception ex)
            {
                var url = Page.ResolveClientUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        private void BtnLogOut_Click(object sender, EventArgs e)
        {
            try
            {
                AuthenUtils.LogoutUser(SessionConfig.ADMIN_INFO);
                Response.Redirect(Request.RawUrl, false);
                Context.ApplicationInstance.CompleteRequest();
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }
    }
}