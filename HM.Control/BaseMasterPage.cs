using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HM.Common;
using HM.Util;
using HM.Model;
using HM.Services;

namespace HM.Control
{
    public class BaseMasterPage: System.Web.UI.MasterPage
    {
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            //if (AuthenUtils.IsAuthenticated(PathConfig.PREFIX))
            //{
                var userService = new UserService();
                var userName = AuthenUtils.GetUserOrEmail(PathConfig.PREFIX);
                var userInfo = userService.ReadByUserName(userName);

                if (userInfo != null)
                {
                    if (!string.IsNullOrEmpty(userInfo.ID))
                    {
                        if (this.CurrUser == null)
                        {
                            this.CurrUser = userService.ReadByUserName(userName);
                        }
                    }
                }
            //}

            if (!this.Page.IsPostBack)
            {
                this.BackUrl = this.CurrUrl;
                this.CurrUrl = base.Request.RawUrl;
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
