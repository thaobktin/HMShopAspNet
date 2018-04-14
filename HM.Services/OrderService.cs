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
    public  class OrderService
    {
        private readonly IOrderAdapter _orderAdapter;
        public OrderService()
        {
            _orderAdapter = new OrderDataAdapter();
        }

        public string Create(OrderInfo entity)
        {
            return _orderAdapter.Insert(entity);
        }

        public bool UpdateStatus(string id, string status, string tracking)
        {
            return _orderAdapter.UpdateStatus(id, status, tracking);
        }

        public OrderInfo ReadById(string id, string dealId)
        {
            return _orderAdapter.GetById(id, dealId);
        }

        public List<OrderInfo> ReadAll()
        {
            return _orderAdapter.GetAll();
        }

        public List<OrderInfo> ReadByUserId(string userId)
        {
            return _orderAdapter.GetByUserId(userId);
        }

        public List<OrderInfo> ReadOrderTop(int top)
        {
            return _orderAdapter.GetTop(top);
        }

    }
}