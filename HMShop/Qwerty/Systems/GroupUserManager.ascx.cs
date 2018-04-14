using System;
using System.Data;
using System.Web.UI.WebControls;
using HM.Model;
using HM.Services;
using HM.Common;
using HM.Control;

namespace HMShop.Qwerty.Systems
{
    public partial class GroupUserManager : AdminControl
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
                var mainUserService = new MainUserService();
                if (!IsPostBack)
                {
                    lstUsers.DataSource = mainUserService.ReadAll();
                    lstUsers.DataTextField = "Email";
                    lstUsers.DataValueField = "ID";
                    lstUsers.DataBind();
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
                var mainUserService = new MainUserService();
                lstGroupMembers.DataSource = mainUserService.ReadAll();
                lstGroupMembers.DataTextField = "Email";
                lstGroupMembers.DataValueField = "ID";
                lstGroupMembers.DataBind();

                var mainGroupUserService = new MainGroupUserService();
                var dtGroupMembers = mainGroupUserService.ReadByGroupId(groupInfo.ID);
                string members = "|";
                var builder = new System.Text.StringBuilder();
                builder.Append(members);
                foreach (var item in dtGroupMembers)
                {
                    builder.Append(item.UserID.ToString() + "|");
                }
                members = builder.ToString();

                int i = 0;
                while (i < lstGroupMembers.Items.Count)
                {
                    if (members.IndexOf("|" + lstGroupMembers.Items[i].Value + "|", StringComparison.Ordinal) < 0)
                    {
                        lstGroupMembers.Items.RemoveAt(i);
                    }
                    else
                    {
                        i += 1;
                    }
                }
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void cmdAdd_Click(object sender, EventArgs e)
        {
            try
            {
                var mainGroupUserService = new MainGroupUserService();
                foreach (ListItem item in lstUsers.Items)
                {
                    if (item.Selected)
                    {
                        var mainGroupUser = new MainGroupUserInfo()
                        {
                            UserID = item.Value,
                            GroupID = groupInfo.ID
                        };
                        mainGroupUserService.Create(mainGroupUser);
                    }
                }
                    
                lblUpdateStatus.Text = AlertConfig.UPDATE_SUCCESS;
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
                var mainGroupUserService = new MainGroupUserService();
                foreach (ListItem item in lstGroupMembers.Items)
                {
                    if (item.Selected)
                    {
                        var mainGroupUser = new MainGroupUserInfo()
                        {
                            UserID = item.Value,
                            GroupID = groupInfo.ID
                        };
                        mainGroupUserService.Delete(mainGroupUser);
                    }
                }
                    
                lblUpdateStatus.Text = AlertConfig.UPDATE_SUCCESS;
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
            //Response.Redirect(BackUrl);
            Response.Redirect(BackUrl, false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}