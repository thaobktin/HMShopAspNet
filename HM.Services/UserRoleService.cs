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
    public class UserRoleService
    {
        private readonly IUserRoleAdapter _userRoleAdapter;

        public UserRoleService()
        {
            _userRoleAdapter = new UserRoleDataAdapter();
        }

        public string Create(UserRoleInfo entity)
        {
            return _userRoleAdapter.Insert(entity);
        }

        public bool SetRole(UserRoleInfo entity)
        {
            return _userRoleAdapter.SetRole(entity);
        }

        public bool Delete(string userID, string roleID)
        {
            return _userRoleAdapter.Delete(userID, roleID);
        }

        public bool CheckRole(string userID, string roleID)
        {
            return _userRoleAdapter.CheckRole(userID, roleID);
        }

        public List<UserRoleInfo> ReadByUserId(string userID)
        {
            return _userRoleAdapter.GetByUserId(userID);
        }
    }
}
