using System;

namespace HM.Model
{
    [Serializable]
    public class MainUserInfo
    {
        public string ID { get; set; }
        public string Email { get; set; }
        public bool EmailConfirmed { get; set; }
        public string FullName { get; set; }
        public string LoginName { get; set; }
        public string Password { get; set; }
        public bool Gender { get; set; }
        public string Birthday { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public bool SuperAdmin { get; set; }
        public string Avatar { get; set; }
    }
}