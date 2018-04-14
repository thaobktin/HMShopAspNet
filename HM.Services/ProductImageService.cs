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
    public class ProductImageService
    {
        private readonly IProductImageAdapter _productImageAdapter;

        public ProductImageService()
        {
            _productImageAdapter = new ProductImageDataAdapter();
        }

        public string Create(ProductImageInfo entity)
        {
            return _productImageAdapter.Insert(entity);
        }

        public bool Update(ProductImageInfo entity)
        {
            return _productImageAdapter.Update(entity);
        }

        public bool Delete(string id)
        {
            return _productImageAdapter.Delete(id);
        }

        public ProductImageInfo ReadById(string id)
        {
            return _productImageAdapter.GetById(id);
        }

        public List<ProductImageInfo> ReadAll()
        {
            return _productImageAdapter.GetAll();
        }
    }
}
