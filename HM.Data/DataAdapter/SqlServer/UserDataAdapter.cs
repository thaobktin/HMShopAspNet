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
    public class UserDataAdapter: IUserAdapter
    {
        private const string SP_USER_INSERT = "sp_User_Insert";
        private const string SP_USER_UPDATE = "sp_User_Update";
        private const string SP_USER_DELETE = "sp_User_Delete";
        private const string SP_USER_GETBYID = "sp_User_GetById";
        private const string SP_USER_GETALL = "sp_User_GetAll";
        private const string SP_USER_GETBYAPPID = "sp_User_GetByAppId";
        private const string SP_USER_GETBYUSERNAME = "sp_User_GetByUserName";
        private const string SP_USER_GETUSERBYUSERNAMEPASSWORD = "sp_User_GetUserByUserNamePassword";

        public string Insert(UserInfo entity)
        {
            entity.ID = IdHelper.Generate();
            var @param = new[]
            {
                new SqlParameter("@ID", (object)entity.ID),
                new SqlParameter("@Full_Name", (object)entity.FullName),
                new SqlParameter("@User_Name", (object)entity.UserName),
                new SqlParameter("@Email", (object)entity.Email),
                new SqlParameter("@Password", (object)entity.Password),
                new SqlParameter("@Type_Social", (object)entity.TypeSocial),
                new SqlParameter("@AppID", (object)entity.AppID),
                new SqlParameter("@Address", (object)entity.Address),
                new SqlParameter("@Phone", (object)entity.Phone)
            };
            SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_USER_INSERT, @param);

            return entity.ID;
        }

        public bool Update(UserInfo entity)
        {
            var @param = new[]
            {
                new SqlParameter("@ID", (object)entity.ID),
                new SqlParameter("@Full_Name", (object)entity.FullName),
                new SqlParameter("@User_Name", (object)entity.UserName),
                new SqlParameter("@Email", (object)entity.Email),
                new SqlParameter("@Password", (object)entity.Password),
                new SqlParameter("@Type_Social", (object)entity.TypeSocial),
                new SqlParameter("@AppID", (object)entity.AppID),
                new SqlParameter("@Address", (object)entity.Address),
                new SqlParameter("@Phone", (object)entity.Phone)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_USER_UPDATE, @param);

            return affect > 0;
        }

        public bool Delete(string userId)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@ID", (object)userId)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_USER_DELETE, @param);

            return affect > 0;
        }

        public UserInfo GetById(string userId)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@ID", userId)
            };

            List<UserInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_USER_GETBYID, @param, ParseUser);
            if (list.Count > 0)
            {
                return list[0];
            }

            throw new Exception("User not found");
        }

        public List<UserInfo> GetAll()
        {
            List<UserInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, SP_USER_GETALL, null, ParseUser);

            return list;
        }

        public UserInfo GetByAppId(string appId, int typeSocial)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@AppID", appId),
                new SqlParameter("@Type_Social", typeSocial)
            };

            List<UserInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_USER_GETBYAPPID, @param, ParseUser);
            if (list.Count > 0)
            {
                return list[0];
            }

            throw new Exception("User not found");
        }

        public UserInfo GetByUserName(string userName)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@User_Name", userName)
            };

            List<UserInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_USER_GETBYUSERNAME, @param, ParseUser);
            if (list.Count > 0)
            {
                return list[0];
            }

            return null;
        }

        public UserInfo GetByUserNamePassword(string userName, string password)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@User_Name", userName),
                new SqlParameter("@Password", SecurityUtil.MD5Encrypt(password))
            };

            List<UserInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_USER_GETUSERBYUSERNAMEPASSWORD, @param, ParseUser);
            if (list.Count > 0)
            {
                return list[0];
            }

            throw new Exception("User not found");
        }

        protected List<UserInfo> ParseUser(IDataReader reader)
        {
            var list = new List<UserInfo>();
            while (reader.Read())
            {
                var entity = new UserInfo()
                {
                    ID = reader["ID"].ToString(),
                    FullName = DataProvider.ColumnExists(reader, "Full_Name") ? reader["Full_Name"].ToString() : "",
                    UserName = DataProvider.ColumnExists(reader, "User_Name") ? reader["User_Name"].ToString() : "",
                    Email = DataProvider.ColumnExists(reader, "Email") ? reader["Email"].ToString() : "",
                    Password = DataProvider.ColumnExists(reader, "Password") ? reader["Password"].ToString() : "",
                    TypeSocial = DataProvider.ColumnExists(reader, "Type_Social") ? reader["Type_Social"].ToString() : "",
                    AppID = DataProvider.ColumnExists(reader, "AppID") ? reader["AppID"].ToString() : "",
                    Address = DataProvider.ColumnExists(reader, "Address") ? reader["Address"].ToString() : "",
                    Phone = DataProvider.ColumnExists(reader, "Phone") ? reader["Phone"].ToString() : ""
                };
                list.Add(entity);
            }

            return list;
        }
    }
}