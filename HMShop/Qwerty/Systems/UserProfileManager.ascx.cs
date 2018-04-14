using System;
using HM.Services;
using HM.Util;
using HM.Control;
using HM.Common;

namespace HMShop.Qwerty.Systems
{
    public partial class UserProfileManager : AdminControl
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            try
            {
                //if (!IsPostBack)
                //{
                txtAddress.Text = CurrentAdminInfo.Address;
                txtBirthDay.Text = CurrentAdminInfo.Birthday;
                txtEmail.Text = CurrentAdminInfo.Email;
                txtFullName.Text = CurrentAdminInfo.FullName;
                txtPhone.Text = CurrentAdminInfo.Phone;
                dropGender.SelectedIndex = -1;
                var gender = (CurrentAdminInfo.Gender) ? 1 : 0;
                MiscUtils.SetSelected(dropGender.Items, gender.ToString());
                //}
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
                CurrentAdminInfo.Email = txtEmail.Text.Trim();
                CurrentAdminInfo.FullName = txtFullName.Text;
                CurrentAdminInfo.Gender = (dropGender.SelectedValue == "1") ? true : false;
                CurrentAdminInfo.Address = txtAddress.Text;
                CurrentAdminInfo.Birthday = txtBirthDay.Text;
                CurrentAdminInfo.Phone = txtPhone.Text;

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

        protected void cmdBack_Click(object sender, System.EventArgs e)
        {
            try
            {
                //Response.Redirect(BackUrl);
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