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
	public class LanguageDataAdapter: ILanguageAdapter
    {
        private const string SP_LANGUAGE_INSERT = "sp_Language_Insert";
        private const string SP_LANGUAGE_UPDATE = "sp_Language_Update";
        private const string SP_LANGUAGE_DELETE = "sp_Language_Delete";
        private const string SP_LANGUAGE_GETBYID = "sp_Language_GetById";
        private const string SP_LANGUAGE_GETALL = "sp_Language_GetAll";

        public string Insert(LanguageInfo entity)
        {
            entity.ID = IdHelper.Generate();
            var @param = new[]
            {
                new SqlParameter("@ID", (object)entity.ID),
                new SqlParameter("@Key", (object)entity.Key),
                new SqlParameter("@Name", (object)entity.Name)
            };
            SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_LANGUAGE_INSERT, @param);

            return entity.ID;
        }

        public bool Update(LanguageInfo entity)
        {
            var @param = new[]
            {
                new SqlParameter("@ID", (object)entity.ID),
                new SqlParameter("@Key", (object)entity.Key),
                new SqlParameter("@Name", (object)entity.Name)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_LANGUAGE_UPDATE, @param);

            return affect > 0;
        }

        public bool Delete(string langId)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@ID", (object)langId)
            };
            var affect = SqlHelper.ExecuteNonQuery(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_LANGUAGE_DELETE, @param);

            return affect > 0;
        }

        public LanguageInfo GetById(string langId)
        {
            SqlParameter[] @param = new SqlParameter[]
            {
                new SqlParameter("@ID", langId)
            };
            
            List<LanguageInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, CommandType.StoredProcedure, SP_LANGUAGE_GETBYID, @param, ParseLanguage);
            if (list.Count > 0)
            {
                return list[0];
            }

            throw new Exception("Language not found");
        }

        public List<LanguageInfo> GetAll ()
		{
            List<LanguageInfo> list = SqlHelper.ExecuteReader(ConfigManager.ConnectionString, SP_LANGUAGE_GETALL, null, ParseLanguage);

            return list;
        }

        protected List<LanguageInfo> ParseLanguage(IDataReader reader)
        {
            var list = new List<LanguageInfo>();
            while (reader.Read())
            {
                var entity = new LanguageInfo()
                {
                    ID = reader["ID"].ToString(),
                    Key = reader["Key"].ToString(),
                    Name = reader["Name"].ToString()
                };
                list.Add(entity);
            }

            return list;
        }
    }
}