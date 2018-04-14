using System;

namespace HM.Model
{
    [Serializable]
    public class MainCmdInfo
    {
        public string ID { get; set; }
        public int Index { get; set; }
        public string Name { get; set; }
        public bool Enable { get; set; }
        public string ParentID { get; set; }
        public string Path { get; set; }
        public string Url { get; set; }
        public string Value { get; set; }
        public bool Visible { get; set; }
    }
}

