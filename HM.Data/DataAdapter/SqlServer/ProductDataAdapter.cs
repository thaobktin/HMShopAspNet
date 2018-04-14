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
    public class ProductDataAdapter: IProductAdapter
    {
        private const string SP_PRODUCT_INSERT = "sp_Product_Insert";
        private const string SP_PRODUCT_UPDATE = "sp_Product_Update";
        private const string SP_PRODUCT_DELETE = "sp_Product_Delete";
        private const string SP_PRODUCT_GETBYID = "sp_Product_GetByID";
        private const string SP_PRODUCT_GETALL = "sp_Product_GetAll";
        private const string SP_PRODUCT_GETTOP = "sp_Product_GetTop";
        private const string SP_PRODUCT_GETBYCATEGORYID = "sp_Product_GetByCategoryID";
        private const string SP_PRODUCT_GETBYCRITERIA = "sp_Product_GetByCriteria";
        
        public string Insert(ProductInfo entity)
        {
            entity.ID = IdHelper.Generate();
            var @param = new[]
            {
                new SqlParameter("@ID", (object)entity.ID),
                new SqlParameter("@Category_ID", (object)entity.Category.ID),
                new SqlParameter("@Supplier_ID", (object)entity.Supplier.ID),
                new SqlParameter("@Product_Image_ID", (object)entity.Image.ID),
                new SqlParameter("@Name", (object)entity.Name),
                new SqlParameter("@Description", (object)entity.Description ?? DBNull.Value),
                new SqlParameter("@Cost", (object)entity.Cost ?? DBNull.Value),
                new SqlParameter("@Price", (object)entity.Price ?? DBNull.Value),
                new SqlParameter("@Continued", (object)entity.Continued ?? DBNull.Value)
            };
            SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_PRODUCT_INSERT, @param);

            return entity.ID;
        }

        public bool Update(ProductInfo entity)
        {
            var @param = new[]
            {
                new SqlParameter("@ID", (object)entity.ID),
                new SqlParameter("@Category_ID", (object)entity.Category.ID),
                new SqlParameter("@Supplier_ID", (object)entity.Supplier.ID),
                new SqlParameter("@Product_Image_ID", (object)entity.Image.ID),
                new SqlParameter("@Name", (object)entity.Name),
                new SqlParameter("@Description", (object)entity.Description ?? DBNull.Value),
                new SqlParameter("@Cost", (object)entity.Cost ?? DBNull.Value),
                new SqlParameter("@Price", (object)entity.Price ?? DBNull.Value),
                new SqlParameter("@Continued", (object)entity.Continued ?? DBNull.Value)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_PRODUCT_UPDATE, @param);

            return affect > 0;
        }

        public bool Delete(string productId)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@ID", (object)productId)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_PRODUCT_DELETE, @param);

            return affect > 0;
        }

        public ProductInfo GetById(string productId)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@ID", productId)
            };

            List<ProductInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_PRODUCT_GETBYID, @param, ParseProduct);
            if (list.Count > 0)
            {
                return list[0];
            }

            throw new Exception("Product not found");
        }

        public List<ProductInfo> GetAll()
        {
            List<ProductInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, SP_PRODUCT_GETALL, null, ParseProduct);

            return list;
        }

        public List<ProductInfo> GetTop(int topNumber)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@topNumber", topNumber)
            };
            List<ProductInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, SP_PRODUCT_GETTOP, @param, ParseProduct);

            return list;
        }

        public List<ProductInfo> GetByCategoryId(string categoryId)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@Category_ID", categoryId)
            };
            List<ProductInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, SP_PRODUCT_GETBYCATEGORYID, @param, ParseProduct);

            return list;
        }

        public List<ProductInfo> GetByCriteria(string criteria)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@Criteria", criteria)
            };
            List<ProductInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, SP_PRODUCT_GETBYCRITERIA, @param, ParseProduct);

            return list;
        }

        protected List<ProductInfo> ParseProduct(IDataReader reader)
        {
            var list = new List<ProductInfo>();
            while (reader.Read())
            {
                var entity = new ProductInfo()
                {
                    ID = reader["ID"].ToString(),
                    Category = new CategoryInfo()
                    {
                        Name = DataProvider.ColumnExists(reader, "Category_Name") ? reader["Category_Name"].ToString() : ""
                    },
                    CategoryName = DataProvider.ColumnExists(reader, "Category_Name") ? reader["Category_Name"].ToString() : "",
                    Supplier = new SupplierInfo()
                    {
                        Name = DataProvider.ColumnExists(reader, "Supplier_Name") ? reader["Supplier_Name"].ToString() : ""
                    },
                    SupplierName = DataProvider.ColumnExists(reader, "Supplier_Name") ? reader["Supplier_Name"].ToString() : "",
                    Image = new ProductImageInfo()
                    {
                        ID = DataProvider.ColumnExists(reader, "Product_Image_ID") ? reader["Product_Image_ID"].ToString() : ""
                    },
                    ProductImageId = DataProvider.ColumnExists(reader, "Product_Image_ID") ? reader["Product_Image_ID"].ToString() : "",
                    Name = reader["Name"].ToString(),
                    Description = reader["Description"].ToString(),
                    Cost = reader["Cost"].GetType() == typeof(DBNull) ? 0 : Convert.ToDecimal(reader["Cost"].ToString()),
                    Price = reader["Price"].GetType() == typeof(DBNull) ? 0 : Convert.ToDecimal(reader["Price"].ToString()),
                    Continued = reader["Continued"].GetType() == typeof(DBNull) ? false : Convert.ToBoolean(reader["Continued"].ToString())
                };
                list.Add(entity);
            }

            return list;
        }
    }
}