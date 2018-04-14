using System;
using System.Data;
using System.Web.UI.WebControls;
using HM.Services;
using HM.Util;
using HM.Common;
using HM.Control;


namespace HMShop.Qwerty.Products
{
    public partial class ListProductManager : AdminControl
    {
        //int index = 0;

        public int DataListCurrPageIndex
        {
            get
            {
                if (ViewState["index"] == null)
                    return 0;
                else
                    return Convert.ToInt32(ViewState["index"].ToString());
            }
            set
            {
                ViewState["index"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    DataListCurrPageIndex = 1;
                    BindProductByName();
                }
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            try
            {
                var url = PathConfig.ADMIN_CMD + CmdConfig.PRODUCT_DETAIL_PRODUCT;
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }
        
        protected void dtgProducts_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemIndex < 0) return;
                var cmdDelCtrl = (Button)e.Item.FindControl("cmdDel");
                if (cmdDelCtrl != null)
                {
                    cmdDelCtrl.Attributes.Add("onclick", AlertConfig.DELETE_CONFIRM);
                }
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void dtgProducts_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            try
            {
                var productId = string.IsNullOrEmpty(e.Item.Cells[0].Text) ? "" : e.Item.Cells[0].Text;
                if (e.CommandName == "edit")
                {
                    var url = PathConfig.ADMIN_CMD + CmdConfig.PRODUCT_DETAIL_PRODUCT + "&productid=" + productId;
                    Response.Redirect(url, false);
                    Context.ApplicationInstance.CompleteRequest();
                }

                var productService = new ProductService();
                if (e.CommandName == "del")
                {
                    productService.Delete(productId);
                    lblError.Text = AlertConfig.UPDATE_SUCCESS;
                }
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        void BindProductByName()
        {
            var productService = new ProductService();
            var list = productService.ReadAll();

            if (list == null) return;

            if(list.Count > 0)
            {
                dtgProducts.Visible = true;
                dtgProducts.DataSource = list;
                dtgProducts.DataBind();
            }
        }
    }
}