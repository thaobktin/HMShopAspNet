using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HM.Model;

namespace HM.Data.Interface
{
    public interface IMainCmdAdapter
    {
        string Insert(MainCmdInfo entity);
        bool Update(MainCmdInfo entity);
        bool SetIndex(string cmdID, int index);
        bool Delete(string cmdID);
        MainCmdInfo GetById(string cmdID);
        MainCmdInfo GetByValue(string cmdVal);
        List<MainCmdInfo> GetByParentID(string parentID);
        List<MainCmdInfo> GetAll();
        int GetChildCount(string parentID);
    }
}
