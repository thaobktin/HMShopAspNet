using System;
using HM.Model.Enumerations;

namespace HM.Model
{
    [Serializable]
    public class OrderInfo
    {
        public string ID { get; set; }
        public UserInfo User { get; set; }
        public OrderStatus Status { get; set; }
        public string DealID { get; set; }
        public string DateCreated { get; set; }
        public string DateProcess { get; set; }
        public string TrackingNumber { get; set; }
    }
}
