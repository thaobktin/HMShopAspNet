using System;
using System.Collections.Generic;

namespace HM.Model
{
    [Serializable]
    public class OrderDetailInfo
    {
        public string ID { get; set; }
        public string OrderID { get; set; }
        public ProductInfo Product { get; set; }
        public int Amount { get; set; }
    }
}
