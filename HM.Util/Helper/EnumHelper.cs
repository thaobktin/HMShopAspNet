using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;

namespace HM.Util
{
    /// <summary>
    /// All references to Enum should go this class
    /// </summary>
    /// <Modified>
    /// Name     Date         Comments
    /// trungtq  4/2/2012   created
    /// </Modified>
    public class EnumHelper
    {
        /// <summary>
        /// Check a string is a Enum.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="s">The s.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  2/20/2012   created
        /// </Modified>
        public static T EnumParse<T>(string s)
        {
            if (!typeof(T).IsEnum)
            {
                throw new NotSupportedException("T must a enum");
            }
            return (T)Enum.Parse(typeof(T), s);
        }

        /// <summary>
        /// Check a number is a value in enum?
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="number">The number.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  2/20/2012   created
        /// </Modified>
        public static T EnumParse<T>(object number)
        {
            T ret = default(T);
            try
            {
                ret = (T)Enum.ToObject(typeof(T), number);
            }
            catch { }

            return ret;
        }

        /// <summary>
        /// Adds the flags.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="flags">The flags.</param>
        /// <param name="value">The value.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  2/5/2012      created
        /// </Modified>
        public static T AddFlags<T>(object flags, object value)
        {
            T ret = default(T);
            if (flags.GetType().IsValueType || flags.GetType().IsEnum || value.GetType().IsValueType || value.GetType().IsEnum)
            {
                ret = (T)(object)(Convert.ToInt32(flags) | Convert.ToInt32(value));

            }
            return ret;
        }

        /// <summary>
        /// Subs the flags.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="flags">The flags.</param>
        /// <param name="value">The value.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  2/5/2012   created
        /// </Modified>
        public static T SubFlags<T>(object flags, object value)
        {
            T ret = default(T);
            if (flags.GetType().IsValueType || flags.GetType().IsEnum || value.GetType().IsValueType || value.GetType().IsEnum)
            {
                ret = (T)(object)((Convert.ToInt32(flags) | Convert.ToInt32(value)) ^ Convert.ToInt32(value));

            }
            return ret;
        }

        /// </Modified>
        /// <summary>
        /// Get attribute value of specify enum.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="entity">Enum.</param>
        /// <param name="type">Attribute class name of enum.</param>
        /// <param name="property">Attribute name to retrieve the value.</param>
        /// Name     Date         Comments
        /// quochv  22/02/2013   created
        /// <returns></returns>
        public static object GetAttributeValue<T>(object entity, Type type, string property)
        {
            object ret = null;

            MemberInfo memInfo = typeof(T).GetField(Enum.GetName(typeof(T), entity));
            var attributes = memInfo.GetCustomAttributes(type,
                false);
            PropertyInfo pro = type.GetProperty(property);
            ret = pro.GetValue(attributes[0], null);

            return ret;
        }

        /// <summary>
        /// Lay ra attribute tu Enum
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="enumVal">The enum val.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// TRAN QUANG TRUNG  1/4/2013   created
        /// </Modified>
        public static T GetAttribute<T>(Enum enumVal) where T : System.Attribute
        {
            T attribute;

            MemberInfo memberInfo = enumVal.GetType().GetMember(enumVal.ToString()).FirstOrDefault();

            if (memberInfo != null)
            {
                attribute = (T)memberInfo.GetCustomAttributes(typeof(T), false).FirstOrDefault();
            }

            return null;
        }
    }
}
