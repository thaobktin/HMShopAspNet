using System;

namespace HM.Model
{
    [Serializable]
    public class SupplierInfo
    {
        public string ID { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string Fax { get; set; }
        public string Website { get; set; }
    }
}
