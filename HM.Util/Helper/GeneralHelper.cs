﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Globalization;
using System.Drawing;
using System.Text.RegularExpressions;
using System.Runtime.Serialization.Formatters.Binary;
using System.Runtime.Serialization;
using System.IO;

namespace HM.Util
{
    /// <summary>
    /// Class contain common utility
    /// </summary>
    /// <Modified>
    /// Name     Date         Comments
    /// trungtq  2/20/2012   created
    /// </Modified>
    public class GeneralHelper
    {
        /// <summary>
        /// Gets the safe raw URL.
        /// </summary>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  2/20/2012   created
        /// </Modified>
        public static string GetSafeRawUrl()
        {
            return GetSafeRawUrl(HttpContext.Current.Request.RawUrl);
        }

        /// <summary>
        /// Cleans up a URL so that it doesn't contain any problem characters.
        /// </summary>
        /// <param name="url">The URL.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  2/20/2012   created
        /// </Modified>
        public static string GetSafeRawUrl(string url)
        {
            string tProcessedRaw = url;
            tProcessedRaw = tProcessedRaw.Replace("\"", string.Empty);
            tProcessedRaw = tProcessedRaw.Replace("<", "%3C");
            tProcessedRaw = tProcessedRaw.Replace(">", "%3E");
            tProcessedRaw = tProcessedRaw.Replace("&", "%26");
            return tProcessedRaw.Replace("'", string.Empty);
        }

        /// <summary>
        /// Convert the hexa to int.
        /// </summary>
        /// <param name="value">The value.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  11/5/2012   created
        /// </Modified>
        public static int ConvertHexToInt(string value)
        {
            int ret = 0;
            try
            {
                // strip the leading 0x
                if (value.StartsWith("0x", StringComparison.OrdinalIgnoreCase))
                {
                    value = value.Substring(2);
                }
                if (value.StartsWith("#", StringComparison.OrdinalIgnoreCase))
                {
                    value = value.Substring(1);
                }

                ret = Int32.Parse(value, NumberStyles.HexNumber);
            }
            catch { }
            return ret;
        }

        /// <summary>
        /// Convert the int to hexa.
        /// </summary>
        /// <param name="value">The value.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  11/5/2012   created
        /// </Modified>
        public static string ConvertIntToHex(int value)
        {
            return value.ToString("X").PadLeft(6, '0');
        }

        /// <summary>
        /// Converts the color of from HTML.
        /// </summary>
        /// <param name="htmlColor">Color of the HTML (#000000, #666666)</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  14/5/2012   created
        /// </Modified>
        public static Color ConvertFromHtmlColor(string htmlColor)
        {
            return ColorTranslator.FromHtml(htmlColor);
        }

        /// <summary>
        /// Convert the HTML from Color
        /// </summary>
        /// <param name="color">The color.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  14/5/2012   created
        /// </Modified>
        public static string ConvertToHtmlColor(Color color)
        {
            return ColorTranslator.ToHtml(color);
        }

        /// <summary>
        /// Convert String -> Double.
        /// </summary>
        /// <param name="input">The input.</param>
        /// <param name="culture">The culture.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  6/6/2012   created
        /// </Modified>
        public static double ConvertToDouble(string input, CultureInfo culture)
        {
            double ret = 0;
            double.TryParse(input, NumberStyles.Float, culture, out ret);
            return ret;
        }

        /// <summary>
        /// Convert String -> Double.
        /// </summary>
        /// <param name="input">The input.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  6/6/2012   created
        /// </Modified>
        public static double ConvertToDouble(string input)
        {
            return ConvertToDouble(input, new CultureInfo("en-US"));
        }

        /// <summary>
        /// Tinh khoang cach giua 2 diem tren ban do
        /// </summary>
        /// <param name="lng1">Kinh do 1</param>
        /// <param name="lat1">Vi do 1</param>
        /// <param name="lng2">Kinh do 2</param>
        /// <param name="lat2">Vi do 2</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// tuyenvt  15/06/2012   created
        /// </Modified>
        public static double Canculator_dis(double lng1, double lat1, double lng2, double lat2)
        {
            if (lng1 == lng2 && lat1 == lat2)
            {
                return 0;
            }

            double p1x = lng1 * (Math.PI / 180);
            double p1y = lat1 * (Math.PI / 180);
            double p2x = lng2 * (Math.PI / 180);
            double p2y = lat2 * (Math.PI / 180);
            double kc = 0;
            double temp = 0;
            kc = p2x - p1x;
            temp = Math.Cos(kc);
            temp = temp * Math.Cos(p2y);
            temp = temp * Math.Cos(p1y);
            kc = Math.Sin(p1y);
            kc = kc * Math.Sin(p2y);
            temp = temp + kc;
            kc = Math.Acos(temp);
            kc = kc * 6378137;
            return kc;
        }


        /// <summary>
        /// Tinh khoang cach giua 2 toa do
        /// Ham nay doi ten tu ham tren theo dung convention
        /// </summary>
        /// <param name="lng1">The LNG1.</param>
        /// <param name="lat1">The lat1.</param>
        /// <param name="lng2">The LNG2.</param>
        /// <param name="lat2">The lat2.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// TRAN QUANG TRUNG  4/3/2013   created
        /// </Modified>
        public static double CalculateDistance(double longitude1, double latitude1, double longitude2, double latitude2)
        {
            if (longitude1 == longitude2 && latitude1 == latitude2)
            {
                return 0;
            }

            double kc, t;
            double p1x = longitude1 * (Math.PI) / 180;
            double p1y = latitude1 * (Math.PI) / 180;
            double p2x = longitude2 * (Math.PI) / 180;
            double p2y = latitude2 * (Math.PI) / 180;

            kc = p2x - p1x;
            kc = Math.Abs(kc);
            t = Math.Cos(kc);
            t = t * Math.Cos(p2y);
            t = t * Math.Cos(p1y);
            kc = Math.Sin(p1y);
            kc = kc * Math.Sin(p2y);
            t = t + kc;
            kc = Math.Acos(t);
            kc = kc * 6378137;

            return (int)kc;
        }

        /// <summary>
        /// Chuyen 1 ki tu co dau -> ko dau.
        /// </summary>
        /// <param name="x">The x.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  23/6/2012   created
        /// </Modified>
        private static char ConvertedVNChar(char x)
        {
            if ((x >= 'a' && x <= 'z') || (x >= '0' && x <= '9') || (x >= 'A' && x <= 'Z'))
            {
                return x;
            }
            String s = x.ToString();

            if ("àáạảãâầấậẩẫăắằặẳẵ".Contains(s)) return 'a';
            if ("èéẹẻẽêềếệểễ".Contains(s)) return 'e';
            if ("ìíịỉĩ".Contains(s)) return 'i';
            if ("đ".Contains(s)) return 'd';
            if ("òóọỏõôồốộổỗơờớợởỡ".Contains(s)) return 'o';
            if ("ùúụủũưừứựửữ".Contains(s)) return 'u';
            if ("ỳýỵỷỹ".Contains(s)) return 'y';
            if ("ÀÁẠẢÃÂẦẤẬẨẪĂẮẰẶẲẴ".Contains(s)) return 'A';
            if ("ÈÉẸẺẼÊỀẾỆỂỄ".Contains(s)) return 'E';
            if ("ÌÍỊỈĨ".Contains(s)) return 'I';
            if ("Đ".Contains(s)) return 'D';
            if ("ÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠ".Contains(s)) return 'O';
            if ("ÙÚỤỦŨƯỪỨỰỬỮ".Contains(s)) return 'U';
            if ("ỲÝỴỶỸ".Contains(s)) return 'Y';
            if (x == '\t' || x == ' ') return '-';
            if (@"_&*?(){}[]\|/+:'"";,.-".Contains(s)) return '-';

            return '@';
        }

        /// <summary>
        /// Chuyen 1 chuoi tieng viet co dau thanh khong dau va co gach ngang.
        /// </summary>
        /// <param name="input">The input.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  23/6/2012   created
        /// </Modified>
        public static string ConvertToDashesVn(string input)
        {
            StringBuilder sb = new StringBuilder();
            char[] ca = input.Trim().ToCharArray();
            for (int i = 0; i < ca.Length; ++i)
            {
                char x = ConvertedVNChar(ca[i]);
                if (x != '@')
                    sb.Append(x);
            }

            return Regex.Replace(sb.ToString(), @"-+", "-").Trim('-').ToLower();

        }

        /// <summary>
        /// Chuyen 1 chuoi tieng viet co dau thanh khong dau va co gach chan.
        /// </summary>
        /// <param name="input">The input.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  23/6/2012   created
        /// </Modified>
        public static string ConvertToUnderlinedVn(string input)
        {
            StringBuilder sb = new StringBuilder();
            char[] ca = input.Trim().ToCharArray();
            for (int i = 0; i < ca.Length; ++i)
            {
                char x = ConvertedVNChar(ca[i]);
                if (x != '@')
                    sb.Append(x);
            }

            return Regex.Replace(sb.ToString(), @"-+", "_").Trim('_').ToLower();

        }


        /// <summary>
        /// Chuyen 1 chuoi tieng viet co dau thanh khong dau.
        /// </summary>
        /// <param name="input">The input.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  7/9/2012   created
        /// </Modified>
        public static string ConvertToVN(string input)
        {
            StringBuilder sb = new StringBuilder();
            char[] ca = input.Trim().ToCharArray();
            for (int i = 0; i < ca.Length; ++i)
            {
                char x = ConvertedVNChar(ca[i]);
                if (x != '@')
                    sb.Append(x);
            }

            return Regex.Replace(sb.ToString(), @"-+", " ").Trim(' ').ToLower();
        }


        /// <summary>
        /// Perform a deep Copy of the object.
        /// </summary>
        /// <typeparam name="T">The type of object being copied.</typeparam>
        /// <param name="source">The object instance to copy.</param>
        /// <returns>The copied object.</returns>
        /// <Modified>
        /// Name     Date         Comments
        /// tuyenvt  02/08/2012   created
        /// </Modified>
        public static T Clone<T>(T source)
        {
            if (!typeof(T).IsSerializable)
            {
                throw new ArgumentException("The type must be serializable.", "source");
            }
            // Don't serialize a null object, simply return the default for that object
            if (Object.ReferenceEquals(source, null))
            {
                return default(T);
            }
            IFormatter formatter = new BinaryFormatter();
            Stream stream = new MemoryStream();
            using (stream)
            {
                formatter.Serialize(stream, source);
                stream.Seek(0, SeekOrigin.Begin);
                return (T)formatter.Deserialize(stream);
            }
        }
    }
}
