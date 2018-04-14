using System;

namespace HM.Model
{
    [Serializable]
    public class ProductInfo
    {
        public string ID { get; set; }
        public CategoryInfo Category { get; set; }
        public string CategoryId { get; set; }
        public string CategoryName { get; set; }
        public SupplierInfo Supplier { get; set; }
        public string SupplierId { get; set; }
        public string SupplierName { get; set; }
        public ProductImageInfo Image { get; set; }
        public string ProductImageId { get; set; }
        public byte[] ProductImageData { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Unit { get; set; }
        public int InStock { get; set; }
        public int OnOrder { get; set; }
        public decimal Price { get; set; }
        public decimal Cost { get; set; }
        public bool Continued { get; set; }
    }
}
