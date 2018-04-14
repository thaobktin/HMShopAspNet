using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HM.Model;

namespace HM.Data.Interface
{
    public interface IOrderDetailAdapter
    {
        string Insert(OrderDetailInfo entity);
        List<OrderDetailInfo> GetByOrderId(string orderId);
        List<OrderDetailInfo> GetDetail(string orderId, string dealId, string userId);

    }
}
