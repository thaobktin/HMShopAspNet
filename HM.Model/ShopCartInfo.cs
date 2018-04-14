using System;

namespace HM.Model
{
    [Serializable]
    public class ShopCartInfo
    {
        public string ID { get; set; }
        public string Guid { get; set; }
        public ProductInfo Product { get; set; }
        public int Amount { get; set; }
        public decimal Price { get; set; }
        public decimal SumPrice { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
