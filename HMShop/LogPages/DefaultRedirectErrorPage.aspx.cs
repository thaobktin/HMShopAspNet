using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HM.Util;

namespace HMShop.LogPages
{
    public partial class DefaultRedirectErrorPage : System.Web.UI.Page
    {
        protected HttpException ex = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Log the exception and notify system operators
            ex = new HttpException("defaultRedirect");
            ExceptionUtils.LogException(ex, "Caught in DefaultRedirectErrorPage");
            ExceptionUtils.NotifySystemOps(ex);
        }
    }
}