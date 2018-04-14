using System;
using System.Collections.Generic;
using HM.Control;
using HM.Services;
using HM.Util;
using HM.Model;

namespace HMShop
{
    public partial class ProductDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string productId = "";
                if (!string.IsNullOrEmpty(Request.QueryString["productid"]))
                {
                    productId = Request.QueryString["productid"];
                }

                if (!IsPostBack)
                {
                    BindProductDetail(productId);
                }
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        void BindProductDetail(string productId)
        {
            var productService = new ProductService();
            var product = productService.ReadById(productId);
            if (product != null)
            {
                imgProd.ImageUrl = "~/HttpHandlers/DisplayProductImage.ashx?ProductImageID=" + product.Image.ID;
                lblProdName.Text = product.Name;
                lblProdPrice.Text = string.Format("{0:0,000,000}", product.Price) + "đ";
                //bind to ddl quantity
                lblQuan.Text = "Số lượng";
                ddlQuantity.DataSource = new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
                ddlQuantity.DataBind();
                lblDescription.Text = product.Description;
            }
            else
            {
                imgProd.ImageUrl = "/Assets/images/NoImage.jpg";
            }
        }
        
        protected void btnBuy_Click(object sender, EventArgs e)
        {
            try
            {
                var productId = string.IsNullOrEmpty(Request.QueryString["ProductID"])
                    ? -1 : int.Parse(Request.QueryString["ProductID"]);
                var quantity = ddlQuantity.SelectedValue;
                var url = Page.ResolveUrl(string.Format("~/ShoppingCart.aspx?productid={0}&quantity={1}", productId, quantity));
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
            catch(Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }
    }
}