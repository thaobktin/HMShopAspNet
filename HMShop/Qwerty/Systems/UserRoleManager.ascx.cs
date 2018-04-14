using System;
using System.Data;
using System.Web.UI.WebControls;
using HM.Model;
using HM.Services;
using HM.Util;
using HM.Common;
using HM.Control;


namespace HMShop.Qwerty.Systems
{
    public partial class UserRoleManager : AdminControl
    {
        protected Button cmdDel;
        protected MainUserInfo userInfo;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var mainUserService = new MainUserService();
                userInfo = mainUserService.ReadById(Request.QueryString["userid"]);
                if (userInfo == null)
                {
                    //Response.Redirect(PathConfig.ADMIN_PATH);
                    Response.Redirect(PathConfig.ADMIN_PATH, false);
                    Context.ApplicationInstance.CompleteRequest();
                }

                lblUserEmail.Text = userInfo.Email;
                lblUpdateStatus.Text = string.Empty;
                if (!IsPostBack)
                {
                    lstRoles.Items.Clear();
                    var mainCmdService = new MainCmdService();
                    mainCmdService.FillToListBox(lstRoles.Items);
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
                var mainCmdService = new MainCmdService();
                var mainUserCmdService = new MainUserCmdService();
                lstUserRoles.Items.Clear();
                mainCmdService.FillToListBox(lstUserRoles.Items);

                var dtUserRoles = mainUserCmdService.ReadCmdByUserId(userInfo.ID);
                string roles = "|";
                var builder = new System.Text.StringBuilder();
                builder.Append(roles);
                foreach (var item in dtUserRoles)
                {
                    builder.Append(item.CmdID + "|");
                }
                roles = builder.ToString();

                int i = 0;
                while (i < lstUserRoles.Items.Count)
                {
                    if (roles.IndexOf("|" + lstUserRoles.Items[i].Value + "|", StringComparison.Ordinal) < 0)
                    {
                        lstUserRoles.Items.RemoveAt(i);
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

        protected void cmdBack_Click(object sender, EventArgs e)
        {
            try
            {
                //Response.Redirect(BackUrl);
                Response.Redirect(BackUrl, false);
                Context.ApplicationInstance.CompleteRequest();
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void cmdAdd_Click(object sender, System.EventArgs e)
        {
            try
            {
                var mainUserCmdService = new MainUserCmdService();
                foreach (ListItem item in lstRoles.Items)
                {
                    if (item.Selected)
                    {
                        var mainUserCmd = new MainUserCmdInfo()
                        {
                            UserID = userInfo.ID,
                            CmdID = item.Value
                        };
                        mainUserCmdService.Create(mainUserCmd);
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
                var mainUserCmdService = new MainUserCmdService();
                foreach (ListItem item in lstUserRoles.Items)
                {
                    var cmdIdVal = string.IsNullOrEmpty(item.Value) ? "" : item.Value;
                    if (item.Selected)
                    {
                        var mainUserCmd = new MainUserCmdInfo()
                        {
                            UserID = userInfo.ID,
                            CmdID = cmdIdVal
                        };
                        mainUserCmdService.Delete(mainUserCmd);
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
    }
}