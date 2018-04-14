using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HM.Model;

namespace HM.Data.Interface
{
    public interface IRoleAdapter
    {
        string Insert(RoleInfo entity);
        bool Update(RoleInfo entity);
        bool Delete(string roleId);
        RoleInfo GetById(string roleId);
        List<RoleInfo> GetAll();
    }
}
