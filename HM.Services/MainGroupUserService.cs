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
    public class MainGroupUserService
    {
        private readonly IMainGroupUserAdapter _mainGroupUserAdapter;

        public MainGroupUserService()
        {
            _mainGroupUserAdapter = new MainGroupUserDataAdapter();
        }

        public string Create(MainGroupUserInfo entity)
        {
            return _mainGroupUserAdapter.Insert(entity);
        }
        
        public bool Delete(MainGroupUserInfo entity)
        {
            return _mainGroupUserAdapter.Delete(entity);
        }
        public List<MainGroupUserInfo> ReadByGroupId(string groupId)
        {
            return _mainGroupUserAdapter.GetByGroupId(groupId);
        }

        public List<MainGroupUserInfo> ReadByUserId(string userId)
        {
            return _mainGroupUserAdapter.GetByUserId(userId);
        }
    }
}
