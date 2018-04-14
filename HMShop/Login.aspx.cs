using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using HM.Model;
using HM.Services;
using HM.Control;
using HM.Common;
using HM.Util;


namespace HMShop
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtUserName.Focus();
        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            var materPage = (BaseMasterPage)Page.Master;
            var backUrl = materPage.BackUrl;

            if (IsValid)
            {
                try
                {
                    if (string.IsNullOrEmpty(txtUserName.Text)
                    || string.IsNullOrEmpty(txtPassWord.Text))
                    {
                        lblMessage.Visible = true;
                        lblMessage.Text = "Thiếu tài khoản hoặc mật khẩu!";
                        return;
                    }

                    var userService = new UserService();
                    var user = userService.CheckUser(txtUserName.Text, txtPassWord.Text);
                    if (!string.IsNullOrEmpty(user.ID))
                    {
                        //Tạo cookie với userName đăng nhập
                        AuthenUtils.LoginByInfo(PathConfig.PREFIX + txtUserName.Text, true);

                        if (backUrl == "/SignUp.aspx" || backUrl == "/Login.aspx")
                        {
                            backUrl = "/Default.aspx";
                        }
                        Response.Redirect(backUrl, false);
                        Context.ApplicationInstance.CompleteRequest();
                    }
                    else
                    {
                        lblMessage.Text = "Thông tin đăng nhập không chính xác";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
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
}