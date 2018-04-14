using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HM.Services;
using HM.Model;

namespace HMShop.UserControls
{
    public partial class MenuUser : System.Web.UI.UserControl
    {
        List<LinkInfo> lstLink = new List<LinkInfo>();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                //    userName = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;

                if (!IsPostBack) // Important: If remove check, when update shopping cart will lose value quantity.
                {
                    BindMenuUserData();
                }
            }
            catch (Exception ex)
            {
                var url = Page.ResolveClientUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        void BindMenuUserData()
        {
            //var dt = CategoryBLL.ReadCategoryByEnable(true);
            lstLink = new List<LinkInfo>
            {
                new LinkInfo { Url = Page.ResolveUrl("~/Customer/Profile.aspx"), Text = "Tài khoản" },
                new LinkInfo { Url = Page.ResolveUrl("~/Customer/OrderListByCust.aspx"), Text = "Đơn hàng" }
            };
            rptProfile.DataSource = lstLink;
            rptProfile.DataBind();
        }

        protected void rptProfile_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                if (lstLink.Count < 0) return;

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
                //if (e.CommandName == "logout")
                //{
                //    AuthenUtils.LogoutUser();
                //    Response.Redirect(Request.RawUrl, false);
                //    Context.ApplicationInstance.CompleteRequest();
                //}
            }
            catch (Exception ex)
            {
                var url = Page.ResolveClientUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }
    }
}