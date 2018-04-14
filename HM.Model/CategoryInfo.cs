using System;

namespace HM.Model
{
    [Serializable]
    public class CategoryInfo
    {
        public string ID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Picture { get; set; }
        public bool Enable { get; set; }
    }
}
