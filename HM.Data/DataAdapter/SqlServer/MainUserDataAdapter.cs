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
    public class MainUserDataAdapter: IMainUserAdapter
    {
        private const string SP_MAIN_USER_INSERT = "sp_Main_User_Insert";
        private const string SP_MAIN_USER_UPDATE = "sp_Main_User_Update";
        private const string SP_MAIN_USER_DELETE = "sp_Main_User_Delete";
        private const string SP_MAIN_USER_GETBYID = "sp_Main_User_GetByID";
        private const string SP_MAIN_USER_GETALL = "sp_Main_User_GetAll";
        private const string SP_MAIN_USER_GETBYEMAIL = "sp_Main_User_GetByEmail";
        private const string SP_MAIN_USER_GETBYEMAILPASSWORD = "sp_Main_User_GetByEmailPassword";
        
        public string Insert(MainUserInfo entity)
        {
            entity.ID = IdHelper.Generate();
            var @param = new[]
            {
                new SqlParameter("@ID", (object)entity.ID),
                new SqlParameter("@Email", (object)entity.Email),
                new SqlParameter("@Email_Confirmed", (object)entity.EmailConfirmed),
                new SqlParameter("@Full_Name", (object)entity.FullName),
                new SqlParameter("@Login_Name", (object)entity.LoginName),
                new SqlParameter("@Password", (object)entity.Password),
                new SqlParameter("@Gender", (object)entity.Gender),
                new SqlParameter("@Birthday", (object)entity.Birthday),
                new SqlParameter("@Address", (object)entity.Address),
                new SqlParameter("@Phone", (object)entity.Phone),
                new SqlParameter("@Super_Admin", (object)entity.SuperAdmin),
                new SqlParameter("@Avatar", (object)entity.Avatar)
            };
            SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_MAIN_USER_INSERT, @param);

            return entity.ID;
        }

        public bool Update(MainUserInfo entity)
        {
            var @param = new[]
            {
                new SqlParameter("@ID", (object)entity.ID),
                new SqlParameter("@Email", (object)entity.Email),
                new SqlParameter("@Email_Confirmed", (object)entity.EmailConfirmed),
                new SqlParameter("@Full_Name", (object)entity.FullName),
                new SqlParameter("@Login_Name", (object)entity.LoginName),
                new SqlParameter("@Password", (object)entity.Password),
                new SqlParameter("@Gender", (object)entity.Gender),
                new SqlParameter("@Birthday", (object)entity.Birthday),
                new SqlParameter("@Address", (object)entity.Address),
                new SqlParameter("@Phone", (object)entity.Phone),
                new SqlParameter("@Super_Admin", (object)entity.SuperAdmin),
                new SqlParameter("@Avatar", (object)entity.Avatar)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_MAIN_USER_UPDATE, @param);

            return affect > 0;
        }

        public bool Delete(string id)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@ID", (object)id)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_MAIN_USER_DELETE, @param);

            return affect > 0;
        }

        public MainUserInfo GetById(string id)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@ID", id)
            };

            List<MainUserInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_MAIN_USER_GETBYID, @param, ParseMainUser);
            if (list.Count > 0)
            {
                return list[0];
            }

            throw new Exception("Main User not found");
        }

        public List<MainUserInfo> GetAll()
        {
            List<MainUserInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, SP_MAIN_USER_GETALL, null, ParseMainUser);

            return list;
        }

        public MainUserInfo GetByEmail(string email)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@Email", email)
            };

            List<MainUserInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_MAIN_USER_GETBYEMAIL, @param, ParseMainUser);
            if (list.Count > 0)
            {
                return list[0];
            }

            throw new Exception("Main User not found");
        }

        public MainUserInfo GetByEmailPassword(string email, string password)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@Email", email),
                new SqlParameter("@Password", SecurityUtil.MD5Encrypt(password))
            };
            
            List<MainUserInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_MAIN_USER_GETBYEMAILPASSWORD, @param, ParseMainUser);
            if (list.Count > 0)
            {
                return list[0];
            }

            throw new Exception("Main User not found");
        }

        protected List<MainUserInfo> ParseMainUser(IDataReader reader)
        {
            var list = new List<MainUserInfo>();
            while (reader.Read())
            {
                var entity = new MainUserInfo()
                {
                    ID = reader["ID"].ToString(),
                    Email = DataProvider.ColumnExists(reader, "Email") ? reader["Email"].ToString() : "",
                    EmailConfirmed = DataProvider.ColumnExists(reader, "Email_Confirmed") ? Convert.ToBoolean(reader["Email_Confirmed"].ToString()) : false,
                    FullName = DataProvider.ColumnExists(reader, "Full_Name") ? reader["Full_Name"].ToString() : "",
                    LoginName = DataProvider.ColumnExists(reader, "Login_Name") ? reader["Login_Name"].ToString() : "",
                    Password = DataProvider.ColumnExists(reader, "Password") ? reader["Password"].ToString() : "",
                    Gender = DataProvider.ColumnExists(reader, "Gender") ? Convert.ToBoolean(reader["Gender"].ToString()) : false,
                    Birthday = DataProvider.ColumnExists(reader, "Birthday") ? reader["Birthday"].ToString() : "",
                    Address = DataProvider.ColumnExists(reader, "Address") ? reader["Address"].ToString() : "",
                    Phone = DataProvider.ColumnExists(reader, "Phone") ? reader["Phone"].ToString() : "",
                    SuperAdmin = DataProvider.ColumnExists(reader, "Super_Admin") ? Convert.ToBoolean(reader["Super_Admin"].ToString()) : false,
                    Avatar = DataProvider.ColumnExists(reader, "Avatar") ? reader["Avatar"].ToString() : ""
                };
                list.Add(entity);
            }

            return list;
        }
    }
}