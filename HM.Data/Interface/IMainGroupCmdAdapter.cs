using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HM.Model;

namespace HM.Data.Interface
{
    public interface IMainGroupCmdAdapter
    {
        string Insert(MainGroupCmdInfo entity);
        bool Delete(MainGroupCmdInfo entity);
        List<MainGroupCmdInfo> GetByGroupId(string groupID);
    }
}
