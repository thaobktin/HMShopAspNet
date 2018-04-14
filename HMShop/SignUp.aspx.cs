using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HM.Services;
using HM.Model;
using HM.Control;

namespace HMShop
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtFullName.Focus();
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                try
                {
                    var user = new UserInfo
                    {
                        FullName = txtFullName.Text,
                        UserName = txtLoginName.Text,
                        Email = txtEmail.Text,
                        Password = txtPassWord.Text,
                        TypeSocial = "",
                        AppID = "",
                        Address = txtAddress.Text,
                        Phone = txtPhone.Text
                    };
                    var userService = new UserService();
                    var success = userService.Create(user);
                    
                    if (string.IsNullOrEmpty(success))
                    {
                        if ("-2" == success)
                        {
                            lblWel.Text = "Tên đăng nhập đã tồn tại!";
                            lblWel.ForeColor = System.Drawing.Color.Red;
                            return;
                        }

                        if ("-1" == success)
                        {
                            lblWel.Text = "Email đã được sử dụng để đăng ký!";
                            lblWel.ForeColor = System.Drawing.Color.Red;
                            return;
                        }

                        var url = Page.ResolveUrl("~/Login.aspx");
                        Response.Redirect(url, false);
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
}