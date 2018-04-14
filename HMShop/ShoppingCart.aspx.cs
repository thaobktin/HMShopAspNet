using System;
using System.Collections.Generic;
using System.Linq;
using System.Globalization;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using HM.Control;
using HM.Services;
using HM.Model;
using HM.Util;

namespace HMShop
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
        decimal sumPrice;
        string cartGuid = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                cartGuid = CreateCartGuid.GetCartID();
                var productId = string.IsNullOrEmpty(Request.QueryString["ProductID"])
                    ? "" : Request.QueryString["ProductID"];
                
                if (!IsPostBack)
                {
                    if(!string.IsNullOrEmpty(productId))
                    {
                        var quantity = string.IsNullOrEmpty(Request.QueryString["quantity"])
                            ? -1 : int.Parse(Request.QueryString["quantity"]);

                        var shopCart = new ShopCartInfo
                        {
                            Product = new ProductInfo
                            {
                                ID = productId
                            },
                            Guid = cartGuid,
                            Amount = quantity
                        };
                        var shopCartService = new ShopCartService();
                        shopCartService.Create(shopCart);
                    }
                    grShopCart.PageSize = 10;
                    BindShopCart(cartGuid);
                }
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void grShopCart_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                sumPrice += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "Price"));
            }

            if(sumPrice > 0m)
            {
                lblTotal.Text = sumPrice.ToString("0,0", CultureInfo.InvariantCulture) + "đ";
            }
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            var url = Page.ResolveUrl("~/Default.aspx");
            Response.Redirect(url, false);
            Context.ApplicationInstance.CompleteRequest();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                foreach (GridViewRow row in grShopCart.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        var data = grShopCart.DataKeys[row.DataItemIndex];
                        var check = (CheckBox)row.FindControl("chkDel");
                        if (check.Checked)
                        {
                            var shopCartId = data.Values["ID"].ToString();
                            var shopCartService = new ShopCartService();
                            shopCartService.Delete(shopCartId);
                        }

                        var numProducts = (TextBox)row.FindControl("txtQuantity");
                        var newNumProd = int.Parse(numProducts.Text);
                        var firstNumProd = int.Parse(grShopCart.DataKeys[row.DataItemIndex].Value.ToString());
                        if (newNumProd != firstNumProd)
                        {
                            var shopCart = new ShopCartInfo
                            {
                                ID = data.Values["ID"].ToString(),
                                Amount = newNumProd
                            };
                            var shopCartService = new ShopCartService();
                            shopCartService.UpdateAmount(shopCart);
                        }
                    }
                }

                var userCart = (UserControls.UserCart)Master.FindControl("userCart");
                userCart.UserCart_BindShopCart(cartGuid);

                BindShopCart(cartGuid);

                int rowCount = grShopCart.Rows.Count;
                if (rowCount == 0)
                {
                    lblTotal.Text = "0 VND";
                    lblMessage.Text = "Bạn chưa có sản phẩm nào trong giỏ hàng";
                }
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }
        
        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            //Response.Cookies["ReturnURL"].Value = "~/Customer/OrderAddNew.aspx";
            var url = string.Empty;
            if(Request.Cookies[".HMShopFormAuth"] != null)
            {
                url = Page.ResolveUrl("~/Customer/OrderAddNew.aspx");
            }
            else
            {
                url = Page.ResolveUrl("~/Login.aspx?redirect=" + Request.Url.ToString());
            }
            
            Response.Redirect(url, false);
            Context.ApplicationInstance.CompleteRequest();
        }

        protected void btnReturnMain_Click(object sender, EventArgs e)
        {
            var url = Page.ResolveUrl("~/Default.aspx");
            Response.Redirect(url, false);
            Context.ApplicationInstance.CompleteRequest();
        }

        void BindShopCart(string cartGuid)
        {
            var shopCartService = new ShopCartService();
            var shopCart = shopCartService.ReadByGuid(cartGuid);
            if(shopCart.Count() == 0)
            {
                lblMessage.Visible = true;
                btnMain.Visible = true;
                lblMessage.Text = "Giỏ hàng của bạn còn trống";
                btnMain.Text = "Tiếp tục mua hàng";
                lblTota.Text = string.Empty; 
                btnContinue.Visible = false;
                btnUpdate.Visible = false;
                btnConfirm.Visible = false;
            }
            grShopCart.DataSource = shopCart;
            grShopCart.DataBind();
        }
    }
}