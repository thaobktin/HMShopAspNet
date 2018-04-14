using System;

namespace HM.Model
{
    [Serializable]
    public class ProductImageInfo
    {
        public string ID { get; set; }
        public byte[] Data { get; set; }
    }
}
