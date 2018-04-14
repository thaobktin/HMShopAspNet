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
    public class ProductImageDataAdapter: IProductImageAdapter
    {
        private const string SP_PRODUCT_IMAGE_INSERT = "sp_Product_Image_Insert";
        private const string SP_PRODUCT_IMAGE_UPDATE = "sp_Product_Image_Update";
        private const string SP_PRODUCT_IMAGE_DELETE = "sp_Product_Image_Delete";
        private const string SP_PRODUCT_IMAGE_GETBYID = "sp_Product_Image_GetByID";
        private const string SP_PRODUCT_IMAGE_GETALL = "sp_Product_Image_GetAll";

        public string Insert(ProductImageInfo entity)
        {
            entity.ID = IdHelper.Generate();
            var @param = new[]
            {
                new SqlParameter("@ID", (object)entity.ID),
                new SqlParameter("@Data", (object)entity.Data)
            };
            SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_PRODUCT_IMAGE_INSERT, @param);

            return entity.ID;
        }

        public bool Update(ProductImageInfo entity)
        {
            var @param = new[]
            {
                new SqlParameter("@ID", (object)entity.ID),
                new SqlParameter("@Data", (object)entity.Data)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_PRODUCT_IMAGE_UPDATE, @param);

            return affect > 0;
        }

        public bool Delete(string imageID)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@ID", (object)imageID)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_PRODUCT_IMAGE_DELETE, @param);

            return affect > 0;
        }

        public ProductImageInfo GetById(string imageID)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@ID", imageID)
            };

            List<ProductImageInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_PRODUCT_IMAGE_GETBYID, @param, ParseProductImage);
            if(list.Count > 0)
            {
                return list[0];
            }
               
            throw new Exception("Product Image not found");
        }

        public List<ProductImageInfo> GetAll()
        {
            List<ProductImageInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, SP_PRODUCT_IMAGE_GETALL, null, ParseProductImage);

            return list;
        }

        protected List<ProductImageInfo> ParseProductImage(IDataReader reader)
        {
            var list = new List<ProductImageInfo>();
            while (reader.Read())
            {
                var entity = new ProductImageInfo()
                {
                    ID = reader["ID"].ToString(),
                    Data = (byte[])reader["Data"]
                };
                list.Add(entity);
            }

            return list;
        }
    }
}