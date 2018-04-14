using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HM.Services;

namespace HMShop.UserControls
{
    public partial class Statistic : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblOnline.Text = Application["UserOnline"].ToString();

                //var countAccess = StatisticBLL.StatisticGet();
                var countAccess = Application["CountVisit"].ToString();
                lblSumAccess.Text = countAccess;
            }
            catch (Exception ex)
            {
                var url = Page.ResolveClientUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }
    }
}