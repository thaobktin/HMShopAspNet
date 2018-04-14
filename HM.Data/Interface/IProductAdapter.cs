using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HM.Model;

namespace HM.Data.Interface
{
    public interface IProductAdapter
    {
        string Insert(ProductInfo entity);
        bool Update(ProductInfo entity);
        bool Delete(string productId);
        ProductInfo GetById(string productId);
        List<ProductInfo> GetAll();
        List<ProductInfo> GetTop(int topNumber);
        List<ProductInfo> GetByCategoryId(string categoryId);
        List<ProductInfo> GetByCriteria(string criteria);

    }
}
