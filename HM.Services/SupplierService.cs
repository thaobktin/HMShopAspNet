using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using HM.Model;
using HM.Util;
using HM.Data.Interface;
using HM.Data.DataAdapter.SqlServer;

namespace HM.Services
{
    public class SupplierService
    {
        private readonly ISupplierAdapter _supplierAdapter;

        public SupplierService()
        {
            _supplierAdapter = new SupplierDataAdapter();
        }
        public string Create(SupplierInfo entity)
        {
            return _supplierAdapter.Insert(entity);
        }

        public bool Update(SupplierInfo entity)
        {
            return _supplierAdapter.Update(entity);
        }

        public bool Delete(string id)
        {
            return _supplierAdapter.Delete(id);
        }

        public SupplierInfo ReadById(string id)
        {
            return _supplierAdapter.GetById(id);
        }

        public List<SupplierInfo> ReadAll()
        {
            return _supplierAdapter.GetAll();
        }
    }
}
