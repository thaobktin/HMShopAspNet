using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Globalization;

namespace HM.Util
{
    /// <summary>
    /// Class lam viec voi ham convert.
    /// </summary>
    /// <Modified>
    /// Name     Date         Comments
    /// trungtq  6/8/2012   created
    /// </Modified>
    public class FormatHelper
    {
        protected const string formatDoubleString = "#,###,###,##0.###";

        /// <summary>
        /// Culture mac dinh (VietNam)
        /// </summary>
        protected static CultureInfo DefaultCulture
        {
            get
            {
                return new CultureInfo("vi-VN");
            }
        }

        /// <summary>
        /// Convert to double, mac dinh lay 2 so sau dau phay
        /// </summary>
        /// <param name="obj">The obj.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  6/8/2012   created
        /// </Modified>
        public static double ConvertToDouble(object obj)
        {
            return ConvertToDouble(obj, 2);
        }

        /// <summary>
        /// Convert to double.
        /// </summary>
        /// <param name="obj">The obj.</param>
        /// <param name="numAfterComma">So luong ki tu sau dau phay.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  6/8/2012   created
        /// </Modified>
        public static double ConvertToDouble(object obj, int numAfterComma)
        {
            return ConvertToDouble(obj, numAfterComma, new CultureInfo("en-US"));
        }

        /// <summary>
        /// Convert to dobule
        /// </summary>
        /// <param name="obj">The obj.</param>
        /// <param name="numAfterComma">So luong ki tu sau dau phay</param>
        /// <param name="culture">The culture.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  6/8/2012   created
        /// </Modified>
        public static double ConvertToDouble(object obj, int numAfterComma, CultureInfo culture)
        {
            double ret = 0;
            try
            {
                double.TryParse(obj.ToString(), NumberStyles.Float, culture, out ret);

                if (ret > 0)
                {
                    ret = Math.Round(ret, numAfterComma, MidpointRounding.AwayFromZero);
                }
            }
            catch { }
            return ret;
        }

        /// <summary>
        /// Lam tron so
        /// </summary>
        /// <param name="obj">The obj.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  6/8/2012   created
        /// </Modified>
        public static double RoundDouble(double obj)
        {
            return RoundDouble(obj, 3);
        }

        /// <summary>
        /// Lam tron so
        /// </summary>
        /// <param name="obj">The obj.</param>
        /// <param name="number">The number.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  6/8/2012   created
        /// </Modified>
        public static double RoundDouble(double obj, int number)
        {
            double ret = 0;
            try
            {
                ret = Math.Round(Convert.ToDouble(obj), number);
            }
            catch { }
            return ret;
        }

        /// <summary>
        /// Format double: Mac dinh lay 2 so sau dau phay.
        /// </summary>
        /// <param name="obj">The obj.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  6/8/2012   created
        /// </Modified>
        public static string FormatDouble(object obj)
        {
            return FormatDouble(obj, 2);
        }

        /// <summary>
        /// Format double
        /// </summary>
        /// <param name="obj">The obj.</param>
        /// <param name="digits">The digits.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// TRAN QUANG TRUNG  15/03/2013   created
        /// </Modified>
        public static string FormatDouble(object obj, int digits)
        {
            string ret = string.Empty;
            if (obj == null) return ret;
            try
            {
                ret = Math.Round(Convert.ToDouble(obj), digits).ToString(formatDoubleString, DefaultCulture);
            }
            catch { }
            return ret;
        }

        /// <summary>
        /// Format double theo culture
        /// </summary>
        /// <param name="obj">obj</param>
        /// <param name="number">so ki tu can lay sau dau phay</param>
        /// <param name="culture">culture</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  8/6/2012   created
        /// </Modified>
        public static string FormatDouble(object obj, int number, CultureInfo culture)
        {
            string ret = string.Empty;
            if (obj == null) return ret;
            try
            {
                ret = Math.Round(Convert.ToDouble(obj), number, MidpointRounding.AwayFromZero).ToString(formatDoubleString, culture);
            }
            catch { }
            return ret;
        }

        /// <summary>
        /// Dinh dang lai so. Neu nho hon 0 tra ve dau gach ngang.
        /// </summary>
        /// <param name="obj">The obj.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  6/8/2012   created
        /// </Modified>
        public static string FormatDoubleDash(object obj)
        {
            string ret = "-";
            if (obj == null) return ret;
            try
            {
                ret = FormatDoubleDash(obj, 2, DefaultCulture);
            }
            catch
            {
                ret = "-";
            }
            return ret;
        }

        /// <summary>
        /// Dinh dang lai so
        /// </summary>
        /// <param name="obj">The obj.</param>
        /// <param name="numAfterComma">Lay ra so luong ki tu sau dau phay.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  8/6/2012   created
        /// </Modified>
        public static string FormatDoubleDash(object obj, int? numAfterComma, CultureInfo culture)
        {
            string ret = "";
            if (obj == null) return ret;
            try
            {
                if (numAfterComma == null)
                {
                    ret = (Convert.ToDouble(obj) != 0) ? Convert.ToDouble(obj).ToString(formatDoubleString, culture) : "-";
                }
                else
                {
                    ret = (Convert.ToDouble(obj) != 0) ? Math.Round(Convert.ToDouble(obj), numAfterComma.Value).ToString(formatDoubleString, culture) : "-";
                }
            }
            catch
            {
                ret = "-";
            }
            return ret;
        }

        /// <summary>
        /// Dinh dang lai so. Chuyen sang tri tuyet doi
        /// </summary>
        /// <param name="obj">The obj.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  8/6/2012   created
        /// </Modified>
        public static string FormatDoubleAbsolute(object obj)
        {
            return FormatDoubleAbsolute(obj, DefaultCulture);
        }

        /// <summary>
        /// Dinh dang lai so. Chuyen sang tri tuyet doi.
        /// </summary>
        /// <param name="obj">The obj.</param>
        /// <param name="culture">culture</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  6/8/2012   created
        /// </Modified>
        public static string FormatDoubleAbsolute(object obj, CultureInfo culture)
        {
            string ret = string.Empty;
            if (obj == null) return ret;
            try
            {
                double value = Convert.ToDouble(obj);
                if (value > 0)
                {
                    ret = Convert.ToDouble(obj).ToString(formatDoubleString, culture);
                }
                else if (value < 0)
                {
                    ret = Math.Abs(Convert.ToDouble(obj)).ToString(formatDoubleString, culture);

                    ret = "(" + ret + ")";
                }
                else
                {
                    ret = "-";
                }
            }
            catch { }

            return ret;
        }

        /// <summary>
        /// Dinh dang lai so. Neu = 0 or null return N/A.
        /// </summary>
        /// <param name="obj">The obj.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  8/6/2012   created
        /// </Modified>
        public static string FormatDoubleNA(object obj)
        {
            return FormatDoubleNA(obj, DefaultCulture);

        }

        /// <summary>
        /// Dinh dang lai so. Neu = 0 or null return N/A.
        /// </summary>
        /// <param name="obj">The obj.</param>
        /// <param name="culture">The culture.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  6/8/2012   created
        /// </Modified>
        public static string FormatDoubleNA(object obj, CultureInfo culture)
        {
            string ret = "N/A";
            if (obj == null) return ret;
            try
            {
                ret = (Convert.ToDouble(obj) != 0) ? Convert.ToDouble(obj).ToString(formatDoubleString, culture) : "N/A";
            }
            catch
            {
                ret = "N/A";
            }
            return ret;
        }

        /// <summary>
        /// Dinh dang kieu double
        /// Neu ==0 => tra ve khi tu mac dinh la empty (trong)
        /// </summary>
        /// <param name="obj">The obj.</param>
        /// <param name="culture">The culture.</param>
        /// <param name="defaultChar">The default char.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// TRAN QUANG TRUNG  15/3/2013   created
        /// </Modified>
        public static string FormatDoubleEmpty(object obj)
        {
            return FormatDoubleEmpty(obj, 2);
        }

        /// <summary>
        /// Dinh dang kieu double
        /// Neu ==0 => tra ve khi tu mac dinh la empty (trong)
        /// </summary>
        /// <param name="obj">The obj.</param>
        /// <param name="culture">The culture.</param>
        /// <param name="defaultChar">The default char.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// TRAN QUANG TRUNG  15/3/2013   created
        /// </Modified>
        public static string FormatDoubleEmpty(object obj, int digits)
        {
            return FormatDoubleChar(obj, digits, string.Empty);
        }

        /// <summary>
        /// Dinh dang kieu double
        /// Neu ==0 => tra ve khi tu mac dinh la empty (trong)
        /// </summary>
        /// <param name="obj">The obj.</param>
        /// <param name="culture">The culture.</param>
        /// <param name="defaultChar">The default char.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// TRAN QUANG TRUNG  15/3/2013   created
        /// </Modified>
        public static string FormatDoubleChar(object obj, int digits, string defaultChar)
        {
            return FormatDoubleChar(obj, DefaultCulture, digits, defaultChar);
        }

        /// <summary>
        /// Dinh dang kieu double
        /// Neu ==0 => tra ve khi tu mac dinh
        /// </summary>
        /// <param name="obj">The obj.</param>
        /// <param name="culture">The culture.</param>
        /// <param name="defaultChar">The default char.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// TRAN QUANG TRUNG  15/3/2013   created
        /// </Modified>
        public static string FormatDoubleChar(object obj, CultureInfo culture, int digits, string defaultChar)
        {
            string ret = defaultChar;
            if (obj == null) return ret;
            try
            {
                ret = (Convert.ToDouble(obj) != 0) ? Math.Round(Convert.ToDouble(obj), digits, MidpointRounding.AwayFromZero).ToString(formatDoubleString, culture) : defaultChar;
            }
            catch
            {
                ret = defaultChar;
            }
            return ret;
        }
    }
}
