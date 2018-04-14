using System;
using System.Web.UI;
using System.Globalization;
using HM.Services;
using HM.Model;
using HM.Common;
using HM.Control;
using HM.Model.Enumerations;

namespace HMShop.Qwerty.Orders
{
    public partial class DetailOrderManager : AdminControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //lblDealID.Text = Request.QueryString["dealid"];
                lblOrderID.Text = Request.QueryString["orderid"];
                BindOrderDetail();
                BindOrderStatus();
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        void BindOrderDetail()
        {
            var orderDetailService = new OrderDetailService();
            if (!string.IsNullOrEmpty(Request.QueryString["orderid"]))
            {
                var dealId = Request.QueryString["dealid"];
                var orderId = Request.QueryString["orderid"];
                dtgOrderDetails.DataSource = orderDetailService.ReadByOrderId(orderId);
                dtgOrderDetails.DataBind();

                var orderInfo = orderDetailService.ReadByOrderId(orderId);
                //txtShippedDate.Text = orderInfo.DateProcess == default(DateTime).ToString("dd/MM/yyyy") 
                //    ? DateTime.Now.ToString("dd/MM/yyyy") : orderInfo.Order_DateProcess;
                //textTrackingNumber.Text = orderInfo.TrackingNumber;
                //orderInfo.Order_StatusId == null ? -1 : 
                //var statusId = orderInfo.Status;
                //ddlOrdStt.SelectedIndex = ddlOrdStt.Items.IndexOf(ddlOrdStt.Items.FindByValue(statusId));
            }
            else
            {
                dtgOrderDetails.DataSource = null;
            }
        }
        
        void BindOrderStatus()
        {
            //ddlOrdStt.DataSource = OrderService.ReadOrderStatus();
            ddlOrdStt.DataTextField = "Name";
            ddlOrdStt.DataValueField = "ID";
            ddlOrdStt.DataBind();
        }

        protected void cmdBack_Click(object sender, EventArgs e)
        {
            try
            {
                BackToList();
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
                DateTime dateProcess;
                DateTime.TryParseExact(txtShippedDate.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out dateProcess);
                var order = new OrderInfo
                {
                    ID = string.IsNullOrEmpty(Request.QueryString["orderid"]) ? "" : Request.QueryString["orderid"],
                    Status = (OrderStatus)Enum.Parse(typeof(OrderStatus),ddlOrdStt.SelectedItem.Value),
                    DateProcess = dateProcess.ToString("dd/MM/yyyy"),
                    TrackingNumber = textTrackingNumber.Text
                };
                var orderService = new OrderService();
                //orderService.Update(order);

                BackToList();
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        void BackToList()
        {
            var url = PathConfig.ADMIN_CMD + CmdConfig.ORDER_LIST_ORDER;
            Response.Redirect(url, false);
            Context.ApplicationInstance.CompleteRequest();
        }

    }
}