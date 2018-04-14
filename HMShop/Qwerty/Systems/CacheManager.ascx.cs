using System;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HM.Cache;
using HM.Control;

namespace HMShop.Qwerty.Systems
{
    public partial class CacheManager : AdminControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //if (!IsPostBack)
                //{
                var context = HttpContext.Current;
                IEnumerator dcEnum = context.Cache.GetEnumerator();
                var lstCache = new List<string>();
                while (dcEnum.MoveNext())
                {
                    if (((DictionaryEntry)dcEnum.Current).Value != null)
                    {
                        lstCache.Add(((DictionaryEntry)dcEnum.Current).Key.ToString());
                    }
                }

                lstCache.Sort();
                lstBCaches.DataSource = lstCache;
                lstBCaches.DataBind();
                //}
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
                for (int i = 0; i < lstBCaches.Items.Count; i++)
                {
                    if (lstBCaches.Items[i].Selected)
                    {
                        var cacheName = lstBCaches.Items[i].Text;
                        DataCaching.RemoveCache(cacheName);
                    }
                }

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

        protected void cmdRemoverAll_Click(object sender, EventArgs e)
        {
            try
            {
                foreach (ListItem item in lstBCaches.Items)
                {
                    DataCaching.RemoveCache(item.Text);
                }

                Response.Redirect(Request.RawUrl);
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
    }
}