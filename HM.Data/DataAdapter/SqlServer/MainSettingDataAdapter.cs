using System;
using System.Data;
using System.Data.SqlClient;
using HM.Common;
using HM.Util;
using HM.Core;
using HM.Data.Interface;

namespace HM.Data.DataAdapter.SqlServer
{
    public class MainSettingDataAdapter: IMainSettingAdapter
    {
        private const string SP_MAIN_SETTING_SETVALUE = "sp_Main_Setting_SetValue";
        private const string SP_MAIN_SETTING_GETVALUE = "sp_Main_Setting_GetValue";
        private const string SP_MAIN_SETTING_DELETE = "sp_Main_Setting_Delete";
        private const string SP_MAIN_SETTING_DELETEBYNAME = "sp_Main_Setting_DeleteByName";

        public string SetValue(string name, string value)
        {
            var ID = IdHelper.Generate();
            var @param = new[]
            {
                new SqlParameter("@Name", (object)name),
                new SqlParameter("@Value", (object)value)
            };
            SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_MAIN_SETTING_SETVALUE, @param);

            return ID;
        }

        public string GetValue(string name)
        {
            string val = null;

            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@Name", name)
            };
            val = SqlHelper.ExecuteScalar<string>(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_MAIN_SETTING_GETVALUE, @param);

            return val;
        }

        public bool Delete(string id)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@ID", (object)id)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_MAIN_SETTING_DELETE, @param);

            return affect > 0;
        }

        public bool DeleteByName(string name)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@Name", (object)name)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_MAIN_SETTING_DELETEBYNAME, @param);

            return affect > 0;
        }
    }
}