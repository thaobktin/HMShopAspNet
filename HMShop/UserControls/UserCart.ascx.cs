using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HM.Services;
using HM.Util;
using HM.Model;


namespace HMShop.UserControls
{
    public partial class UserCart : System.Web.UI.UserControl
    {
        double sumPrice = 0.0;
        List<ShopCartInfo> shopCartBind;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var productId = string.IsNullOrEmpty(Request.QueryString["ProductID"])
                    ? -1 : int.Parse(Request.QueryString["ProductID"]);
                //var cartGuid = CreateCartGuid.GetCartGUID();
                var cartGuid = CreateCartGuid.GetCartID();
                
                if (!IsPostBack) // Important: If remove check, when update shopping cart will lose value quantity.
                {
                    UserCart_BindShopCart(cartGuid);
                }
                
            }
            catch (Exception ex)
            {
                var url = Page.ResolveClientUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }
        
        public void UserCart_BindShopCart(string cartGuid)
        {
            if (string.IsNullOrEmpty(cartGuid)) return;

            var shopCartService = new ShopCartService();
            shopCartBind = shopCartService.ReadByGuid(cartGuid);
            //if (shopCartBind.Count() == 0)
            //{
                
            //}
            rptCarts.DataSource = shopCartBind;
            rptCarts.DataBind();
        }

        protected void rptCarts_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                if (shopCartBind == null || shopCartBind.Count == 0) return;

                if (e.Item.ItemType == ListItemType.Header)
                {
                    var lblHeadProduct = (Label)e.Item.FindControl("lblHeaderProduct");
                    lblHeadProduct.Visible = true;
                    var lblHeadQuantity = (Label)e.Item.FindControl("lblHeaderQuantity");
                    lblHeadQuantity.Visible = true;
                    var lblHeadPrice = (Label)e.Item.FindControl("lblHeaderPrice");
                    lblHeadPrice.Visible = true;
                }

                var quantity = (Label)e.Item.FindControl("lblQuantity");
                //var lblPrice = (Label)e.Item.FindControl("lblPrice");
                var hidPrice = (HiddenField)e.Item.FindControl("hidPrice");
                if (hidPrice != null)
                {
                    sumPrice += double.Parse(hidPrice.Value) * int.Parse(quantity.Text);
                }

                if (e.Item.ItemType == ListItemType.Footer)
                {
                    var lblFooterSumPrice = (Label)e.Item.FindControl("lblFooterSumPrice");
                    lblFooterSumPrice.Visible = true;
                    lblFooterSumPrice.Text = "Tổng tiền";
                    var lblSumPrice = (Label)e.Item.FindControl("lblSumPrice");
                    lblSumPrice.Visible = true;
                    lblSumPrice.Text = string.Format("{0:0,000,000}", sumPrice);

                    var btnViewCart = (Button)e.Item.FindControl("btnViewCart");
                    btnViewCart.Visible = true;
                    var btnPay = (Button)e.Item.FindControl("btnPay");
                    btnPay.Visible = true;
                }
            }
            catch(Exception ex)
            {
                var url = Page.ResolveClientUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void btnViewCart_Click(object sender, EventArgs e)
        {
            try
            {
                var url = Page.ResolveClientUrl("~/ShoppingCart.aspx");
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
            catch (Exception ex)
            {
                var url = Page.ResolveClientUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            try
            {
                var url = string.Empty;
                if (Request.Cookies[".HMShopFormAuth"] != null)
                {
                    url = Page.ResolveUrl("~/Customer/OrderAddNew.aspx");
                }
                else
                {
                    url = Page.ResolveClientUrl("~/Login.aspx");
                }
                
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
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