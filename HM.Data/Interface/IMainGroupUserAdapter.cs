using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HM.Model;

namespace HM.Data.Interface
{
    public interface IMainGroupUserAdapter
    {
        string Insert(MainGroupUserInfo entity);
        bool Delete(MainGroupUserInfo entity);
        List<MainGroupUserInfo> GetByGroupId(string groupID);
        List<MainGroupUserInfo> GetByUserId(string userID);

    }
}
