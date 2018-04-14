using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HM.Common;


namespace HM.Control
{
    public class BasePage : System.Web.UI.Page
    {
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            if (!this.Page.IsPostBack)
            {
                this.BackUrl = this.CurrUrl;
                this.CurrUrl = base.Request.RawUrl;
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
