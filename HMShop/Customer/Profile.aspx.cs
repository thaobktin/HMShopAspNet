using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HM.Services;
using HM.Model;
using HM.Control;


namespace HMShop.Customer
{
    public partial class Profile : BaseAuthenPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    var lblUserName = (Literal)Master.FindControl("litUserName");
                    lblUserName.Text = base.CurrUser.FullName;

                    BindProfile();
                }
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        void BindProfile()
        {
            txtFullName.Text = CurrUser.FullName;
            txtLoginName.Text = CurrUser.UserName;
            txtEmail.Text = CurrUser.Email;
            txtAddress.Text = CurrUser.Address;
            txtPhone.Text = CurrUser.Phone;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                if(txtPassWord.Text != txtRePass.Text)
                {
                    lblMessage.Text = "Mật khẩu không khớp nhau!";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                CurrUser.FullName = txtFullName.Text.Trim();
                CurrUser.UserName = txtLoginName.Text;
                CurrUser.Email = txtEmail.Text;
                CurrUser.Password = txtPassWord.Text;
                CurrUser.Address = txtAddress.Text;
                CurrUser.Phone = txtPhone.Text;

                var userService = new UserService();
                var success = userService.Update(CurrUser);
                if (success)
                {
                    //var url = Page.ResolveUrl("~/Default.aspx");
                    //Response.Redirect(url, false);
                    lblMessage.Text = "Cập nhật thành công";
                    lblMessage.ForeColor = System.Drawing.Color.Blue;
                    return;
                }
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