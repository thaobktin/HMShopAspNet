using System;
using System.Text;
using System.Data;
using System.Web.UI.WebControls;
using HM.Model;
using HM.Services;
using HM.Util;
using HM.Common;
using HM.Control;

namespace HMShop.Qwerty.Systems
{
    public partial class CmdManager : AdminControl
    {
        string nodePath;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (CurrentAdminInfo.Email != PathConfig.ADMIN_EMAIL)
                {
                    //Response.Redirect(PathConfig.ADMIN_ACCESSDENY);
                    Response.Redirect(PathConfig.ADMIN_ACCESSDENY, false);
                    Context.ApplicationInstance.CompleteRequest();
                }

                var mainCmdService = new MainCmdService();
                mainCmdService.FillToListBox(dropParent.Items);
                dropParent.Items.Insert(0, new ListItem("Root", "0"));

                if (txtID.Text != string.Empty)
                {
                    var info = mainCmdService.ReadById(txtID.Text);
                    if (info != null)
                    {
                        dropParent.SelectedIndex = -1;
                        MiscUtils.SetSelected(dropParent.Items, info.ParentID.ToString());
                    }
                }

                nodePath = "|";
                var focusNode = treFunction.SelectedNode;
                if (focusNode != null)
                {
                    var builder = new StringBuilder();
                    builder.Append(nodePath);
                    while (true)
                    {
                        if (focusNode.Parent == null) break;
                        focusNode = focusNode.Parent;
                        builder.Append(focusNode.ImageToolTip + "|");
                    }
                    nodePath = builder.ToString();
                }

                var topRoot = new TreeNode
                {
                    Text = "Root",
                    ImageToolTip = "0"
                };
                treFunction.Nodes.Clear();
                treFunction.Nodes.Add(topRoot);

                LoadParentTree(treFunction);

                lblUpdateStatus.Text = string.Empty;
                cmdDelete.Attributes.Add("onclick", AlertConfig.DELETE_CONFIRM);
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void treFunction_SelectedNodeChanged(object sender, EventArgs e)
        {
            try
            {
                var mainCmdService = new MainCmdService();
                var curID = treFunction.SelectedNode.ImageToolTip;
                var info = mainCmdService.ReadById(curID);
                if (info == null)
                {
                    cmdEmpty_Click(null, null);
                    return;
                }

                txtID.Text = info.ID.ToString();
                txtName.Text = info.Name;
                txtCmd.Text = info.Value;
                txtPath.Text = info.Path;
                txtUrl.Text = info.Url;

                int maxIndex = mainCmdService.ChildCount(info.ParentID);
                MiscUtils.FillIndex(dropIndex, maxIndex, info.Index);
                chkEnable.Checked = info.Enable;
                chkVisble.Checked = info.Visible;
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
                var mainCmdService = new MainCmdService();
                if ((txtCmd.Text != string.Empty) && !string.IsNullOrEmpty(mainCmdService.ReadByCmd(txtCmd.Text).ID))
                {
                    lblUpdateStatus.Text = "<font color='red'> Đã tồn tại chức năng này! </font>";
                    return;
                }

                var info = new MainCmdInfo
                {
                    Name = txtName.Text.Trim(),
                    Value = txtCmd.Text.Trim(),
                    Url = txtUrl.Text.Trim(),
                    Path = txtPath.Text.Trim(),
                    Enable = chkEnable.Checked,
                    Visible = chkVisble.Checked,
                    ParentID = dropParent.SelectedValue == null ? "" : dropParent.SelectedValue
                };

                txtID.Text = mainCmdService.Create(info);
                lblUpdateStatus.Text = AlertConfig.UPDATE_SUCCESS;
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
                var mainCmdService = new MainCmdService();
                MainCmdInfo info = mainCmdService.ReadById(txtID.Text);
                if (info == null) return;

                var cmdID = mainCmdService.ReadByCmd(txtCmd.Text).ID;
                if ((txtCmd.Text != string.Empty) && (cmdID != string.Empty) && (cmdID != info.ID))
                {
                    lblUpdateStatus.Text = "<font color='red'> Đã tồn tại chức năng này! </font>";
                    return;
                }

                info.Name = txtName.Text.Trim();
                info.Value = txtCmd.Text.Trim();
                info.Url = txtUrl.Text.Trim();
                info.Path = txtPath.Text.Trim();
                info.Enable = chkEnable.Checked;
                info.Visible = chkVisble.Checked;
                info.Index = dropIndex.SelectedValue == null ? 0 : Convert.ToInt32(dropIndex.SelectedValue);
                info.ParentID = dropParent.SelectedValue == null ? "" : dropParent.SelectedValue;

                mainCmdService.Update(info);
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
            txtName.Text = string.Empty;
            txtCmd.Text = string.Empty;
            txtPath.Text = string.Empty;
            txtUrl.Text = string.Empty;
            chkEnable.Checked = true;
            chkVisble.Checked = true;
            dropParent.SelectedIndex = -1;
        }

        protected void cmdDelete_Click(object sender, EventArgs e)
        {
            try
            {
                var mainCmdService = new MainCmdService();
                mainCmdService.Delete(txtID.Text);
                lblUpdateStatus.Text = AlertConfig.UPDATE_SUCCESS;
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        #region Helpers

        void LoadParentTree(TreeView treeView)
        {
            var mainCmdService = new MainCmdService();
            var dtRoot = mainCmdService.ReadByParentId("");

            foreach (var item in dtRoot)
            {
                var rootNode = new TreeNode
                {
                    Text = item.Name.ToString(),
                    ImageToolTip = item.ID.ToString()
                };

                if (nodePath.IndexOf("|" + rootNode.ImageToolTip + "|", StringComparison.Ordinal) >= 0)
                {
                    rootNode.Expanded = true;
                }
                treeView.Nodes.Add(rootNode);
                LoadChildTree(rootNode);
            }
        }

        void LoadChildTree(TreeNode curNode)
        {
            var mainCmdService = new MainCmdService();
            var dtChild = mainCmdService.ReadByParentId(curNode.ImageToolTip);

            foreach (var item in dtChild)
            {
                var childNode = new TreeNode
                {
                    Text = item.Name.ToString(),
                    ImageToolTip = item.ID.ToString()
                };

                if (nodePath.IndexOf("|" + childNode.ImageToolTip + "|", StringComparison.Ordinal) >= 0)
                {
                    childNode.Expanded = true;
                }
                curNode.ChildNodes.Add(childNode);
                LoadChildTree(childNode);
            }
        }

        #endregion
    }
}