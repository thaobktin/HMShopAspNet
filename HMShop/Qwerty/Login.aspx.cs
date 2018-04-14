using System;
using System.Text;
using System.Web.Security;
using System.Net.Mail;
using HM.Services;
using HM.Util;
using HM.Common;
using HM.Model;

namespace HMShop.Qwerty
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Visible = false;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(txtUserLogIn.Text)
                || string.IsNullOrEmpty(txtPasswordLogIn.Text))
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = "Invalid Email or Password";
                    return;
                }

                //if (chkRememberMe.Checked)
                //{
                //    //remember password
                //}

                var mainUserService = new MainUserService();
                var mainUser = mainUserService.CheckUser(txtUserLogIn.Text, txtPasswordLogIn.Text);
                if (!string.IsNullOrEmpty(mainUser.ID))
                {
                    AuthenUtils.LoginByInfo(PathConfig.ADMIN_PREFIX + txtUserLogIn.Text, true);
                    //AuthenUtils.LoginByAdminUser(txtUserLogIn.Text, true);

                    var urlAdmin = Page.ResolveClientUrl(PathConfig.ADMIN_PATH);
                    Response.Redirect(urlAdmin, false);
                    Context.ApplicationInstance.CompleteRequest();
                    //FormsAuthentication.RedirectFromLoginPage("shopadmin", true);
                }
                else
                {
                    lblMessage.Visible = true;
                }
            }
            catch (Exception ex)
            {
                var url = Page.ResolveClientUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void btnResetPass_Click(object sender, EventArgs e)
        {
            try
            {
                var mainUserService = new MainUserService();
                var mainUserID = mainUserService.ReadByEmail(txtEmailReset.Text).ID;
                if (!string.IsNullOrEmpty(mainUserID))
                {
                    SendNewPasswordToUserByEmail(txtEmailReset.Text);
                }
                else
                {
                    lblMsgSendEmail.Visible = true;
                }
            }
            catch (Exception ex)
            {
                var url = Page.ResolveClientUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void lnkBtnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(txtEmailNew.Text) || string.IsNullOrEmpty(txtUserNew.Text)
                || string.IsNullOrEmpty(txtPasswordNew.Text) || string.IsNullOrEmpty(txtPasswordResetNew.Text))
                {
                    lblMessageNew.Visible = true;
                    lblMessageNew.Text = "Please enter full Information";
                    return;
                }

                if (txtPasswordNew.Text.Trim() != txtPasswordResetNew.Text.Trim())
                {
                    lblMessageNew.Visible = true;
                    lblMessageNew.Text = "Password incorrect!";
                    return;
                }

                if (!chkUserAgree.Checked)
                {
                    lblMessageNew.Visible = true;
                    lblMessageNew.Text = "Do you access User Agreement?";
                    return;
                }

                var mainUserInfo = new MainUserInfo
                {
                    Email = txtEmailNew.Text,
                    Password = txtPasswordNew.Text,
                    Address = "",
                    SuperAdmin = false
                };

                var mainUserService = new MainUserService();
                mainUserService.Create(mainUserInfo);
            }
            catch (Exception ex)
            {
                var url = Page.ResolveClientUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        public static bool checkLogin()
        {
            if (AuthenUtils.IsAuthenticated(PathConfig.ADMIN_PREFIX))
            {
                return true;
            }
            return false;
        }

        public bool SendNewPasswordToUserByEmail(string email)
        {
            return SendNewPasswordToUser(Membership.GetUserNameByEmail(email ?? String.Empty));
        }

        public bool SendNewPasswordToUser(string userName)
        {
            var mu = Membership.GetUser(userName ?? String.Empty);
            if (mu == null)
            {
                return false;
            }
            var password = mu.ResetPassword();
            EmailPassword(password, mu.Email);
            return true;
        }

        public void EmailPassword(string password, string toEmail)
        {
            var mailBody = string.Format("Your new password is {0}", password);
            SendEmail(toEmail);
        }

        public void SendEmail(string email)
        {
            try
            {
                var sb = new StringBuilder();
                sb.Append("Hi,<br/> Click on below given link to Reset Your Password<br/>");
                sb.Append("<a href=http://localhost:17090/ResetLink.aspx?username=" + email);
                sb.Append("&email=" + txtEmailReset.Text + ">Click here to change your password</a><br/>");
                sb.Append("<b>Thanks</b>,<br> Code Solution <br/>");
                sb.Append("<br/><b> for more post </b> <br/>");
                sb.Append("<br/><a href=http://huongmoon.com");
                sb.Append("thanks");

                var message = new MailMessage("huongmoon.com@gmail.com", email, "Reset Your Password", sb.ToString());
                using (var smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    Credentials = new System.Net.NetworkCredential("huongmoon.com@gmail.com", "987654321"),
                    EnableSsl = true
                })
                {
                    message.IsBodyHtml = true;
                    smtp.Send(message);
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

    }
}