using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HM.Services;

namespace HMShop.UserControls
{
    public partial class TopProduct : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    DisplayTopProduct();
                }
            }
            catch (Exception ex)
            {
                var url = Page.ResolveClientUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        void DisplayTopProduct()
        {
            var productService = new ProductService();
            var topProducts = productService.ReadTop(10);
            dtlTopTenProduct.DataSource = topProducts;
            dtlTopTenProduct.DataBind();
        }
    }
}