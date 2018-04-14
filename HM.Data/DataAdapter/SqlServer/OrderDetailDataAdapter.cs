using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using HM.Model;
using HM.Common;
using HM.Util;
using HM.Core;
using HM.Data.Interface;

namespace HM.Data.DataAdapter.SqlServer
{
    public  class OrderDetailDataAdapter: IOrderDetailAdapter
    {
        private const string SP_ORDER_DETAIL_INSERT = "sp_Order_Detail_Insert";
        private const string SP_ORDER_DETAIL_GETBYORDERID = "sp_Order_Detail_GetByOrderID";
        private const string SP_ORDER_DETAIL_GETBYORDERIDUSERIDDEALID = "sp_Order_Detail_GetByOrderIDUserIDDealID";

        public string Insert(OrderDetailInfo entity)
        {
            entity.ID = IdHelper.Generate();
            var @param = new[]
            {
                new SqlParameter("@ID", (object)entity.ID),
                new SqlParameter("@Order_ID", (object)entity.OrderID),
                new SqlParameter("@Product_ID", (object)entity.Product.ID),
                new SqlParameter("@Amount", (object)entity.Amount)
            };
            SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_ORDER_DETAIL_INSERT, @param);

            return entity.ID;
        }

        public List<OrderDetailInfo> GetByOrderId(string orderId)
        {
            var @param = new[]
            {
                new SqlParameter("@Order_ID", (object)orderId)
            };
            List<OrderDetailInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, SP_ORDER_DETAIL_GETBYORDERID, @param, ParseOrderDetail);

            return list;
        }

        public List<OrderDetailInfo> GetDetail(string orderId, string dealId, string userId)
        {
            var @param = new[]
            {
                new SqlParameter("@Order_ID", (object)orderId),
                new SqlParameter("@User_ID", (object)dealId),
                new SqlParameter("@Deal_ID", (object)userId)
            };
            List<OrderDetailInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, SP_ORDER_DETAIL_GETBYORDERIDUSERIDDEALID, @param, ParseOrderDetail);

            return list;
        }

        protected List<OrderDetailInfo> ParseOrderDetail(IDataReader reader)
        {
            var list = new List<OrderDetailInfo>();
            while (reader.Read())
            {
                var entity = new OrderDetailInfo()
                {
                    ID = reader["ID"].ToString(),
                    OrderID = reader["Name"].ToString(),
                    Product = new ProductInfo()
                    {
                        ID = reader["Product_ID"].ToString()
                    },
                    Amount = Convert.ToInt32(reader["Amount"].ToString())
                };
                list.Add(entity);
            }

            return list;
        }
    }
}