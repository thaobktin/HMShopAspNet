using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using HM.Model;
using HM.Data;
using HM.Data.Interface;
using HM.Data.DataAdapter.SqlServer;

namespace HM.Services
{
    public class LanguageService
    {
        private readonly ILanguageAdapter _languageAdapter;

        public LanguageService()
        {
            _languageAdapter = new LanguageDataAdapter();
        }

        public string Create(LanguageInfo entity)
        {
            return _languageAdapter.Insert(entity);
        }

        public bool Update(LanguageInfo entity)
        {
            return _languageAdapter.Update(entity);
        }

        public bool Delete(string id)
        {
            return _languageAdapter.Delete(id);
        }
        public LanguageInfo ReadById(string id)
        {
            return _languageAdapter.GetById(id);
        }

        public List<LanguageInfo> ReadAll()
        {
            return _languageAdapter.GetAll();
        }
    }
}
