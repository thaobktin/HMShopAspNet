using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using HM.Model;
using HM.Common;
using HM.Core;
using HM.Util;
using HM.Data.Interface;

namespace HM.Data.DataAdapter.SqlServer
{	
	public class UserRoleDataAdapter: IUserRoleAdapter
    {
        const string SP_USER_ROLE_INSERT = "sp_User_Role_Insert";
        const string SP_USER_ROLE_CHECKROLE = "sp_User_Role_CheckRole";
        const string SP_USER_ROLE_GETBYUSERID = "sp_User_Role_GetByUserID";
        const string SP_USER_ROLE_DELETE = "sp_User_Role_Delete";
        const string SP_USER_ROLE_SET = "sp_User_Role_Set";

        public string Insert(UserRoleInfo entity)
        {
            entity.ID = IdHelper.Generate();
            var param = new[]
            {
                new SqlParameter("@ID", (object)entity.ID),
                new SqlParameter("@User_ID", (object)entity.UserID),
                new SqlParameter("@Role_ID", (object)entity.RoleID)
            };
            SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_USER_ROLE_INSERT, param);

            return entity.ID;
        }

        public bool SetRole(UserRoleInfo entity)
        {
            var @param = new[]
            {
                new SqlParameter("@ID", (object)entity.ID),
                new SqlParameter("@User_ID", (object)entity.UserID),
                new SqlParameter("@Role_ID", (object)entity.RoleID)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_USER_ROLE_SET, @param);

            return affect > 0;
        }

        public bool Delete(string userID, string roleID)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@User_ID", (object)userID),
                new SqlParameter("@Role_ID", (object)roleID)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_USER_ROLE_DELETE, @param);

            return affect > 0;
        }

        public bool CheckRole(string userID, string roleID)
		{
			int retVal = 0;
            
            var param = new[]
            {
                new SqlParameter("@User_ID", (object)userID),
                new SqlParameter("@Role_ID", (object)roleID)
            };
            retVal = SqlHelper.ExecuteScalar<int>(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_USER_ROLE_CHECKROLE, param);

            return retVal == 0 ? false : true;
        }

		public List<UserRoleInfo> GetByUserId(string userID)
		{
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@User_ID", userID)
            };
            
            List<UserRoleInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, SP_USER_ROLE_GETBYUSERID, @param, ParseUserRole);

            return list;
        }

        protected List<UserRoleInfo> ParseUserRole(IDataReader reader)
        {
            var list = new List<UserRoleInfo>();
            while (reader.Read())
            {
                var entity = new UserRoleInfo()
                {
                    ID = reader["UserRole_ID"].ToString(),
                    UserID = reader["User_ID"].ToString(),
                    RoleID = reader["Role_ID"].ToString()
                };
                list.Add(entity);
            }

            return list;
        }
    }
}