using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HM.Model;
using HM.Services;
using HM.Control;
using System.Globalization;

namespace HMShop.Customer
{
    public partial class OrderDetailByCust : BaseAuthenPage
    {
        decimal sumPrice;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    var lblUserName = (Literal)Master.FindControl("litUserName");
                    lblUserName.Text = base.CurrUser.FullName;

                    BindOrderDetail(base.CurrUser.ID);
                }
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void grOrderDetail_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                sumPrice += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Product_Price"));
            }
            lblSumPrice.Text = sumPrice.ToString("0,0", CultureInfo.InvariantCulture) + " đ";
        }

        void BindOrderDetail(string userId)
        {
            var orderId = Request.QueryString["OrderId"];
            var dealId = Request.QueryString["DealId"];

            var orderDetailService = new OrderDetailService();
            var dt = orderDetailService.ReadDetail(orderId, dealId, userId);
            grOrderDetail.DataSource = dt;
            grOrderDetail.DataBind();
            lblOrderId.Text = Request.QueryString["OrderId"];
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            //var materPage = (BaseMasterPage)Page.Master;
            //var url = materPage.BackUrl;
            var url = Page.ResolveUrl("~/OrderListByCust.aspx");
            Response.Redirect(url, false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}