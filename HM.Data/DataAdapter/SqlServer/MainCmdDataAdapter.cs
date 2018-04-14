using System;
using System.Data;
using System.Data.SqlClient;
using HM.Model;
using HM.Util;
using HM.Common;
using HM.Core;
using System.Collections.Generic;
using HM.Data.Interface;

namespace HM.Data.DataAdapter.SqlServer
{
    public class MainCmdDataAdapter: IMainCmdAdapter
    {
        private const string SP_MAIN_CMD_INSERT = "sp_Main_Cmd_Insert";
        private const string SP_MAIN_CMD_UPDATE = "sp_Main_Cmd_Update";
        private const string SP_MAIN_CMD_SETINDEX = "sp_Main_Cmd_SetIndex";
        private const string SP_MAIN_CMD_DELETE = "sp_Main_Cmd_Delete";
        private const string SP_MAIN_CMD_GETBYID = "sp_Main_Cmd_GetByID";
        private const string SP_MAIN_CMD_GETBYVALUE = "sp_Main_Cmd_GetByValue";
        private const string SP_MAIN_CMD_GETBYPARENTID = "sp_Main_Cmd_GetByParentID";
        private const string SP_MAIN_CMD_GETALL = "sp_Main_Cmd_GetAll";
        private const string SP_MAIN_CMD_COUNTCHILD = "sp_Main_Cmd_CountChild";
        
        public string Insert(MainCmdInfo entity)
        {
            entity.ID = IdHelper.Generate();
            var @param = new[]
            {
                new SqlParameter("@ID", (object)entity.ID),
                new SqlParameter("@Name", (object)entity.Name),
                new SqlParameter("@Value", (object)entity.Value),
                new SqlParameter("@Parent_ID", (object)entity.ParentID),
                new SqlParameter("@Url", (object)entity.Url),
                new SqlParameter("@Path", (object)entity.Path),
                new SqlParameter("@Enable", (object)entity.Enable),
                new SqlParameter("@Visible", (object)entity.Visible)
            };
            SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_MAIN_CMD_INSERT, @param);

            return entity.ID;
        }

        public bool Update(MainCmdInfo entity)
        {
            var @param = new[]
            {
                new SqlParameter("@ID", (object)entity.ID),
                new SqlParameter("@Name", (object)entity.Name),
                new SqlParameter("@Value", (object)entity.Value),
                new SqlParameter("@Parent_ID", (object)entity.ParentID),
                new SqlParameter("@Url", (object)entity.Url),
                new SqlParameter("@Path", (object)entity.Path),
                new SqlParameter("@Enable", (object)entity.Enable),
                new SqlParameter("@Visible", (object)entity.Visible)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_MAIN_CMD_UPDATE, @param);

            return affect > 0;
        }

        public bool SetIndex(string cmdID, int index)
        {
            var @param = new[]
            {
                new SqlParameter("@ID", (object)cmdID),
                new SqlParameter("@Index", (object)index)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_MAIN_CMD_SETINDEX, @param);

            return affect > 0;
        }

        public bool Delete(string cmdID)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@ID", (object)cmdID)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_MAIN_CMD_DELETE, @param);

            return affect > 0;
        }

        public MainCmdInfo GetById(string cmdID)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@ID", cmdID)
            };

            List<MainCmdInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_MAIN_CMD_GETBYID, @param, ParseMainCmd);
            if (list.Count > 0)
            {
                return list[0];
            }

            return null;
        }

        public MainCmdInfo GetByValue(string cmdVal)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@Value", cmdVal)
            };

            List<MainCmdInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_MAIN_CMD_GETBYVALUE, @param, ParseMainCmd);
            if (list.Count > 0)
            {
                return list[0];
            }

            throw new Exception("Main Cmd not found");
        }

        public List<MainCmdInfo> GetByParentID(string parentID)
        {
            var @param = new[]
            {
                new SqlParameter("@Parent_ID", (object)parentID)
            };
            List<MainCmdInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, SP_MAIN_CMD_GETBYPARENTID, @param, ParseMainCmd);

            return list;
        }

        public List<MainCmdInfo> GetAll()
        {
            List<MainCmdInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, SP_MAIN_CMD_GETALL, null, ParseMainCmd);

            return list;
        }

        public int GetChildCount(string parentID)
        {
            int num = 0;

            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@Parent_ID", parentID)
            };
            num = SqlHelper.ExecuteScalar<int>(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_MAIN_CMD_COUNTCHILD, @param);

            return num;
        }
        
        protected List<MainCmdInfo> ParseMainCmd(IDataReader reader)
        {
            var list = new List<MainCmdInfo>();
            while (reader.Read())
            {
                var entity = new MainCmdInfo()
                {
                    ID = reader["ID"].ToString(),
                    Name = reader["Name"].ToString(),
                    Value = reader["Value"].ToString(),
                    ParentID = reader["Parent_ID"].ToString(),
                    Url = reader["Url"].ToString(),
                    Path = reader["Path"].ToString(),
                    Enable = Convert.ToBoolean(reader["Enable"].ToString()),
                    Visible = Convert.ToBoolean(reader["Visible"].ToString())
                };
                list.Add(entity);
            }

            return list;
        }
    }
}