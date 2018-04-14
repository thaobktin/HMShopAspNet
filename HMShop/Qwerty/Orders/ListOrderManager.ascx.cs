using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HM.Services;
using HM.Common;
using HM.Control;

namespace HMShop.Qwerty.Orders
{
    public partial class ListOrderManager : AdminControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblError.Text = string.Empty;
                BindListOrder();
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
            var dt = orderService.ReadAll();
            dtgOrders.DataSource = dt;
            dtgOrders.DataBind();
        }

        protected void dtgOrders_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            try
            {
                var cmdName = e.CommandName;
                var dealIdVal = e.Item.Cells[0].Text; //dealId
                var orderIdVal = e.Item.Cells[1].Text;  //orderId
                //var orderId = string.IsNullOrEmpty(dealIdVal) ? -1 : Convert.ToInt32(dealIdVal);

                if (cmdName == "detail")
                {
                    var url = PathConfig.ADMIN_CMD + CmdConfig.ORDER_DETAIL_ORDER 
                        + "&dealid=" + dealIdVal + "&orderid=" + orderIdVal;
                    //Response.Redirect(url);
                    Response.Redirect(url, false);
                    Context.ApplicationInstance.CompleteRequest();
                }
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