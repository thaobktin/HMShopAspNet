using System;
using System.Collections;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HM.Control
{
    public class DataGrid : System.Web.UI.WebControls.DataGrid
    {
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            base.PageIndexChanged += new DataGridPageChangedEventHandler(this.DataGrid_PageIndexChanged);
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            if (this.DataSource != null)
            {
                int virtualItemCount = this.VirtualItemCount;
                if (virtualItemCount == 0)
                {
                    if (this.DataSource.GetType() == typeof(DataTable))
                    {
                        virtualItemCount = ((DataTable)this.DataSource).Rows.Count;
                    }
                    else if (this.DataSource.GetType() == typeof(ArrayList))
                    {
                        virtualItemCount = ((ArrayList)this.DataSource).Count;
                    }
                }
                int currentPageIndex = this.GetCurrentPageIndex();
                if (currentPageIndex > 0)
                {
                    currentPageIndex--;
                }
                int num3 = virtualItemCount / this.PageSize;
                if ((virtualItemCount > 0) && ((virtualItemCount % this.PageSize) == 0))
                {
                    num3--;
                }
                num3++;
                if ((currentPageIndex >= 0) && (currentPageIndex < num3))
                {
                    base.CurrentPageIndex = currentPageIndex;
                }
                else
                {
                    HttpContext.Current.Response.Redirect(this.ChangePageIndex(num3));
                }
                if (num3 == 1)
                {
                    this.PagerStyle.Visible = false;
                }
                else
                {
                    this.PagerStyle.Visible = true;
                }
            }
            base.ItemCreated += new DataGridItemEventHandler(this.DataGrid_ItemCreated);
            this.DataBind();
        }

        private string ChangePageIndex(int _newPageIndex)
        {
            if (HttpContext.Current.Request.QueryString["page"] == null)
            {
                string rawUrl = HttpContext.Current.Request.RawUrl;
                if (rawUrl.IndexOf("?") >= 0)
                {
                    return (rawUrl + "&page=" + _newPageIndex.ToString());
                }
                return (rawUrl + "?page=" + _newPageIndex.ToString());
            }
            return HttpContext.Current.Request.RawUrl.Replace("page=" + HttpContext.Current.Request.QueryString["page"], "page=" + _newPageIndex.ToString());
        }

        private void DataGrid_ItemCreated(object sender, DataGridItemEventArgs e)
        {
            if (((e.Item.ItemType == ListItemType.Pager) && (this.PagerStyle.Mode == PagerMode.NumericPages)) && (e.Item.Cells.Count > 0))
            {
                foreach (System.Web.UI.Control control in e.Item.Cells[0].Controls)
                {
                    if (control.GetType().ToString() == "System.Web.UI.WebControls.DataGridLinkButton")
                    {
                        LinkButton button = (LinkButton) control;
                        button.Text = "| " + button.Text + " |";
                    }
                    if (control.GetType().ToString() == "System.Web.UI.WebControls.Label")
                    {
                        Label label = (Label) control;
                        label.Text = " Trang " + label.Text;
                    }
                }
            }
        }

        private void DataGrid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            this.Page.Response.Redirect(this.ChangePageIndex(e.NewPageIndex + 1));
        }

        private int GetCurrentPageIndex()
        {
            if (HttpContext.Current.Request.QueryString["page"] == null)
            {
                return 0;
            }
            try
            {
                return Convert.ToInt32(HttpContext.Current.Request.QueryString["page"]);
            }
            catch(Exception)
            {
                return 0;
            }
        }
        
    }
}

