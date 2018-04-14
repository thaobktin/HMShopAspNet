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
    public class MainGroupCmdService
    {
        private readonly IMainGroupCmdAdapter _mainGroupCmdAdapter;

        public MainGroupCmdService()
        {
            _mainGroupCmdAdapter = new MainGroupCmdDataAdapter();
        }

        public string Create(MainGroupCmdInfo entity)
        {
            return _mainGroupCmdAdapter.Insert(entity);
        }
        
        public bool Delete(MainGroupCmdInfo entity)
        {
            return _mainGroupCmdAdapter.Delete(entity);
        }
        public List<MainGroupCmdInfo> ReadByGroupId(string id)
        {
            return _mainGroupCmdAdapter.GetByGroupId(id);
        }
    }
}
