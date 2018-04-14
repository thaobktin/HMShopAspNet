using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HM.Model;

namespace HM.Data.Interface
{
    public interface IUserRoleAdapter
    {
        string Insert(UserRoleInfo entity);
        bool SetRole(UserRoleInfo entity);
        bool Delete(string userID, string roleID);
        bool CheckRole(string userID, string roleID);
        List<UserRoleInfo> GetByUserId(string userID);
    }
}
