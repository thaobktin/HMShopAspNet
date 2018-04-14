using System;

namespace HM.Model
{
    [Serializable]
    public class UserInfo
    {
        public string ID { get; set; }
        public string FullName { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string TypeSocial { get; set; }
        //public int UserType_Id { get; set; }
        public string AppID { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        //public string Fax { get; set; }
        //public string AreaCode { get; set; }
    }
}