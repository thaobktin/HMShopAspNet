using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HM.Common
{
    public class ConfigManager
    {
        public static string ConnectionString => ConfigurationManager.ConnectionStrings["HMShopDB"].ConnectionString;
    }
}
