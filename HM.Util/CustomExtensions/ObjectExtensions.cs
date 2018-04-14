using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;
using System.ComponentModel;

namespace HM.Util
{
    /// <summary>
    /// Class cung cấp các hàm mở rộng cho object
    /// </summary>
    /// <Modified>
    /// Name     Date         Comments
    /// trungtq  23/7/2013   created
    /// </Modified>
    public static class ObjectExtensions
    {
        /// <summary>
        /// Reset giá trị măc định khi dùng DefaultValue
        /// http://www.codeproject.com/Tips/243470/Csharp-Automatic-Property-Default-Value-Extension
        /// </summary>
        /// <param name="obj"></param>
        /// <param name="initInheritedProperties"></param>
        /// <returns></returns>
        public static int ResetPropsUsingDefaultAttributes(this object obj, bool initInheritedProperties)
        {
            int count = 0;
            Type oType = obj.GetType();
            PropertyInfo[] infos = oType.GetProperties(BindingFlags.NonPublic | BindingFlags.Public | BindingFlags.Instance);
            foreach (PropertyInfo inf in infos)
            {
                if (initInheritedProperties || inf.DeclaringType.Equals(oType))
                {
                    object[] oDefAtts = inf.GetCustomAttributes(typeof(DefaultValueAttribute), initInheritedProperties);
                    if (oDefAtts.Length > 0)
                    {
                        DefaultValueAttribute defAtt = oDefAtts[oDefAtts.Length - 1] as DefaultValueAttribute;
                        if (defAtt != null && defAtt.Value != null && !defAtt.Value.Equals(inf.GetValue(obj, BindingFlags.GetProperty, null, null, null)))
                        {
                            inf.SetValue(obj, defAtt.Value, BindingFlags.SetProperty, null, null, null);
                            count++;
                        }
                    }
                }
            }
            return count;
        }
    }
}
