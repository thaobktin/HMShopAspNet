using System;
using HM.Services;
using HM.Util;

namespace HM.Cache
{
    public class CommonCache
    {
        public static string GetValue(string name)
        {
            object cache = DataCaching.GetCache(name);
            if (cache != null)
            {
                return (string)cache;
            }
            var mainSettingService = new MainSettingService();
            string data = mainSettingService.GetValue(name);
            DataCaching.InsertCacheNoExpireTime(name, data);
            return data;
        }
        
        public static double DefaultCacheExpire
        {
            get
            {
                return Convert.ToDouble(GetValue("Main.DefaultCacheExpire"));
            }
            set
            {
                var mainSettingService = new MainSettingService();
                mainSettingService.SetValue("Main.DefaultCacheExpire", value.ToString());
                DataCaching.RemoveCache("Main.DefaultCacheExpire");
            }
        }

        public static string MailServer
        {
            get
            {
                return GetValue("Main.MailServer");
            }
            set
            {
                var mainSettingService = new MainSettingService();
                mainSettingService.SetValue("Main.MailServer", value);
                DataCaching.RemoveCache("Main.MailServer");
            }
        }

        public static string MetaSearch
        {
            get
            {
                return GetValue("Main.MetaSearch");
            }
            set
            {
                var mainSettingService = new MainSettingService();
                mainSettingService.SetValue("Main.MetaSearch", value);
                DataCaching.RemoveCache("Main.MetaSearch");
            }
        }

        public static string WebTitle
        {
            get
            {
                return GetValue("Main.WebTitle");
            }
            set
            {
                var mainSettingService = new MainSettingService();
                mainSettingService.SetValue("Main.WebTitle", value);
                DataCaching.RemoveCache("Main.WebTitle");
            }
        }
    }
}