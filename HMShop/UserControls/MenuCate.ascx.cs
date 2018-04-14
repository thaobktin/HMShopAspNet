using System;
using System.Data;
using System.Web.UI.WebControls;
using HM.Services;

namespace HMShop.UserControls
{
    public partial class MenuCate : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindCategoryData();
                }
            }
            catch (Exception ex)
            {
                var url = Page.ResolveClientUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        void BindCategoryData()
        {
            var categoryService = new CategoryService();
            var list = categoryService.ReadByEnable(true);
            rptCategories.DataSource = list;
            rptCategories.DataBind();
        }
    }
}