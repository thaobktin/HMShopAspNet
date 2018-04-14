using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HM.Model;

namespace HM.Data.Interface
{
    public interface IUserAdapter
    {
        string Insert(UserInfo entity);
        bool Update(UserInfo entity);
        bool Delete(string userId);
        UserInfo GetById(string userId);
        List<UserInfo> GetAll();
        UserInfo GetByAppId(string appId, int typeSocial);
        UserInfo GetByUserName(string userName);
        UserInfo GetByUserNamePassword(string userName, string passWord);

    }
}
