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
    public class MainUserCmdService
    {
        private readonly IMainUserCmdAdapter _mainUserCmdAdapter;

        public MainUserCmdService()
        {
            _mainUserCmdAdapter = new MainUserCmdDataAdapter();
        }

        public string Create(MainUserCmdInfo entity)
        {
            return _mainUserCmdAdapter.Insert(entity);
        }
        
        public bool Delete(MainUserCmdInfo entity)
        {
            return _mainUserCmdAdapter.Delete(entity);
        }

        public bool CheckRole(MainUserCmdInfo entity)
        {
            return _mainUserCmdAdapter.CheckRole(entity);
        }

        public List<MainUserCmdInfo> ReadGroupByUserId(string userID)
        {
            return _mainUserCmdAdapter.GetGroupByUserId(userID);
        }

        public List<MainUserCmdInfo> ReadCmdByUserId(string userID)
        {
            return _mainUserCmdAdapter.GetCmdByUserId(userID);
        }
    }
}
