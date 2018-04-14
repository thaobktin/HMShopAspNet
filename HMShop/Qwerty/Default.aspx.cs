using System;
using System.IO;
using HM.Services;
using HM.Model;
using HM.Util;
using HM.Common;
using HM.Control;

namespace HMShop.Qwerty
{
    public partial class Default : AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var user = Context.User.Identity.Name;
                //if (!Page.IsPostBack)
                //{
                //lblErrorMessage.Text = string.Empty;
                LoadPersonal();
                LoadControls();
                litUserName.Text = CurrAdmin.FullName.Trim();
                //}
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        /// <summary>
        /// assign value to title page must process here.
        /// </summary>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            //var litTit = (Literal)this.FindControl("litTitle");
            //if (litTit != null) litTit.Text = Title;
            litTitle.Text = Title;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            try
            {
                AuthenUtils.LogoutUser(SessionConfig.ADMIN_INFO);
                //Response.Redirect(Request.RawUrl);
                Response.Redirect(Request.RawUrl, false);
                Context.ApplicationInstance.CompleteRequest();
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=Login.aspx " + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        #region Helpers

        public void LoadPersonal()
        {
            hypSetting.Text = "<i class=\"icon-cog\"></i>Thiết lập";
            hypSetting.NavigateUrl = PathConfig.ADMIN_CMD + "system_setting";

            hypPersonal.Text = "<i class=\"icon-user\"></i>Trang cá nhân";
            hypPersonal.NavigateUrl = PathConfig.ADMIN_CMD + "system_userprofile";
        }
        
        public void LoadControls()
        {
            string cmd = string.Empty;
            if (string.IsNullOrEmpty(Request.QueryString[CmdConfig.CMD_ROOT]))
            {
                cmd = string.Empty;
                return;
            }
            else
            {
                cmd = Request.QueryString[CmdConfig.CMD_ROOT];
            }
            
            if (cmd == CmdConfig.ACCESS_DENY)
            {
                placeControls.Controls.Add(LoadControl(PathConfig.SYSTEM_PATH + "AccessDeny.ascx"));
                return;
            }

            var mainCmdService = new MainCmdService();
            var cmdInfo = mainCmdService.ReadByCmd(cmd);

            if (string.IsNullOrEmpty(cmdInfo.Name))
            {
                Response.Redirect(PathConfig.ADMIN_ACCESSDENY, false);
                Context.ApplicationInstance.CompleteRequest();
            }

            litCommandName.Text = cmdInfo.Name;
            var mainUserCmdService = new MainUserCmdService();
            var mainUserCmd = new MainUserCmdInfo()
            {
                UserID = CurrAdmin.ID,
                CmdID = cmdInfo.ID
            };
            if ((!CurrAdmin.SuperAdmin)
                && (!mainUserCmdService.CheckRole(mainUserCmd)))
            {
                Response.Redirect(PathConfig.ADMIN_ACCESSDENY, false);
                Context.ApplicationInstance.CompleteRequest();
            }

            if (PathCheckExist(PathConfig.ADMIN_PATH + cmdInfo.Path))
            {
                placeControls.Controls.Add(LoadControl(PathConfig.ADMIN_PATH + cmdInfo.Path));
                return;
            }

            lblErrorMessage.Text = "Không tìm thấy module, kiểm tra lại đường dẫn!";
            lblErrorMessage.Visible = true;
        }

        public bool PathCheckExist(string path)
        {
            bool ret = false;
            ret = File.Exists(Server.MapPath(path));

            return ret;
        }

        #endregion
    }
}