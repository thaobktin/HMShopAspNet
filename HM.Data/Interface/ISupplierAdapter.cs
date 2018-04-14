using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HM.Model;

namespace HM.Data.Interface
{
    public interface ISupplierAdapter
    {
        string Insert(SupplierInfo entity);
        bool Update(SupplierInfo entity);
        bool Delete(string supplierId);
        SupplierInfo GetById(string supplierId);
        List<SupplierInfo> GetAll();
    }
}
