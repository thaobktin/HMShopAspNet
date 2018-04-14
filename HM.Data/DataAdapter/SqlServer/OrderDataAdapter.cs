using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using HM.Model;
using HM.Common;
using HM.Util;
using HM.Core;
using HM.Data.Interface;
using HM.Model.Enumerations;

namespace HM.Data.DataAdapter.SqlServer
{
    public  class OrderDataAdapter: IOrderAdapter
    {
        private const string SP_ORDER_INSERT = "sp_Order_Insert";
        private const string SP_ORDER_UPDATESTATUS = "sp_Order_UpdateStatus";
        private const string SP_ORDER_GETBYID = "sp_Order_GetByID";
        private const string SP_ORDER_GETALL = "sp_Order_GetAll";
        private const string SP_ORDER_GETBYUSERID = "sp_Order_GetByUserID";
        private const string SP_ORDER_GETTOP = "sp_Order_GetTop";

        public string Insert(OrderInfo entity)
        {
            entity.ID = IdHelper.Generate();
            var @param = new[]
            {
                new SqlParameter("@ID", (object)entity.ID),
                new SqlParameter("@User_ID", (object)entity.User.ID),
                new SqlParameter("@Status", (object)entity.Status),
                new SqlParameter("@Deal_ID", (object)entity.DealID),
                new SqlParameter("@Tracking_Number", (object)entity.TrackingNumber)
            };
            SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_ORDER_INSERT, @param);

            return entity.ID;
        }

        public bool UpdateStatus(string id, string status, string tracking)
        {
            var @param = new[]
            {
                new SqlParameter("@ID", (object)id),
                new SqlParameter("@Status", (object)status),
                new SqlParameter("@Tracking_Number", (object)tracking)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_ORDER_UPDATESTATUS, @param);

            return affect > 0;
        }

        public OrderInfo GetById(string id, string dealId)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@ID", id),
                new SqlParameter("@Deal_ID", dealId)
            };

            List<OrderInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_ORDER_GETBYID, @param, ParseOrder);
            if (list.Count > 0)
            {
                return list[0];
            }

            throw new Exception("Order not found");
        }

        public List<OrderInfo> GetAll()
        {
            List<OrderInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, SP_ORDER_GETALL, null, ParseOrder);

            return list;
        }

        public List<OrderInfo> GetByUserId(string userId)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@User_ID", userId)
            };
            List<OrderInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, SP_ORDER_GETBYUSERID, @param, ParseOrder);

            return list;
        }

        public List<OrderInfo> GetTop(int topNum)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@topNumber", topNum)
            };
            List<OrderInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, SP_ORDER_GETTOP, @param, ParseOrder);

            return list;
        }

        protected List<OrderInfo> ParseOrder(IDataReader reader)
        {
            var list = new List<OrderInfo>();
            while (reader.Read())
            {
                var entity = new OrderInfo()
                {
                    ID = reader["ID"].ToString(),
                    User = new UserInfo()
                    {
                        ID = reader["User_ID"].ToString()
                    },
                    Status = (OrderStatus)Enum.Parse(typeof(OrderStatus), reader["Status"].ToString()),
                    DealID = reader["Deal_ID"].ToString(),
                    DateCreated = reader["Created_Date"].ToString(),
                    DateProcess = reader["Process_Date"].ToString(),
                    TrackingNumber = reader["Tracking_Number"].ToString()
                };
                list.Add(entity);
            }

            return list;
        }
    }
}