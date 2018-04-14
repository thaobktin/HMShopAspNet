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
    public class MainGroupUserDataAdapter: IMainGroupUserAdapter
    {
        private const string SP_MAIN_GROUP_USER_INSERT = "sp_Main_Group_User_Insert";
        private const string SP_MAIN_GROUP_USER_DELETE = "sp_Main_Group_User_Delete";
        private const string SP_MAIN_GROUP_USER_GETBYGROUPID = "sp_Main_Group_User_GetByGroupID";
        private const string SP_MAIN_GROUP_USER_GETBYUSERID = "sp_Main_Group_User_GetByUserID";

        public string Insert(MainGroupUserInfo entity)
        {
            var ID = IdHelper.Generate();
            var @param = new[]
            {
                new SqlParameter("@ID", (object)ID),
                new SqlParameter("@Group_ID", (object)entity.GroupID),
                new SqlParameter("@User_ID", (object)entity.UserID)
            };
            SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_MAIN_GROUP_USER_INSERT, @param);

            return ID;
        }

        public bool Delete(MainGroupUserInfo entity)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@Group_ID", (object)entity.GroupID),
                new SqlParameter("@User_ID", (object)entity.UserID)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_MAIN_GROUP_USER_DELETE, @param);

            return affect > 0;
        }

        public List<MainGroupUserInfo> GetByGroupId(string groupID)
        {
            List<MainGroupUserInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, SP_MAIN_GROUP_USER_GETBYGROUPID, null, ParseMainGroupUser);

            return list;
        }

        public List<MainGroupUserInfo> GetByUserId(string userID)
        {
            List<MainGroupUserInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, SP_MAIN_GROUP_USER_GETBYUSERID, null, ParseMainGroupUser);

            return list;
        }

        protected List<MainGroupUserInfo> ParseMainGroupUser(IDataReader reader)
        {
            var list = new List<MainGroupUserInfo>();
            while (reader.Read())
            {
                var entity = new MainGroupUserInfo()
                {
                    ID = reader["ID"].ToString(),
                    GroupID = reader["Group_ID"].ToString(),
                    UserID = reader["User_ID"].ToString()
                };
                list.Add(entity);
            }

            return list;
        }

    }
}