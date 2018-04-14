using System;
using System.Data;
using System.Web;
using System.Web.UI.WebControls;
using HM.Services;
using HM.Control;


namespace HMShop.Qwerty.Products
{
    public partial class ThumbProductManager : AdminControl
    {
        //int index = 0;
        public int CurrentPageIndex
        {
            get
            {
                if (ViewState["PageNumber"] == null)
                    return 0;
                else
                    return Convert.ToInt32(ViewState["PageNumber"].ToString());
            }
            set
            {
                ViewState["PageNumber"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                CurrentPageIndex = 1;
                if (!IsPostBack)
                    BindImgProduct();
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        private void BindImgProduct()
        {
            var productService = new ProductService();
            var list = productService.ReadAll();

            if (list == null) return;

            if (list.Count <= 0)
            {
                lnkNext.Visible = false;
                lnkPrev.Visible = false;
                return;
            }
            
            var _pageDataSource = new PagedDataSource
            {
                DataSource = list,
                AllowPaging = true,
                PageSize = 12,
                CurrentPageIndex = CurrentPageIndex
            };
            ViewState["LastPage"] = _pageDataSource.PageCount - 1;

            dtlProducts.DataSource = _pageDataSource;
            dtlProducts.DataBind();

            lnkPrev.Visible = !_pageDataSource.IsFirstPage;
            lnkNext.Visible = !_pageDataSource.IsLastPage;

            lnkFirst.Visible = !_pageDataSource.IsFirstPage;
            lnkLast.Visible = !_pageDataSource.IsLastPage;
        }

        protected void lnkFirst_Click(object sender, EventArgs e)
        {
            CurrentPageIndex = 0;
            BindImgProduct();
        }

        protected void lnkPrev_Click(object sender, EventArgs e)
        {
            CurrentPageIndex -= 1;
            BindImgProduct();
        }

        protected void lnkNext_Click(object sender, EventArgs e)
        {
            CurrentPageIndex += 1;
            BindImgProduct();
        }
        
        protected void lnkLast_Click(object sender, EventArgs e)
        {
            CurrentPageIndex = Convert.ToInt32(ViewState["LastPage"]);
            BindImgProduct();
        }
    }
}