using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using HM.Model;
using HM.Services;
using HM.Common;
using HM.Control;

namespace HMShop.Qwerty.Systems
{
    public partial class GroupManager : AdminControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblUpdateStatus.Text = string.Empty;
                var mainGroupService = new MainGroupService();
                dtgGroups.DataSource = mainGroupService.ReadAll();
                dtgGroups.DataBind();
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void dtgGroups_ItemDataBound(object sender, DataGridItemEventArgs e)
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

        protected void dtgGroups_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            try
            {
                var cmdName = e.CommandName;
                var groupId = string.IsNullOrEmpty(e.Item.Cells[0].Text) ? "" : e.Item.Cells[0].Text;

                if (cmdName == "edit")
                {
                    var mainGroupService = new MainGroupService();
                    var group = mainGroupService.ReadById(groupId);
                    if (group == null)
                    {
                        cmdCancel_Click(null, null); return;
                    }

                    txtID.Text = group.ID;
                    txtName.Text = group.Name;
                    txtDes.Text = group.Description;
                }

                if (cmdName == "del")
                {
                    var mainGroupService = new MainGroupService();
                    mainGroupService.Delete(groupId);
                    lblUpdateStatus.Text = AlertConfig.UPDATE_SUCCESS;
                    cmdCancel_Click(null, null);
                }

                if (cmdName == "roles")
                {
                    var url = PathConfig.ADMIN_CMD + CmdConfig.SYSTEM_GROUP_ROLE + "&groupid=" + e.Item.Cells[0].Text;
                    //Response.Redirect(url);
                    Response.Redirect(url, false);
                    Context.ApplicationInstance.CompleteRequest();
                }

                if (cmdName == "members")
                {
                    var url = PathConfig.ADMIN_CMD + CmdConfig.SYSTEM_GROUP_USER + "&groupid=" + e.Item.Cells[0].Text;
                    //Response.Redirect(url);
                    Response.Redirect(url, false);
                    Context.ApplicationInstance.CompleteRequest();
                }
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
                var mainGroupService = new MainGroupService();
                var info = mainGroupService.ReadById(txtID.Text);
                if (info == null) return;

                info.Name = txtName.Text.Trim();
                info.Description = txtDes.Text;

                mainGroupService.Update(info);
                lblUpdateStatus.Text = AlertConfig.UPDATE_SUCCESS;
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
                var info = new MainGroupInfo
                {
                    Name = txtName.Text.Trim(),
                    Description = txtDes.Text
                };

                var mainGroupService = new MainGroupService();
                txtID.Text = mainGroupService.Create(info).ToString();
                lblUpdateStatus.Text = AlertConfig.UPDATE_SUCCESS;
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void cmdCancel_Click(object sender, EventArgs e)
        {
            txtID.Text = string.Empty;
            txtName.Text = string.Empty;
            txtDes.Text = string.Empty;
        }
    }
}