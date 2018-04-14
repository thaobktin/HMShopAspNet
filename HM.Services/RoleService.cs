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
    public class RoleService
    {
        private readonly IRoleAdapter _roleAdapter;

        public RoleService()
        {
            _roleAdapter = new RoleDataAdapter();
        }

        public string Create(RoleInfo entity)
        {
            return _roleAdapter.Insert(entity);
        }

        public bool Update(RoleInfo entity)
        {
            return _roleAdapter.Update(entity);
        }

        public bool Delete(string id)
        {
            return _roleAdapter.Delete(id);
        }

        public RoleInfo ReadById(string id)
        {
            return _roleAdapter.GetById(id);
        }

        public List<RoleInfo> ReadAll()
        {
            return _roleAdapter.GetAll();
        }
    }
}
