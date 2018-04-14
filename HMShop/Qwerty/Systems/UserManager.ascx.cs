using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using HM.Model;
using HM.Services;
using HM.Util;
using HM.Common;
using HM.Control;


namespace HMShop.Qwerty.Systems
{
    public partial class UserManager : AdminControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //if (!IsPostBack)
                //{
                lblUpdateStatus.Text = string.Empty;
                BindListGroup();
                BindGridUser();
                //}
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        void BindListGroup()
        {
            var mainGroupService = new MainGroupService();
            lstGroups.DataSource = mainGroupService.ReadAll();
            lstGroups.DataTextField = "Name";
            lstGroups.DataValueField = "ID";
            lstGroups.DataBind();
        }

        void BindGridUser()
        {
            var mainUserService = new MainUserService();
            dtgUsers.DataSource = mainUserService.ReadAll();
            dtgUsers.DataBind();
        }

        protected void dtgUsers_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemIndex < 0) return;
                var cmdDel = (Button)e.Item.FindControl("cmdDel");
                if (cmdDel != null)
                {
                    cmdDel.Attributes.Add("onclick", AlertConfig.DELETE_CONFIRM);
                }

                //if ((e.Item.Cells[0].Text == "1")
                //    || (e.Item.Cells[1].Text != PathConfig.ADMIN_EMAIL))
                //{
                //    cmdDel.Visible = false;
                //}
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void dtgUsers_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            try
            {
                var userId = string.IsNullOrEmpty(e.Item.Cells[0].Text) ? "" : e.Item.Cells[0].Text;
                if (e.CommandName == "edit")
                {
                    var mainUserService = new MainUserService();
                    var user = mainUserService.ReadById(userId);
                    if (user == null)
                    {
                        cmdEmpty_Click(null, null); return;
                    }

                    txtID.Text = user.ID.ToString();
                    txtEmail.Text = user.Email;
                    chkEmailConfirm.Checked = user.EmailConfirmed;
                    txtFullName.Text = user.FullName;
                    txtLoginName.Text = user.LoginName;
                    txtBirthDay.Text = user.Birthday;
                    txtPhone.Text = user.Phone;
                    txtAddress.Text = user.Address;
                    chkIsSuperAdmin.Checked = user.SuperAdmin;

                    var selectedVal = user.Gender ? 1 : 0;
                    dropGender.SelectedIndex = -1;
                    MiscUtils.SetSelected(dropGender.Items, selectedVal.ToString());

                    var mainGroupUserService = new MainGroupUserService();
                    var dtGroups = mainGroupUserService.ReadByUserId(user.ID);

                    string groups = "|";
                    var builder = new System.Text.StringBuilder();
                    builder.Append(groups);
                    foreach (var item in dtGroups)
                    {
                        builder.Append(item.GroupID + "|");
                    }
                    groups = builder.ToString();

                    foreach (ListItem item in lstGroups.Items)
                    {
                        if (groups.IndexOf("|" + item.Value + "|", StringComparison.Ordinal) >= 0)
                        {
                            item.Selected = true;
                        }
                        else
                        {
                            item.Selected = false;
                        }
                    }
                }

                if (e.CommandName == "del")
                {
                    var mainUserService = new MainUserService();
                    mainUserService.Delete(userId);
                    lblUpdateStatus.Text = AlertConfig.UPDATE_SUCCESS;
                    cmdEmpty_Click(null, null);
                }

                if (e.CommandName == "roles")
                {
                    var url = PathConfig.ADMIN_CMD + CmdConfig.SYSTEM_USER_ROLE + "&userid=" + e.Item.Cells[0].Text;
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
                var userID = string.IsNullOrEmpty(txtID.Text) ? "" : txtID.Text;
                var mainUserService = new MainUserService();
                var userInfo = mainUserService.ReadById(userID);
                if (userInfo == null) return;

                userInfo.Email = txtEmail.Text.Trim();
                userInfo.EmailConfirmed = chkEmailConfirm.Checked;
                userInfo.FullName = txtFullName.Text;
                userInfo.LoginName = txtLoginName.Text;
                if (string.IsNullOrEmpty(txtPassword.Text.Trim()))
                {
                    userInfo.Password = SecurityUtil.MD5Encrypt(txtPassword.Text.Trim());
                }
                userInfo.Gender = (dropGender.SelectedValue == "1") ? true : false;
                userInfo.Address = txtAddress.Text;
                userInfo.Birthday = txtBirthDay.Text;
                userInfo.Phone = txtPhone.Text;
                userInfo.SuperAdmin = chkIsSuperAdmin.Checked;

                mainUserService.Update(userInfo);
                foreach (ListItem item in lstGroups.Items)
                {
                    var mainGroupUserService = new MainGroupUserService();
                    var mainGroupUser = new MainGroupUserInfo()
                    {
                        UserID = userInfo.ID,
                        GroupID = item.Value
                    };

                    if (item.Selected)
                    {
                        mainGroupUserService.Create(mainGroupUser);
                    }
                    else
                    {
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

        protected void cmdEmpty_Click(object sender, EventArgs e)
        {
            txtID.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtFullName.Text = string.Empty;
            txtBirthDay.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtPhone.Text = string.Empty;
        }

        protected void cmdAddNew_Click(object sender, EventArgs e)
        {
            try
            {
                var mainUserInfo = new MainUserInfo
                {
                    Email = txtEmail.Text.Trim(),
                    FullName = txtFullName.Text,
                    Password = SecurityUtil.MD5Encrypt(txtPassword.Text.Trim()),
                    Gender = (dropGender.SelectedValue == "1") ? true : false,
                    Address = txtAddress.Text,
                    Birthday = txtBirthDay.Text,
                    Phone = txtPhone.Text,
                    SuperAdmin = chkIsSuperAdmin.Checked
                };

                var mainUserService = new MainUserService();
                var mainGroupUserService = new MainGroupUserService();
                txtID.Text = mainUserService.Create(mainUserInfo);

                foreach (ListItem item in lstGroups.Items)
                {
                    var mainGroupUser = new MainGroupUserInfo()
                    {
                        GroupID = string.IsNullOrEmpty(item.Value) ? "" : item.Value,
                        UserID = string.IsNullOrEmpty(txtID.Text) ? "" : txtID.Text
                    };

                    if (item.Selected)
                    {
                        mainGroupUserService.Create(mainGroupUser);
                    }
                    else
                    {
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
    }
}