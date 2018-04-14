using System;
using System.Text;
using System.Security.Cryptography;


namespace HM.Util
{
    public class SecurityUtil
    {
        public static string MD5Encrypt(string plainText)
        {
            UTF8Encoding encoding = new UTF8Encoding();
            MD5CryptoServiceProvider provider = new MD5CryptoServiceProvider();
            byte[] bytes = encoding.GetBytes(plainText);
            return BitConverter.ToString(provider.ComputeHash(bytes)).Replace("-", "").ToLower();
        }

        public static string RandomPassword()
        {
            string str = string.Empty;
            Random random = new Random(DateTime.Now.Millisecond);
            for (int i = 1; i < 10; i++)
            {
                str = str + random.Next(0, 9);
            }
            return str;
        }

        public static string RandomString(int length)
        {
            string str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            int maxValue = str.Length;
            Random random = new Random();
            string str2 = string.Empty;
            for (int i = 0; i < length; i++)
            {
                str2 = str2 + str[random.Next(maxValue)];
            }
            return str2;
        }
    }
}

