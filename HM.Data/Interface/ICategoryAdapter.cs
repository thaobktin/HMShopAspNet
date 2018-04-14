using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HM.Model;


namespace HM.Data.Interface
{
    public interface ICategoryAdapter
    {
        string Insert(CategoryInfo entity);
        bool Update(CategoryInfo entity);
        bool Delete(string id);
        CategoryInfo GetById(string id);
        List<CategoryInfo> GetAll();
        List<CategoryInfo> CountProductByCategory();
        List<CategoryInfo> GetByEnable(bool isEnable);
    }
}
