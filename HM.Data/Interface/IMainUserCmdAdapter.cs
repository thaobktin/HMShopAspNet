using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HM.Model;

namespace HM.Data.Interface
{
    public interface IMainUserCmdAdapter
    {
        string Insert(MainUserCmdInfo entity);
        bool Delete(MainUserCmdInfo entity);
        bool CheckRole(MainUserCmdInfo entity);
        List<MainUserCmdInfo> GetGroupByUserId(string userID);
        List<MainUserCmdInfo> GetCmdByUserId(string userID);
    }
}
