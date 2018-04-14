using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using HM.Model;
using HM.Data;
using HM.Data.Interface;
using HM.Data.DataAdapter.SqlServer;
using HM.Util;
using HM.Common;

namespace HM.Services
{
    public class UserService
    {
        private readonly IUserAdapter _userAdapter;

        public UserService()
        {
            _userAdapter = new UserDataAdapter();
        }

        public string Create(UserInfo user)
        {
            return _userAdapter.Insert(user); 
        }

        public bool Update(UserInfo userInfo)
        {
            return _userAdapter.Update(userInfo);
        }

        public bool Delete(string id)
        {
            return _userAdapter.Delete(id);
        }

        public UserInfo ReadById(string id)
        {
            return _userAdapter.GetById(id);
        }

        public List<UserInfo> ReadAll()
        {
            return _userAdapter.GetAll();
        }

        public UserInfo ReadByAppId(string appId, int typeSocial)
        {
            return _userAdapter.GetByAppId(appId, typeSocial);
        }

        public UserInfo ReadByUserName(string userName)
        {
            return _userAdapter.GetByUserName(userName);
        }

        public UserInfo CheckUser(string userName, string passWord)
        {
            return _userAdapter.GetByUserNamePassword(userName, passWord);
        }

        //public string ReadUserId()
        //{
        //    string appId = AuthenUtils.GetUserOrEmail(PathConfig.ADMIN_PREFIX);
        //    UserInfo user = _userAdapter.GetByAppId(appId, Constant.TYPE_SOCIAL_FACEBOOK);
        //    return user.ID;
        //}
    }
}
