using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HM.Util
{
    /// <summary>
    /// Extension method for Enum
    /// </summary>
    /// <Modified>
    /// Name     Date         Comments
    /// TRAN QUANG TRUNG  1/4/2013   created
    /// </Modified>
    public static class EnumExtensions
    {
        /// <summary>
        /// Will get the enum value as an integer saving a cast (int).
        /// </summary>
        /// <param name="value">
        /// </param>
        /// <returns>
        /// The to int.
        /// </returns>
        public static int ToInt(this Enum value)
        {
            return Convert.ToInt32(value);
        }

        /// <summary>
        /// Will get the enum value as an short saving a cast (short)<=>(Int16).
        /// </summary>
        /// <param name="value">
        /// </param>
        /// <returns>
        /// The to short (Int16).
        /// </returns>
        public static short ToShort(this Enum value)
        {
            return Convert.ToInt16(value);
        }

        /// <summary>
        /// Will get the enum value as an Byte saving a cast (byte).
        /// </summary>
        /// <param name="value">
        /// </param>
        /// <returns>
        /// The to byte.
        /// </returns>
        public static byte ToByte(this Enum value)
        {
            return Convert.ToByte(value);
        }

        /// <summary>
        /// Will get the enum value as an char saving a cast (char).
        /// </summary>
        /// <param name="value">
        /// </param>
        /// <returns>
        /// The to char.
        /// </returns>
        public static char ToChar(this Enum value)
        {
            return Convert.ToChar(value);
        }

        /// <summary>
        /// Lay ra gia tri tu thang enum
        /// http://codereview.stackexchange.com/questions/5352/getting-the-value-of-a-custom-attribute-from-an-enum
        /// </summary>
        /// <typeparam name="TAttribute"></typeparam>
        /// <param name="value"></param>
        /// <returns></returns>
        public static TAttribute GetAttribute<TAttribute>(this Enum value) where TAttribute : Attribute
        {
            var type = value.GetType();
            var name = Enum.GetName(type, value);

            return type.GetField(name)
                    .GetCustomAttributes(false)
                    .OfType<TAttribute>()
                    .SingleOrDefault();
        }
    }
}
