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
    public class CategoryService
    {
        private readonly ICategoryAdapter _categoryAdapter;

        public CategoryService()
        {
            _categoryAdapter = new CategoryDataAdapter();
        }

        public string Create(CategoryInfo entity)
        {
            return _categoryAdapter.Insert(entity);
        }

        public bool Update(CategoryInfo entity)
        {
            return _categoryAdapter.Update(entity);
        }

        public bool Delete(string id)
        {
            return _categoryAdapter.Delete(id);
        }

        public CategoryInfo ReadById(string id)
        {
            return _categoryAdapter.GetById(id);
        }

        public List<CategoryInfo> ReadAll()
        {
            return _categoryAdapter.GetAll();
        }

        public List<CategoryInfo> ReadByEnable(bool isEnable)
        {
            return _categoryAdapter.GetByEnable(isEnable);
        }

        public List<CategoryInfo> ReadProductByCategoryId()
        {
            return _categoryAdapter.CountProductByCategory();
        }
    }
}