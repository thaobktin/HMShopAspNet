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
   public class ShopCartDataAdapter: IShopCartAdapter
    {
        private const string SP_SHOP_CART_INSERT = "sp_Shop_Cart_Insert";
        private const string SP_SHOP_CART_UPDATEAMOUNT = "sp_Shop_Cart_UpdateAmount";
        private const string SP_SHOP_CART_DELETE = "sp_Shop_Cart_Delete";
        private const string SP_SHOP_CART_GETBYGUID = "sp_Shop_Cart_GetByGuid";
        
        public string Insert(ShopCartInfo entity)
        {
            entity.ID = IdHelper.Generate();
            var @param = new[]
            {
                new SqlParameter("@ID", (object)entity.ID),
                new SqlParameter("@Guid", (object)entity.Guid),
                new SqlParameter("@Product_ID", (object)entity.Product.ID),
                new SqlParameter("@Amount", (object)entity.Amount)
            };
            SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_SHOP_CART_INSERT, @param);

            return entity.ID;
        }

        public bool UpdateAmount(ShopCartInfo entity)
        {
            var @param = new[]
            {
                new SqlParameter("@ID", (object)entity.ID),
                new SqlParameter("@Amount", (object)entity.Amount)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_SHOP_CART_UPDATEAMOUNT, @param);

            return affect > 0;
        }

        public bool Delete(string shopcartId)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@ID", (object)shopcartId)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_SHOP_CART_DELETE, @param);

            return affect > 0;
        }

        public List<ShopCartInfo> GetByGuid(string guid)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@Guid", guid)
            };
            
            List<ShopCartInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, SP_SHOP_CART_GETBYGUID, @param, ParseShopCart);

            return list;
        }

        protected List<ShopCartInfo> ParseShopCart(IDataReader reader)
        {
            var list = new List<ShopCartInfo>();
            while (reader.Read())
            {
                var entity = new ShopCartInfo()
                {
                    ID = reader["ID"].ToString(),
                    Product = new ProductInfo()
                    {
                        ID = DataProvider.ColumnExists(reader, "Product_ID") ? reader["Product_ID"].ToString() : "",
                        Name = DataProvider.ColumnExists(reader, "Product_Name") ? reader["Product_Name"].ToString() : ""
                    },
                    Amount = DataProvider.ColumnExists(reader, "Amount") ? Convert.ToInt32(reader["Amount"]) : -1,
                    Price = DataProvider.ColumnExists(reader, "Price") ? Convert.ToDecimal(reader["Price"]) : 0,
                    SumPrice = DataProvider.ColumnExists(reader, "Sum_Price") ? Convert.ToDecimal(reader["Sum_Price"]) : 0
                };
                list.Add(entity);
            }

            return list;
        }
    }
}