using System;
using HM.Common;
using HM.Model;
using HM.Util;
using HM.Services;


namespace HM.Control
{
    public class BaseAuthenPage : System.Web.UI.Page
    {
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            if (AuthenUtils.IsAuthenticated(PathConfig.PREFIX))
            {
                var userServie = new UserService();
                var userName = AuthenUtils.GetUserOrEmail(PathConfig.PREFIX);
                var userInfo = userServie.ReadByUserName(userName);
                if (!string.IsNullOrEmpty(userInfo.ID))
                {
                    if (this.CurrUser == null)
                    {
                        this.CurrUser = userServie.ReadByUserName(userName);
                    }
                }
                else
                {
                    base.Response.Redirect(PathConfig.PATH + "Login.aspx");
                }
            }
            else
            {
                base.Response.Redirect(PathConfig.PATH + "Login.aspx");
            }

            if (!this.Page.IsPostBack)
            {
                this.BackUrl = this.CurrUrl;
                this.CurrUrl = base.Request.RawUrl;
            }
        }

        public UserInfo CurrentUser
        {
            get
            {
                return Session[SessionConfig.USER_INFO] == null ? null : (UserInfo)(Session[SessionConfig.USER_INFO]);
            }

            set
            {
                if (value == null)
                    Session.Remove(SessionConfig.USER_INFO);
                else
                    Session[SessionConfig.USER_INFO] = value;
            }
        }

        public UserInfo CurrUser
        {
            get
            {
                return this.Context.Items[SessionConfig.USER_INFO] == null ? null : (UserInfo)this.Context.Items[SessionConfig.USER_INFO];
            }
            set
            {
                this.Context.Items.Remove(SessionConfig.USER_INFO);
                this.Context.Items.Add(SessionConfig.USER_INFO, value);
            }
        }

        public string BackUrl
        {
            get
            {
                if (this.Session[SessionConfig.BACK_URL] != null)
                {
                    return (string)this.Session[SessionConfig.BACK_URL];
                }
                return PathConfig.PATH;
            }
            set
            {
                this.Session[SessionConfig.BACK_URL] = value;
            }
        }

        public string CurrUrl
        {
            get
            {
                if (this.Session[SessionConfig.CURRENT_URL] != null)
                {
                    return (string)this.Session[SessionConfig.CURRENT_URL];
                }
                return PathConfig.PATH;
            }
            set
            {
                this.Session[SessionConfig.CURRENT_URL] = value;
            }
        }
    }
}