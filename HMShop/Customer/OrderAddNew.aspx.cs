using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using HM.Model;
using HM.Services;
using HM.Util;
using HM.Control;
using HM.Model.Enumerations;

namespace HMShop.Customer
{
    public partial class OrderAddNew : BaseAuthenPage
    {
        OrderInfo order = null;
        decimal sumPrice;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    var lblUserName = (Literal)Master.FindControl("litUserName");
                    lblUserName.Text = base.CurrUser.FullName;

                    BindShopCart();
                }
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        void BindShopCart()
        {
            var cartGuid = CreateCartGuid.GetCartID();
            var shopCartService = new ShopCartService();
            var shopCart = shopCartService.ReadByGuid(cartGuid);
            grShopCart.DataSource = shopCart;
            grShopCart.DataBind();
        }

        protected void grShopCart_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                sumPrice += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "Price"));
            }
            //lblTotal.Text = string.Format("{0:0,000,000}", sumPrice.ToString()) + "đ";
            lblTotal.Text = sumPrice.ToString("0,0", CultureInfo.InvariantCulture) + "đ";
        }
        
        protected void btnContinue_Click(object sender, EventArgs e)
        {
            var reqUrl = Request.Url;

            var url = Page.ResolveUrl("~/Default.aspx");
            Response.Redirect(url, false);
            Context.ApplicationInstance.CompleteRequest();
        }

        protected void btnSendOrder_Click(object sender, EventArgs e)
        {
            try
            {
                var prods = new ProductInfo[grShopCart.Rows.Count];

                foreach (GridViewRow grow in grShopCart.Rows)
                {
                    if (grow.RowType == DataControlRowType.DataRow)
                    {
                        var product = new ProductInfo
                        {
                            ID = grShopCart.DataKeys[grow.DataItemIndex].Values["Product.ID"].ToString(),
                            Name = ((Label)grow.FindControl("lblProductName")).Text,
                            /*Quantity = int.Parse(((Label)grow.FindControl("lblAmount")).Text),*/
                            Price = Convert.ToInt32(((HiddenField)grow.FindControl("hidPrice")).Value)
                        };

                        prods.SetValue(product, grow.DataItemIndex);
                    }
                }

                //Giả lập tạo TransactionID
                order.DealID = Guid.NewGuid().ToString();
                order.Status = OrderStatus.Waiting;
                order.User.ID = CurrUser.ID;

                var orderService = new OrderService();
                var orderId = orderService.Create(order);
                if(string.IsNullOrEmpty(orderId))
                {
                    lblMessage.Text = "Có lỗi sảy ra trong quá trình đặt hàng";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                var wasSuccess = string.Empty;
                foreach(var prod in prods)
                {
                    var orderDetailInfo = new OrderDetailInfo
                    {
                        OrderID = orderId,
                        Product = new ProductInfo
                        {
                             ID = prod.ID
                        }
                        /*Amount = prod.Product_Quantity*/
                    };
                    var orderDetailService = new OrderDetailService();
                    wasSuccess = orderDetailService.Create(orderDetailInfo);
                }

                if(!string.IsNullOrEmpty(wasSuccess))
                {
                    CreateCartGuid.RemoveCartId();
                    var url = Page.ResolveUrl("~/Default.aspx");
                    Response.Redirect(url, false);
                    Context.ApplicationInstance.CompleteRequest();
                    //lblMessage.Text = "Đặt hàng thành công";
                    //lblMessage.ForeColor = System.Drawing.Color.Blue;
                    //return;
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