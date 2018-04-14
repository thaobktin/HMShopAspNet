using System;
using System.Text;
using System.Collections.Generic;
using System.Data;
using HM.Model;
using HM.Data;
using HM.Data.Interface;
using HM.Data.DataAdapter.SqlServer;

namespace HM.Services
{
    public class OrderDetailService
    {
        private readonly IOrderDetailAdapter _orderDetailAdapter;

        public OrderDetailService()
        {
            _orderDetailAdapter = new OrderDetailDataAdapter();
        }
        public string Create(OrderDetailInfo entity)
        {
            return _orderDetailAdapter.Insert(entity);
        }

        public List<OrderDetailInfo> ReadByOrderId(string orderId)
        {
            return _orderDetailAdapter.GetByOrderId(orderId);
        }

        public List<OrderDetailInfo> ReadDetail(string orderId, string dealId, string userId)
        {
            return _orderDetailAdapter.GetDetail(orderId, dealId, userId);
        }
    }
}
