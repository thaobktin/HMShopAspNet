using System;
using System.Web.UI.WebControls;
using HM.Common;
using HM.Services;
using HM.Model;
using HM.Control;

namespace HMShop.Qwerty.Products
{
    public partial class CategoryManager : AdminControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblStatus.Text = string.Empty;
                if (!IsPostBack)
                {
                    txtCategoryId.Attributes["value"] = txtCategoryId.Text;
                    txtCategoryId.Attributes.Add("readonly", "readonly");
                }
                ResetInput();
                BindGridCategory();
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }
        
        protected void cmdUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                var categoryService = new CategoryService();
                var categoryID = string.IsNullOrEmpty(txtCategoryId.Text) ? "" : txtCategoryId.Text;
                var categoryInfo = categoryService.ReadById(categoryID);
                if (categoryInfo == null) return;

                categoryInfo.Name = txtCategoryName.Text.Trim();
                var retUpd = categoryService.Update(categoryInfo);

                ResetInput();
                if (retUpd)
                {
                    BindGridCategory();
                    lblStatus.Text = AlertConfig.UPDATE_SUCCESS;
                }
                else
                {
                    lblStatus.Text = AlertConfig.UPDATE_ERROR;
                }
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }
        
        protected void cmdAddNew_Click(object sender, EventArgs e)
        {
            try
            {
                var info = new CategoryInfo
                {
                    Name = txtCategoryName.Text.Trim(),
                };

                var categoryService = new CategoryService();
                var retIns = categoryService.Create(info);
                if (!string.IsNullOrEmpty(retIns)) txtCategoryId.Text = retIns;

                lblStatus.Text = AlertConfig.UPDATE_SUCCESS;
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void cmdEmpty_Click(object sender, EventArgs e)
        {
            ResetInput();
        }

        protected void dtgCategories_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemIndex < 0) return;
                var cmdDel = (Button)e.Item.FindControl("cmdDel");
                if (cmdDel != null)
                {
                    cmdDel.Attributes.Add("onclick", AlertConfig.DELETE_CONFIRM);
                }
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void dtgCategories_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            try
            {
                var categoryService = new CategoryService();
                var categoryId = string.IsNullOrEmpty(e.Item.Cells[0].Text) ? "" : e.Item.Cells[0].Text;
                if (e.CommandName == "edit")
                {
                    var categoryInfo = categoryService.ReadById(categoryId);
                    if (categoryInfo == null)
                    {
                        cmdEmpty_Click(null, null); return;
                    }

                    txtCategoryId.Text = categoryInfo.ID;
                    txtCategoryName.Text = categoryInfo.Name;
                }

                if (e.CommandName == "del")
                {
                    var retDel = categoryService.Delete(categoryId);
                    if (retDel)
                    {
                        BindGridCategory();
                        lblStatus.Text = AlertConfig.UPDATE_SUCCESS;
                    }
                    
                    cmdEmpty_Click(null, null);
                }
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        #region Helpers

        void BindGridCategory()
        {
            var categoryService = new CategoryService();
            dtgCategories.DataSource = categoryService.ReadByEnable(true);
            dtgCategories.DataBind();
        }

        void ResetInput()
        {
            txtCategoryId.Text = string.Empty;
            txtCategoryName.Text = string.Empty;
        }

        #endregion
    }
}