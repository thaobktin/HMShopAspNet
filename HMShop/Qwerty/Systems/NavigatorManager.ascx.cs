using System;
using System.Text;
using System.Data;
using System.Collections.Generic;
using HM.Services;
using HM.Model;
using HM.Control;
using HM.Common;
using HM.Util;
using HM.Cache;

namespace HMShop.Qwerty.Systems
{
    public partial class NavigatorManager : AdminControl
    {
        string cmdRoles;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var page = (AdminPage)this.Page;
                page.Title = GetTitle();

                if (!CurrentAdminInfo.SuperAdmin)
                {
                    cmdRoles = GetRoles();
                }

                var currCmd = string.Empty;
                if (Request.QueryString[CmdConfig.CMD_ROOT] != null)
                {
                    currCmd = Request.QueryString[CmdConfig.CMD_ROOT];
                }

                string parentID = "0";
                litSidebar.Text = LoadMenuItem(parentID, currCmd);
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void btnLogout_Click(object sender, System.EventArgs e)
        {
            try
            {
                AuthenUtils.LogoutUser(SessionConfig.ADMIN_INFO);
                //Response.Redirect(Request.RawUrl);
                Response.Redirect(Request.RawUrl, false);
                Context.ApplicationInstance.CompleteRequest();
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        #region Helpers

        public string GetTitle()
        {
            //var path = new StringBuilder("|");

            var cmd = string.Empty;
            if (string.IsNullOrEmpty(Request.QueryString[CmdConfig.CMD_ROOT]))
                cmd = string.Empty;
            else
                cmd = Convert.ToString(Request.QueryString[CmdConfig.CMD_ROOT]);

            var lstTitle = new List<string>();

            MainCmdInfo curCmd = null;
            var mainCmdService = new MainCmdService();
            if (cmd != string.Empty)
            {
                curCmd = mainCmdService.ReadByCmd(cmd);
            }

            while (curCmd != null)
            {
                //path.Append(curCmd.Cmd_ID + "|");
                lstTitle.Add(curCmd.Name);
                curCmd = mainCmdService.ReadById(curCmd.ParentID);
            }

            var pageTitle = string.Empty;
            //var pageTitle = CommonCache.WebTitle + " - ";
            var titleBuilder = new StringBuilder(CommonCache.WebTitle + " - ");
            //titleBuilder.Append(pageTitle);
            foreach (string item in lstTitle)
            {
                titleBuilder.Append(item + " - ");
            }
            pageTitle = titleBuilder.ToString();

            if (pageTitle.IndexOf(" - ", StringComparison.Ordinal) > 0)
            {
                pageTitle = pageTitle.Substring(0, pageTitle.Length - 2);
            }

            return pageTitle;
        }

        public string GetRoles()
        {
            //var dtUserRoles = Main_CmdDB.Main_Cmd_GetAllRolesForUser(CurrentAdminInfo.MainUser_ID);
            var mainCmdService = new MainCmdService();
            var dtUserRoles = mainCmdService.ReadByParentId(CurrentAdminInfo.ID);

            var cmdRolesBuilder = new StringBuilder("|");
            foreach (var item in dtUserRoles)
            {
                cmdRolesBuilder.Append(item.ID + @"|");
            }

            return cmdRolesBuilder.ToString();
        }

        private string LoadMenuItem(string idMenu, string currCmd)
        {
            var mainCmdService = new MainCmdService();
            var dtRoot = mainCmdService.ReadByParentId(idMenu);

            var IconClass = new Dictionary<string, string>();
            IconClass.Add("trang chủ", "icon-home");
            IconClass.Add("hệ thống", "icon-cog");
            IconClass.Add("đơn hàng", "icon-shopping-cart");
            IconClass.Add("sản phẩm", "icon-glass");
            IconClass.Add("đối tác", "icon-legal");
            IconClass.Add("tiếp thị", "icon-bullhorn");
            IconClass.Add("websites", "icon-eye-open");

            var sideBarHtml = string.Empty;
            var builder = new StringBuilder();
            builder.Append(sideBarHtml);
            foreach (var item in dtRoot)
            {
                if ((item.Value.ToString() == CmdConfig.SYSTEM_CMD)
                    && (CurrentAdminInfo.Email != PathConfig.ADMIN_EMAIL)) continue;

                var Submenu = string.Empty;
                if (item.ID != null)
                {
                    Submenu = LoadSubMenuItem(item.ID);
                }

                bool IsOpening = false;
                if (currCmd != string.Empty && Submenu.Contains(currCmd))
                {
                    IsOpening = true;
                }

                var ToggleClass = string.Empty;
                if (Submenu != string.Empty)
                {
                    ToggleClass = "class=\"dropdown-toggle\"";
                }
                var AnchorText = item.Name.ToString();
                var IconClassValue = "";

                IconClass.TryGetValue(AnchorText.Trim().ToLower(), out IconClassValue);

                var OpenClass = IsOpening ? "open active" : "";
                var MenuItemText = "<li class=\"" + OpenClass + "\">";
                if (item.Url.ToString() != string.Empty)
                {
                    MenuItemText += "<a " + ToggleClass + " href=\"" + item.Url
                        + "\"><i class=\"" + IconClassValue + "\"></i><span class=\"menu-text\">"
                        + AnchorText + "</span>";
                }
                else if (item.Value.ToString() != string.Empty)
                {
                    MenuItemText += "<a " + ToggleClass + " class=\"dropdown-toggle\" href=\""
                        + PathConfig.ADMIN_CMD + item.Value + "\"><i class=\""
                        + IconClassValue + "\"></i><span class=\"menu-text\">" + AnchorText + "</span>";
                }
                else
                {
                    MenuItemText += "<a " + ToggleClass + " href=\"#\"><i class=\""
                        + IconClassValue + "\"></i><span class=\"menu-text\">"
                        + AnchorText + "</span>";
                }

                if ((item.Visible.ToString() == "False")
                    || (item.Enable.ToString() == "False"))
                {
                    continue;
                }

                if (CurrentAdminInfo.SuperAdmin
                    || (cmdRoles.IndexOf("|" + item.ID + "|", StringComparison.Ordinal) >= 0))
                {
                    if (Submenu == string.Empty)
                    {
                        builder.Append(MenuItemText + "</a></li>");
                    }
                    else
                    {
                        builder.Append(MenuItemText + "<b class=\"arrow icon-angle-down\"></b></a>"
                            + Submenu + "</li>");
                    }
                }
            }
            sideBarHtml = builder.ToString();

            return sideBarHtml;
        }

        private string LoadSubMenuItem(string currentID)
        {
            var mainCmdService = new MainCmdService();
            var dtChild = mainCmdService.ReadByParentId(currentID);
            var SubMenuHtml = "";
            if (dtChild != null && dtChild.Count > 0)
            {
                SubMenuHtml = "<ul class=\"submenu\">";
                var builder = new StringBuilder();
                builder.Append(SubMenuHtml);

                foreach (var item in dtChild)
                {
                    if ((item.Visible.ToString() == "False")
                        || (item.Enable.ToString() == "False"))
                    {
                        continue;
                    }

                    if ((item.Value.ToString() == CmdConfig.SYSTEM_CMD)
                        && (CurrentAdminInfo.Email != PathConfig.ADMIN_EMAIL))
                    {
                        continue;
                    }

                    var MenuItemHtml = "<li>";
                    if (item.Url.ToString() != string.Empty)
                    {
                        MenuItemHtml += "<a href=\"" + item.Url
                            + "\">" + item.Name + "</a></li>";
                    }
                    else if (item.Value.ToString() != string.Empty)
                    {
                        MenuItemHtml += "<a href=\"" + PathConfig.ADMIN_CMD
                            + item.Value + "\">" + item.Name + "</a></li>";
                    }
                    else
                    {
                        MenuItemHtml += "<a href=\"#\">"
                            + item.Name + "</a></li>";
                    }

                    if (CurrentAdminInfo.SuperAdmin ||
                        (cmdRoles.IndexOf("|" + item.ID + "|", StringComparison.Ordinal) >= 0))
                    {
                        builder.Append(MenuItemHtml);
                    }
                }
                SubMenuHtml = builder.ToString();

                SubMenuHtml += "</ul>";
            }

            return SubMenuHtml;
        }

        #endregion
    }
}