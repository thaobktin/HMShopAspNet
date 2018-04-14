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
    public class MainGroupDataAdapter: IMainGroupAdapter
    {
        private const string SP_MAIN_GROUP_INSERT = "sp_Main_Group_Insert";
        private const string SP_MAIN_GROUP_UPDATE = "sp_Main_Group_Update";
        private const string SP_MAIN_GROUP_DELETE = "sp_Main_Group_Delete";
        private const string SP_MAIN_GROUP_GETBYID = "sp_Main_Group_GetByID";
        private const string SP_MAIN_GROUP_GETALL = "sp_Main_Group_GetAll";

        public string Insert(MainGroupInfo entity)
        {
            entity.ID = IdHelper.Generate();
            var @param = new[]
            {
                new SqlParameter("@ID", (object)entity.ID),
                new SqlParameter("@Name", (object)entity.Name),
                new SqlParameter("@Description", (object)entity.Description)
            };
            SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_MAIN_GROUP_INSERT, @param);

            return entity.ID;
        }

        public bool Update(MainGroupInfo entity)
        {
            var @param = new[]
            {
                new SqlParameter("@ID", (object)entity.ID),
                new SqlParameter("@Name", (object)entity.Name),
                new SqlParameter("@Description", (object)entity.Description)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_MAIN_GROUP_UPDATE, @param);

            return affect > 0;
        }

        public bool Delete(string groupID)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@ID", (object)groupID)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_MAIN_GROUP_DELETE, @param);

            return affect > 0;
        }

        public MainGroupInfo GetById(string groupID)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@ID", groupID)
            };

            List<MainGroupInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_MAIN_GROUP_GETBYID, @param, ParseMainGroup);
            if (list.Count > 0)
            {
                return list[0];
            }

            throw new Exception("Main Group not found");
        }

        public List<MainGroupInfo> GetAll()
        {
            List<MainGroupInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, SP_MAIN_GROUP_GETALL, null, ParseMainGroup);

            return list;
        }

        protected List<MainGroupInfo> ParseMainGroup(IDataReader reader)
        {
            var list = new List<MainGroupInfo>();
            while (reader.Read())
            {
                var entity = new MainGroupInfo()
                {
                    ID = reader["ID"].ToString(),
                    Name = reader["Name"].ToString(),
                    Description = reader["Description"].ToString()
                };
                list.Add(entity);
            }

            return list;
        }
    }
}