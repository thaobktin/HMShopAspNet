using System;
using HM.Services;
using HM.Util;
using HM.Control;
using HM.Common;

namespace HMShop.Qwerty.Systems
{
    public partial class UserChangePassManager : AdminControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmdUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                if (SecurityUtil.MD5Encrypt(txtCurPwd.Text) != CurrentAdminInfo.Password)
                {
                    lblUpdateStatus.Text = "<font color='red'>Mật khẩu cũ không đúng !</red>";
                    return;
                }
                CurrentAdminInfo.Password = SecurityUtil.MD5Encrypt(txtNewPwd.Text);
                var mainUserService = new MainUserService();
                mainUserService.Update(CurrentAdminInfo);
                lblUpdateStatus.Text = AlertConfig.UPDATE_SUCCESS;
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void cmdBack_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect(BackUrl);
                Response.Redirect(BackUrl, false);
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