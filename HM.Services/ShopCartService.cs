using System;
using System.Text;
using System.Collections.Generic;
using HM.Model;
using HM.Data;
using HM.Data.Interface;
using HM.Data.DataAdapter.SqlServer;

namespace HM.Services
{
   public class ShopCartService
    {
        private readonly IShopCartAdapter _shopCartAdapter;

        public ShopCartService()
        {
            _shopCartAdapter = new ShopCartDataAdapter();
        }
        public string Create(ShopCartInfo entity)
        {
            return _shopCartAdapter.Insert(entity);
        }

        public bool UpdateAmount(ShopCartInfo entity)
        {
            return _shopCartAdapter.UpdateAmount(entity);
        }

        public bool Delete(string id)
        {
            return _shopCartAdapter.Delete(id);
        }

        public List<ShopCartInfo> ReadByGuid(string guid)
        {
            return _shopCartAdapter.GetByGuid(guid);
        }
    }
}
