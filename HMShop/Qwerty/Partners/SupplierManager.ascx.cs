using System;
using System.Web.UI.WebControls;
using HM.Common;
using HM.Services;
using HM.Model;
using HM.Control;

namespace HMShop.Qwerty.Partners
{
    public partial class SupplierManager : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblStatus.Text = string.Empty;
                if (!IsPostBack)
                {
                    txtId.Attributes["value"] = txtId.Text;
                    txtId.Attributes.Add("readonly", "readonly");
                }
                ResetInput();
                BindGridSupplier();
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
                var supplierService = new SupplierService();
                var supplierID = string.IsNullOrEmpty(txtId.Text) ? "" : txtId.Text;
                var supplierInfo = supplierService.ReadById(supplierID);
                if (supplierInfo == null) return;

                supplierInfo.Name = txtName.Text.Trim();
                var retUpd = supplierService.Update(supplierInfo);

                ResetInput();
                if (retUpd)
                {
                    BindGridSupplier();
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
                var supplierService = new SupplierService();
                var info = new SupplierInfo
                {
                    Name = txtName.Text.Trim(),
                    Address = txtAddress.Text.Trim(),
                    Phone = txtPhone.Text.Trim(),
                    Fax = txtFax.Text.Trim(),
                    Website = txtWebsite.Text.Trim()
                };

                var retIns = supplierService.Create(info);
                if (!string.IsNullOrEmpty(retIns))
                {
                    txtId.Text = retIns.ToString();
                    lblStatus.Text = AlertConfig.CREATE_SUCCESS;
                    BindGridSupplier();
                } 
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

        protected void dtgSuppliers_ItemDataBound(object sender, DataGridItemEventArgs e)
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

        protected void dtgSuppliers_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            try
            {
                var supplierService = new SupplierService();
                var supplierId = string.IsNullOrEmpty(e.Item.Cells[0].Text) ? "" : e.Item.Cells[0].Text;
                if (e.CommandName == "edit")
                {
                    var supplierInfo = supplierService.ReadById(supplierId);
                    if (supplierInfo == null)
                    {
                        cmdEmpty_Click(null, null); return;
                    }

                    txtId.Text = supplierInfo.ID;
                    txtName.Text = supplierInfo.Name;
                    txtAddress.Text = supplierInfo.Address;
                    txtPhone.Text = supplierInfo.Phone;
                    txtFax.Text = supplierInfo.Fax;
                    txtWebsite.Text = supplierInfo.Name;
                }

                if (e.CommandName == "del")
                {
                    var retDel = supplierService.Delete(supplierId);
                    if (retDel)
                    {
                        BindGridSupplier();
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

        void BindGridSupplier()
        {
            var supplierService = new SupplierService();
            dtgSuppliers.DataSource = supplierService.ReadAll();
            dtgSuppliers.DataBind();
        }

        void ResetInput()
        {
            txtId.Text = string.Empty;
            txtName.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtPhone.Text = string.Empty;
            txtWebsite.Text = string.Empty;
        }

        #endregion
    }
}