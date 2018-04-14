using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using HM.Common;
using HM.Model;
using HM.Util;
using HM.Core;
using HM.Data.Interface;

namespace HM.Data.DataAdapter.SqlServer
{
    public class SupplierDataAdapter: ISupplierAdapter
    {
        private const string SP_SUPPLIER_INSERT = "sp_Supplier_Insert";
        private const string SP_SUPPLIER_UPDATE = "sp_Supplier_Update";
        private const string SP_SUPPLIER_DELETE = "sp_Supplier_Delete";
        private const string SP_SUPPLIER_GETBYID = "sp_Supplier_GetById";
        private const string SP_SUPPLIER_GETALL = "sp_Supplier_GetAll";

        public string Insert(SupplierInfo entity)
        {
            entity.ID = IdHelper.Generate();
            var @param = new[]
            {
                new SqlParameter("@ID", (object)entity.ID),
                new SqlParameter("@Name", (object)entity.Name),
                new SqlParameter("@Address", (object)entity.Address),
                new SqlParameter("@Phone", (object)entity.Phone),
                new SqlParameter("@Fax", (object)entity.Fax),
                new SqlParameter("@Website", (object)entity.Website)
            };
            SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_SUPPLIER_INSERT, @param);

            return entity.ID;
        }

        public bool Update(SupplierInfo entity)
        {
            var @param = new[]
            {
                new SqlParameter("@ID", (object)entity.ID),
                new SqlParameter("@Name", (object)entity.Name),
                new SqlParameter("@Address", (object)entity.Address),
                new SqlParameter("@Phone", (object)entity.Phone),
                new SqlParameter("@Fax", (object)entity.Fax),
                new SqlParameter("@Website", (object)entity.Website)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_SUPPLIER_UPDATE, @param);

            return affect > 0;
        }

        public bool Delete(string supplierId)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@ID", (object)supplierId)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_SUPPLIER_DELETE, @param);

            return affect > 0;
        }

        public SupplierInfo GetById(string supplierId)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@ID", supplierId)
            };

            List<SupplierInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_SUPPLIER_GETBYID, @param, ParseSupplier);
            if (list.Count > 0)
            {
                return list[0];
            }

            throw new Exception("Role not found");
        }

        public List<SupplierInfo> GetAll()
        {
            List<SupplierInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, SP_SUPPLIER_GETALL, null, ParseSupplier);

            return list;
        }

        protected List<SupplierInfo> ParseSupplier(IDataReader reader)
        {
            var list = new List<SupplierInfo>();
            while (reader.Read())
            {
                var entity = new SupplierInfo()
                {
                    ID = reader["ID"].ToString(),
                    Name = reader["Name"].ToString(),
                    Address = reader["Address"].ToString(),
                    Phone = reader["Phone"].ToString(),
                    Fax = reader["Fax"].ToString(),
                    Website = reader["Website"].ToString()
                };
                list.Add(entity);
            }

            return list;
        }
    }
}