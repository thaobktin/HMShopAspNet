using System;
using System.Data;
using System.Web.UI;
using HM.Control;
using HM.Services;

namespace HMShop
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var request = Request.QueryString["CategoryID"];
                var categoryId = string.IsNullOrEmpty(request) ? "" : request;
                if (!IsPostBack)
                {
                    if(string.IsNullOrEmpty(categoryId))
                    {
                        BindProduct();
                    }
                    else
                    {
                        BindProductByCategory(categoryId);
                    }
                }
                Form.DefaultButton = btnSearch.UniqueID;
                txtSearch.Focus();
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
            
            Page.MaintainScrollPositionOnPostBack = true;
        }

        private void Page_Error(object sender, EventArgs e)
        {
            // Get last error from the server.
            var exc = Server.GetLastError();

            // Handle specific exception.
            if (exc is InvalidOperationException)
            {
                // Pass the error on to the error page.
                Server.Transfer("~/LogPages/HttpErrorPage.aspx?handler=Page_Error-Default.aspx", true);
            }
        }

        void BindProduct()
        {
            var productService = new ProductService();
            var listProd = productService.ReadAll();
            dtlProduct.Controls.Clear();

            colPager.PageSize = 20;
            colPager.DataSource = listProd;
            colPager.BindToControl = dtlProduct;
            dtlProduct.DataSource = colPager.DataSourcePaged;
            dtlProduct.DataBind();
        }

        void BindProductByCategory(string categoryId)
        {
            var productService = new ProductService();
            var list = productService.ReadByCategoryId(categoryId);
            dtlProduct.Controls.Clear();
            dtlProduct.DataSource = list;
            dtlProduct.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                SearchProduct(txtSearch.Text);
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        void SearchProduct(string criteria)
        {
            var productService = new ProductService();
            var list = productService.ReadByCreteria(criteria);
            dtlProduct.DataSource = list;
            dtlProduct.DataBind();
            if (dtlProduct.Items.Count != 0)
                lblSearchResult.Text = "Các sản phẩm bạn cần tìm:";
            else
                lblSearchResult.Text = "Không tìm thấy sản phẩm";
        }
    }
}