using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HM.Model;

namespace HM.Data.Interface
{
    public interface IProductImageAdapter
    {
        string Insert(ProductImageInfo entity);
        bool Update(ProductImageInfo entity);
        bool Delete(string imageID);
        ProductImageInfo GetById(string imageID);
        List<ProductImageInfo> GetAll();
    }
}
