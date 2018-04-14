using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HM.Model;

namespace HM.Data.Interface
{
    public interface IShopCartAdapter
    {
        string Insert(ShopCartInfo entity);
        bool UpdateAmount(ShopCartInfo entity);
        bool Delete(string shopcartId);
        List<ShopCartInfo> GetByGuid(string guid);
    }
}
