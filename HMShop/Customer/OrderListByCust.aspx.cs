using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HM.Services;
using HM.Model;
using HM.Control;


namespace HMShop.Customer
{
    public partial class OrderListByCust : BaseAuthenPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    var lblUserName = (Literal)Master.FindControl("litUserName");
                    lblUserName.Text = base.CurrUser.FullName;

                    BindListOrder();
                }
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        void BindListOrder()
        {
            var orderService = new OrderService();
            var lstOrder = orderService.ReadByUserId(CurrUser.ID);
            grOrders.DataSource = lstOrder;
            grOrders.DataBind();
        }
        
        //protected void btnBack_Click(object sender, EventArgs e)
        //{
        //    //var materPage = (BaseMasterPage)Page.Master;
        //    //var url = materPage.BackUrl;
        //    var url = Page.ResolveUrl("~/Default.aspx");
        //    Response.Redirect(url, false);
        //    Context.ApplicationInstance.CompleteRequest();
        //}
    }
}