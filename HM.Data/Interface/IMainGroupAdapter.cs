using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HM.Model;

namespace HM.Data.Interface
{
    public interface IMainGroupAdapter
    {
        string Insert(MainGroupInfo entity);
        bool Update(MainGroupInfo entity);
        bool Delete(string groupID);
        MainGroupInfo GetById(string groupID);
        List<MainGroupInfo> GetAll();
    }
}
