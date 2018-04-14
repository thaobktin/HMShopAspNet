using System;
using HM.Model;
using HM.Data;
using HM.Util;
using HM.Common;
using HM.Services;

namespace HM.Control
{
    public class AdminPage : System.Web.UI.Page
    {
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            if (AuthenUtils.IsAuthenticated(PathConfig.ADMIN_PREFIX))
            {
                var mainUserService = new MainUserService();
                var email = AuthenUtils.GetUserOrEmail(PathConfig.ADMIN_PREFIX);
                var adminId = mainUserService.ReadByEmail(email).ID;
                if (!string.IsNullOrEmpty(adminId))
                {
                    if (this.CurrAdmin == null)
                    {
                        this.CurrAdmin = mainUserService.ReadByEmail(email);
                    }
                }
                else
                {
                    base.Response.Redirect(PathConfig.ADMIN_PATH + "Login.aspx");
                }
            }
            else
            {
                base.Response.Redirect(PathConfig.ADMIN_PATH + "Login.aspx");
            }

            if (!this.Page.IsPostBack)
            {
                this.BackUrl = this.CurrentUrl;
                this.CurrentUrl = base.Request.RawUrl;
            }
        }

        public MainUserInfo CurrAdmin
        {
            get
            {
                if (this.Context.Items[SessionConfig.ADMIN_INFO] != null)
                {
                    return (MainUserInfo)this.Context.Items[SessionConfig.ADMIN_INFO];
                }
                return null;
            }
            set
            {
                this.Context.Items.Remove(SessionConfig.ADMIN_INFO);
                this.Context.Items.Add(SessionConfig.ADMIN_INFO, value);
            }
        }

        public string BackUrl
        {
            get
            {
                if (this.Session[SessionConfig.ADMIN_BACK_URL] != null)
                {
                    return (string) this.Session[SessionConfig.ADMIN_BACK_URL];
                }
                return PathConfig.ADMIN_PATH;
            }
            set
            {
                this.Session[SessionConfig.ADMIN_BACK_URL] = value;
            }
        }

        public string CurrentUrl
        {
            get
            {
                if (this.Session[SessionConfig.ADMIN_CURRENT_URL] != null)
                {
                    return (string) this.Session[SessionConfig.ADMIN_CURRENT_URL];
                }
                return PathConfig.ADMIN_PATH;
            }
            set
            {
                this.Session[SessionConfig.ADMIN_CURRENT_URL] = value;
            }
        }

        new public string Title { get; set; }
    }
}