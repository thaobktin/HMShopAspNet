using System;
using HM.Common;
using HM.Control;
using HM.Cache;

namespace HMShop.Qwerty.Systems
{
    public partial class SettingManager : AdminControl
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            try
            {
                lblStatusUpdate.Text = string.Empty;
                txtWebTitle.Text = CommonCache.WebTitle;
                txtMailServer.Text = CommonCache.MailServer;
                txtDefaultCacheExpire.Text = CommonCache.DefaultCacheExpire.ToString();
                txtMetaSearch.Text = CommonCache.MetaSearch;
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void cmdUpdate_Click(object sender, System.EventArgs e)
        {
            try
            {
                CommonCache.WebTitle = txtWebTitle.Text;
                CommonCache.MailServer = txtMailServer.Text;
                CommonCache.DefaultCacheExpire = Convert.ToDouble(txtDefaultCacheExpire.Text);
                CommonCache.MetaSearch = txtMetaSearch.Text;
                lblStatusUpdate.Text = AlertConfig.UPDATE_SUCCESS;
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void cmdBack_Click(object sender, System.EventArgs e)
        {
            //Response.Redirect(BackUrl);
            Response.Redirect(BackUrl, false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}