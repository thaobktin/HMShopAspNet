using System;

namespace HM.Model
{
    [Serializable]
    public class UserRoleInfo
    {
        public string ID { get; set; }
        public string UserID { get; set; }
        public string RoleID { get; set; }
    }
}
