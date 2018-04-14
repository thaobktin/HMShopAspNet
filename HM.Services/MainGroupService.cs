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
    public class MainGroupService
    {
        private readonly IMainGroupAdapter _mainGroupAdapter;

        public MainGroupService()
        {
            _mainGroupAdapter = new MainGroupDataAdapter();
        }

        public string Create(MainGroupInfo entity)
        {
            return _mainGroupAdapter.Insert(entity);
        }

        public bool Update(MainGroupInfo entity)
        {
            return _mainGroupAdapter.Update(entity);
        }

        public bool Delete(string id)
        {
            return _mainGroupAdapter.Delete(id);
        }
        public MainGroupInfo ReadById(string id)
        {
            return _mainGroupAdapter.GetById(id);
        }

        public List<MainGroupInfo> ReadAll()
        {
            return _mainGroupAdapter.GetAll();
        }
    }
}
