using System;
using System.Text;
using System.Collections.Generic;
using System.Data;
using HM.Model;
using HM.Data;
using HM.Data.Interface;
using HM.Data.DataAdapter.SqlServer;

namespace HM.Services
{
   public class ProductService
    {
        private readonly IProductAdapter _productAdapter;
        private readonly IProductImageAdapter _productImageAdapter;

        public ProductService()
        {
            _productAdapter = new ProductDataAdapter();
            _productImageAdapter = new ProductImageDataAdapter();
        }
        public string Create(ProductInfo entity)
        {
            return _productAdapter.Insert(entity);
        }

        public bool Upate(ProductInfo product)
        {
            return _productAdapter.Update(product);
        }

        public bool Delete(string productId)
        {
            return _productAdapter.Delete(productId);
        }

        public ProductInfo ReadById(string id)
        {
            return _productAdapter.GetById(id);
        }

        public List<ProductInfo> ReadAll()
        {
            return _productAdapter.GetAll();
        }

        public List<ProductInfo> ReadTop(int topNum)
        {
            return _productAdapter.GetTop(topNum);
        }

        public List<ProductInfo> ReadByCreteria(string criteria)
        {
            return _productAdapter.GetByCriteria(criteria);
        }

        public List<ProductInfo> ReadByCategoryId(string categoryId)
        {
            return _productAdapter.GetByCategoryId(categoryId);
        }
        
        public ProductImageInfo ReadImage(string imageId)
        {
            return _productImageAdapter.GetById(imageId);
        }
    }
}
