using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using HM.Common;
using HM.Util;
using HM.Core;
using HM.Model;
using HM.Data.Interface;

namespace HM.Data.DataAdapter.SqlServer
{
   public class MainUserCmdDataAdapter: IMainUserCmdAdapter
    {
        private const string SP_MAIN_USER_CMD_INSERT = "sp_Main_User_Cmd_Insert";
        private const string SP_MAIN_USER_CMD_DELETE = "sp_Main_User_Cmd_Delete";
        private const string SP_MAIN_USER_CMD_CHECKROLE = "sp_Main_User_Cmd_CheckRole";
        private const string SP_MAIN_USER_CMD_GETGROUPBYUSERID = "sp_Main_User_Cmd_GetGroupByUserID";
        private const string SP_MAIN_USER_CMD_GETCMDID = "sp_Main_User_Cmd_GetCmdID";
        
        public string Insert(MainUserCmdInfo entity)
        {
            var ID = IdHelper.Generate();
            var @param = new[]
            {
                new SqlParameter("@ID", (object)ID),
                new SqlParameter("@User_ID", (object)entity.UserID),
                new SqlParameter("@Cmd_ID", (object)entity.CmdID)
            };
            SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_MAIN_USER_CMD_INSERT, @param);

            return ID;
        }

        public bool Delete(MainUserCmdInfo entity)
        {
            var @param = new[]
            {
                new SqlParameter("@User_ID", (object)entity.UserID),
                new SqlParameter("@Cmd_ID", (object)entity.CmdID)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_MAIN_USER_CMD_DELETE, @param);

            return affect > 0;
        }

        public bool CheckRole(MainUserCmdInfo entity)
        {
            int flag;
            
            var ID = IdHelper.Generate();
            var @param = new[]
            {
                new SqlParameter("@User_ID", (object)entity.UserID),
                new SqlParameter("@Cmd_ID", (object)entity.CmdID)
            };
            flag = SqlHelper.ExecuteScalar<int>(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_MAIN_USER_CMD_CHECKROLE, @param);

            return flag > 0;
        }

        public List<MainUserCmdInfo> GetGroupByUserId(string userID)
        {
            var @param = new[]
            {
                new SqlParameter("@User_ID", (object)userID)
            };
            List<MainUserCmdInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, SP_MAIN_USER_CMD_GETGROUPBYUSERID, @param, ParseMainUserCmd);

            return list;
        }

        public List<MainUserCmdInfo> GetCmdByUserId(string userID)
        {
            var @param = new[]
            {
                new SqlParameter("@User_ID", (object)userID)
            };
            List<MainUserCmdInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, SP_MAIN_USER_CMD_GETCMDID, @param, ParseMainUserCmd);

            return list;
        }

        protected List<MainUserCmdInfo> ParseMainUserCmd(IDataReader reader)
        {
            var list = new List<MainUserCmdInfo>();
            while (reader.Read())
            {
                var entity = new MainUserCmdInfo()
                {
                    ID = reader["ID"].ToString(),
                    UserID = reader["User_ID"].ToString(),
                    CmdID = reader["Cmd_ID"].ToString()
                };
                list.Add(entity);
            }

            return list;
        }
    }
}