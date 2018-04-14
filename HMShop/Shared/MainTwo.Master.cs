using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HM.Common;
using HM.Services;
using HM.Util;
using HM.Control;


namespace HMShop.Shared
{
    public partial class MainTwo : BaseMasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ScriptManager.RegisterClientScriptBlock(this, Page.GetType(), "ToTheTop", "ToTopOfPage();", true);
                if (base.CurrUser != null) litUserName.Text = base.CurrUser.FullName;
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