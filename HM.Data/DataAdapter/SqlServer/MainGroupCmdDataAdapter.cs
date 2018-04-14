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
    public class MainGroupCmdDataAdapter: IMainGroupCmdAdapter
    {
        private const string SP_MAIN_GROUP_CMD_INSERT = "sp_Main_Group_Cmd_Insert";
        private const string SP_MAIN_GROUP_CMD_DELETE = "sp_Main_Group_Cmd_Delete";
        private const string SP_MAIN_GROUP_CMD_GETBYGROUPID = "sp_Main_Group_Cmd_GetByGroupID";

        public string Insert(MainGroupCmdInfo entity)
        {
            var ID = IdHelper.Generate();
            var @param = new[]
            {
                new SqlParameter("@ID", (object)ID),
                new SqlParameter("@Group_ID", (object)entity.GroupID),
                new SqlParameter("@Cmd_ID", (object)entity.CmdID)
            };
            SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_MAIN_GROUP_CMD_INSERT, @param);

            return ID;
        }

        public bool Delete(MainGroupCmdInfo entity)
        {
            var @param = new SqlParameter[]
            {
                new SqlParameter("@Group_ID", (object)entity.GroupID),
                new SqlParameter("@Cmd_ID", (object)entity.CmdID)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_MAIN_GROUP_CMD_DELETE, @param);

            return affect > 0;
        }

        public List<MainGroupCmdInfo> GetByGroupId(string groupID)
        {
            var @param = new SqlParameter[]
            {
                new SqlParameter("@Group_ID", (object)groupID)
            };
            List<MainGroupCmdInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, SP_MAIN_GROUP_CMD_GETBYGROUPID, @param, ParseMainGroupCmd);

            return list;
        }

        protected List<MainGroupCmdInfo> ParseMainGroupCmd(IDataReader reader)
        {
            var list = new List<MainGroupCmdInfo>();
            while (reader.Read())
            {
                var entity = new MainGroupCmdInfo()
                {
                    ID = reader["ID"].ToString(),
                    GroupID = reader["Group_ID"].ToString(),
                    CmdID = reader["Cmd_ID"].ToString()
                };
                list.Add(entity);
            }

            return list;
        }
    }
}