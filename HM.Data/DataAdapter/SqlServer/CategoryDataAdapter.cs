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
    public class CategoryDataAdapter: ICategoryAdapter
    {
        private const string SP_CATEGORY_INSERT = "sp_Category_Insert";
        private const string SP_CATEGORY_UPDATE = "sp_Category_Update";
        private const string SP_CATEGORY_DELETE = "sp_Category_Delete";
        private const string SP_CATEGORY_GETBYID = "sp_Category_GetById";
        private const string SP_CATEGORY_GETALL = "sp_Category_GetAll";
        private const string SP_CATEGORY_COUNTPRODUCTBYCATEGORYID = "sp_Category_CountProductByCategoryID";
        private const string SP_CATEGORY_GETBYENABLE = "sp_Category_GetByEnable";
        
        public string Insert(CategoryInfo entity)
        {
            entity.ID = IdHelper.Generate();
            var @param = new[]
            {
                new SqlParameter("@ID", (object)entity.ID),
                new SqlParameter("@Name", (object)entity.Name),
                new SqlParameter("@Description", (object)entity.Description ?? DBNull.Value),
                new SqlParameter("@Picture", (object)entity.Picture ?? DBNull.Value),
                new SqlParameter("@Enable", (object)entity.Enable ?? DBNull.Value)
            };
            SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_CATEGORY_INSERT, @param);

            return entity.ID;
        }

        public bool Update(CategoryInfo entity)
        {
            var @param = new[]
            {
                new SqlParameter("@ID", (object)entity.ID),
                new SqlParameter("@Name", (object)entity.Name),
                new SqlParameter("@Description", (object)entity.Description ?? DBNull.Value),
                new SqlParameter("@Picture", (object)entity.Picture ?? DBNull.Value),
                new SqlParameter("@Enable", (object)entity.Enable ?? DBNull.Value)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_CATEGORY_UPDATE, @param);

            return affect > 0;
        }

        public bool Delete(string id)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@ID", (object)id)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_CATEGORY_DELETE, @param);

            return affect > 0;
        }

        public CategoryInfo GetById(string id)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@ID", id)
            };
            
            List<CategoryInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_CATEGORY_GETBYID, @param, ParseCategory);
            if (list.Count > 0)
            {
                return list[0];
            }

            throw new Exception("Category not found");
        }

        public List<CategoryInfo> GetAll()
        {
            List<CategoryInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, SP_CATEGORY_GETALL, null, ParseCategory);
            
            return list;
        }

        //GetMaster
        public List<CategoryInfo> CountProductByCategory()
        {
            List<CategoryInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, SP_CATEGORY_COUNTPRODUCTBYCATEGORYID, null, ParseCategory);

            return list;
        }

        public List<CategoryInfo> GetByEnable(bool isEnable)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@Enable", (object)isEnable ?? DBNull.Value)
            };
            List<CategoryInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, SP_CATEGORY_GETBYENABLE, @param, ParseCategory);

            return list;
        }

        protected List<CategoryInfo> ParseCategory(IDataReader reader)
        {
            var list = new List<CategoryInfo>();
            while (reader.Read())
            {
                var entity = new CategoryInfo()
                {
                    ID = reader["ID"].ToString(),
                    Name = reader["Name"].ToString(),
                    Description = reader["Description"].ToString(),
                    Picture = reader["Picture"].ToString(),
                    Enable = Convert.ToBoolean(reader["Enable"])
                };
                list.Add(entity);
            }

            return list;
        }

    }
}