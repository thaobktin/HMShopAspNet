using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HM.Model;

namespace HM.Data.Interface
{
    public interface IOrderAdapter
    {
        string Insert(OrderInfo entity);
        bool UpdateStatus(string id, string status, string tracking);
        OrderInfo GetById(string id, string dealId);
        List<OrderInfo> GetAll();
        List<OrderInfo> GetByUserId(string userId);
        List<OrderInfo> GetTop(int topNum);

    }
}
