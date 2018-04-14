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
    public class RoleDataAdapter: IRoleAdapter
    {
        private const string SP_ROLE_INSERT = "sp_Role_Insert";
        private const string SP_ROLE_UPDATE = "sp_Role_Update";
        private const string SP_ROLE_DELETE = "sp_Role_Delete";
        private const string SP_ROLE_GETBYID = "sp_Role_GetById";
        private const string SP_ROLE_GETALL = "sp_Role_GetAll";

        public string Insert(RoleInfo entity)
        {
            entity.ID = IdHelper.Generate();
            var @param = new[]
            {
                new SqlParameter("@ID", (object)entity.ID),
                new SqlParameter("@Name", (object)entity.Name)
            };
            SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_ROLE_INSERT, @param);

            return entity.ID;
        }

        public bool Update(RoleInfo entity)
        {
            var @param = new[]
            {
                new SqlParameter("@ID", (object)entity.ID),
                new SqlParameter("@Name", (object)entity.Name)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_ROLE_UPDATE, @param);

            return affect > 0;
        }

        public bool Delete(string roleId)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@ID", (object)roleId)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_ROLE_DELETE, @param);

            return affect > 0;
        }

        public RoleInfo GetById(string roleId)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@ID", roleId)
            };

            List<RoleInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_ROLE_GETBYID, @param, ParseRole);
            if (list.Count > 0)
            {
                return list[0];
            }

            throw new Exception("Role not found");
        }

        public List<RoleInfo> GetAll()
        {
            List<RoleInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, SP_ROLE_GETALL, null, ParseRole);

            return list;
        }

        protected List<RoleInfo> ParseRole(IDataReader reader)
        {
            var list = new List<RoleInfo>();
            while (reader.Read())
            {
                var entity = new RoleInfo()
                {
                    ID = reader["ID"].ToString(),
                    Name = reader["Name"].ToString()
                };
                list.Add(entity);
            }

            return list;
        }

    }
}