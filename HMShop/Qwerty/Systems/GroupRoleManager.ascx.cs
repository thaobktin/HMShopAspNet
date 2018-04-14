using System;
using System.Data;
using System.Web.UI.WebControls;
using HM.Services;
using HM.Model;
using HM.Util;
using HM.Common;
using HM.Control;

namespace HMShop.Qwerty.Systems
{
    public partial class GroupRoleManager : AdminControl
    {
        MainGroupInfo groupInfo = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var mainGroupService = new MainGroupService();
                groupInfo = mainGroupService.ReadById(Request.QueryString["groupid"]);
                if (groupInfo == null)
                {
                    //Response.Redirect(PathConfig.ADMIN_PATH);
                    Response.Redirect(PathConfig.ADMIN_PATH, false);
                    Context.ApplicationInstance.CompleteRequest();
                }

                txtGroupName.Text = groupInfo.Name;
                lblUpdateStatus.Text = string.Empty;
                if (!IsPostBack)
                {
                    lstRoles.Items.Clear();
                    var mainCmd = new MainCmdService();
                    mainCmd.FillToListBox(lstRoles.Items);
                }
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            try
            {
                lstGroupRoles.Items.Clear();
                var mainCmd = new MainCmdService();
                mainCmd.FillToListBox(lstGroupRoles.Items);

                var mainGroupCmdService = new MainGroupCmdService();
                var dtGroupRoles = mainGroupCmdService.ReadByGroupId(groupInfo.ID);
                string roles = "|";
                var builder = new System.Text.StringBuilder();
                builder.Append(roles);
                foreach (var item in dtGroupRoles)
                {
                    builder.Append(item.CmdID + "|");
                }
                roles = builder.ToString();

                int i = 0;
                while (i < lstGroupRoles.Items.Count)
                {
                    if (roles.IndexOf("|" + lstGroupRoles.Items[i].Value + "|", StringComparison.Ordinal) < 0) lstGroupRoles.Items.RemoveAt(i);
                    else i += 1;
                }
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void cmdBack_Click(object sender, EventArgs e)
        {
            Response.Redirect(BackUrl, false);
            Context.ApplicationInstance.CompleteRequest();
        }

        protected void cmdAdd_Click(object sender, EventArgs e)
        {
            try
            {
                foreach (ListItem item in lstRoles.Items)
                {
                    if (item.Selected)
                    {
                        var mainGroupCmdService = new MainGroupCmdService();
                        var mainGroupCmd = new MainGroupCmdInfo()
                        {
                            GroupID = groupInfo.ID,
                            CmdID = item.Value
                        };
                        mainGroupCmdService.Create(mainGroupCmd);
                    }
                    lblUpdateStatus.Text = AlertConfig.UPDATE_SUCCESS;
                }
                    
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void cmdRemover_Click(object sender, EventArgs e)
        {
            try
            {
                foreach (ListItem item in lstGroupRoles.Items)
                {
                    if (item.Selected)
                    {
                        var mainGroupCmdService = new MainGroupCmdService();
                        var mainGroupCmd = new MainGroupCmdInfo()
                        {
                            GroupID = groupInfo.ID,
                            CmdID = item.Value
                        };
                        mainGroupCmdService.Delete(mainGroupCmd);
                    }

                    lblUpdateStatus.Text = AlertConfig.UPDATE_SUCCESS;
                }
                    
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }
    }
}