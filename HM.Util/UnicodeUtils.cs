using System;
using System.Text;


namespace HM.Util
{
    public class UnicodeUtils
    {
        private const string KoDauChars = "aaaaaaaaaaaaaaaaaeeeeeeeeeeediiiiiooooooooooooooooouuuuuuuuuuuyyyyyAAAAAAAAAAAAAAAAAEEEEEEEEEEEDIIIOOOOOOOOOOOOOOOOOOOUUUUUUUUUUUYYYYYAADOOU";
        private const string uniChars = "\x00e0\x00e1ả\x00e3ạ\x00e2ầấẩẫậăằắẳẵặ\x00e8\x00e9ẻẽẹ\x00eaềếểễệđ\x00ec\x00edỉĩị\x00f2\x00f3ỏ\x00f5ọ\x00f4ồốổỗộơờớởỡợ\x00f9\x00faủũụưừứửữựỳ\x00fdỷỹỵ\x00c0\x00c1Ả\x00c3Ạ\x00c2ẦẤẨẪẬĂẰẮẲẴẶ\x00c8\x00c9ẺẼẸ\x00caỀẾỂỄỆĐ\x00cc\x00cdỈĨỊ\x00d2\x00d3Ỏ\x00d5Ọ\x00d4ỒỐỔỖỘƠỜỚỞỠỢ\x00d9\x00daỦŨỤƯỪỨỬỮỰỲ\x00ddỶỸỴ\x00c2ĂĐ\x00d4ƠƯ";

        public static string ISO8859ToUnicode(string src)
        {
            Encoding encoding = Encoding.GetEncoding("iso8859-1");
            Encoding encoding2 = Encoding.UTF8;
            byte[] bytes = encoding.GetBytes(src);
            return encoding2.GetString(bytes);
        }

        public static string UnicodeToISO8859(string src)
        {
            Encoding encoding = Encoding.GetEncoding("iso8859-1");
            byte[] bytes = Encoding.UTF8.GetBytes(src);
            return encoding.GetString(bytes);
        }

        public static string UnicodeToNoPunctuation(string s)
        {
            string str = string.Empty;
            if (s != null)
            {
                for (int i = 0; i < s.Length; i++)
                {
                    char ch = s[i];
                    int index = "\x00e0\x00e1ả\x00e3ạ\x00e2ầấẩẫậăằắẳẵặ\x00e8\x00e9ẻẽẹ\x00eaềếểễệđ\x00ec\x00edỉĩị\x00f2\x00f3ỏ\x00f5ọ\x00f4ồốổỗộơờớởỡợ\x00f9\x00faủũụưừứửữựỳ\x00fdỷỹỵ\x00c0\x00c1Ả\x00c3Ạ\x00c2ẦẤẨẪẬĂẰẮẲẴẶ\x00c8\x00c9ẺẼẸ\x00caỀẾỂỄỆĐ\x00cc\x00cdỈĨỊ\x00d2\x00d3Ỏ\x00d5Ọ\x00d4ỒỐỔỖỘƠỜỚỞỠỢ\x00d9\x00daỦŨỤƯỪỨỬỮỰỲ\x00ddỶỸỴ\x00c2ĂĐ\x00d4ƠƯ".IndexOf(ch.ToString());
                    if (index >= 0)
                    {
                        str = str + "aaaaaaaaaaaaaaaaaeeeeeeeeeeediiiiiooooooooooooooooouuuuuuuuuuuyyyyyAAAAAAAAAAAAAAAAAEEEEEEEEEEEDIIIOOOOOOOOOOOOOOOOOOOUUUUUUUUUUUYYYYYAADOOU"[index];
                    }
                    else
                    {
                        str = str + s[i];
                    }
                }
            }
            return str;
        }

        public static int UnicodeToUTF8(byte[] dest, int maxDestBytes, string source, int sourceChars)
        {
            int num3;
            int num4 = 0;
            if ((source != null) && (source.Length == 0))
            {
                return num4;
            }
            int index = 0;
            int num = 0;
            if (dest == null)
            {
                while (num < sourceChars)
                {
                    num3 = source[num++];
                    if (num3 > 0x7f)
                    {
                        if (num3 > 0x7ff)
                        {
                            index++;
                        }
                        index++;
                    }
                    index++;
                }
            }
            else
            {
                while ((num < sourceChars) && (index < maxDestBytes))
                {
                    num3 = source[num++];
                    if (num3 <= 0x7f)
                    {
                        dest[index++] = (byte) num3;
                    }
                    else
                    {
                        if (num3 > 0x7ff)
                        {
                            if ((index + 3) > maxDestBytes)
                            {
                                break;
                            }
                            dest[index++] = (byte) (0xe0 | (num3 >> 12));
                            dest[index++] = (byte) (0x80 | ((num3 >> 6) & 0x3f));
                            dest[index++] = (byte) (0x80 | (num3 & 0x3f));
                            continue;
                        }
                        if ((index + 2) > maxDestBytes)
                        {
                            break;
                        }
                        dest[index++] = (byte) (0xc0 | (num3 >> 6));
                        dest[index++] = (byte) (0x80 | (num3 & 0x3f));
                    }
                }
                if (index >= maxDestBytes)
                {
                    index = maxDestBytes - 1;
                }
                dest[index] = 0;
            }
            return (index + 1);
        }

        public static string UnicodeToWindows1252(string s)
        {
            string str = string.Empty;
            for (int i = 0; i < s.Length; i++)
            {
                int num2 = s[i];
                if (num2 > 0xbf)
                {
                    str = str + "&#" + num2.ToString() + ";";
                }
                else
                {
                    str = str + s[i];
                }
            }
            return str;
        }

        public static string UTF8Decode(byte[] s)
        {
            string str = string.Empty;
            if (s != null)
            {
                char[] dest = new char[s.Length + 1];
                int num = UTF8ToUnicode(dest, dest.Length, s, s.Length);
                if (num > 0)
                {
                    str = "";
                    for (int j = 0; j < (num - 1); j++)
                    {
                        str = str + dest[j];
                    }
                    return str;
                }
                str = "";
                for (int i = 0; i < s.Length; i++)
                {
                    str = str + ((char) s[i]);
                }
            }
            return str;
        }

        public static byte[] UTF8Encode(string ws)
        {
            byte[] destinationArray = null;
            if ((ws == null) || (ws.Length != 0))
            {
                byte[] dest = new byte[ws.Length * 3];
                int num = UnicodeToUTF8(dest, dest.Length + 1, ws, ws.Length);
                if (num > 0)
                {
                    destinationArray = new byte[num - 1];
                    Array.Copy(dest, 0, destinationArray, 0, num - 1);
                }
                else
                {
                    destinationArray = new byte[ws.Length];
                    for (int i = 0; i < destinationArray.Length; i++)
                    {
                        destinationArray[i] = (byte) ws[i];
                    }
                }
            }
            return destinationArray;
        }

        public static int UTF8ToUnicode(char[] dest, int maxDestChars, byte[] source, int sourceBytes)
        {
            int num3;
            if (source == null)
            {
                return 0;
            }
            int num4 = -1;
            int index = 0;
            int num = 0;
            if (dest != null)
            {
                while ((num < sourceBytes) && (index < maxDestChars))
                {
                    int num5 = source[num++];
                    if ((num5 & 0x80) != 0)
                    {
                        if (num >= sourceBytes)
                        {
                            return num4;
                        }
                        num5 &= 0x3f;
                        if ((num5 & 0x20) != 0)
                        {
                            num3 = source[num++];
                            if ((num3 & 0xc0) != 0x80)
                            {
                                return num4;
                            }
                            if (num >= sourceBytes)
                            {
                                return num4;
                            }
                            num5 = (num5 << 6) | (num3 & 0x3f);
                        }
                        num3 = source[num++];
                        if ((num3 & 0xc0) != 0x80)
                        {
                            return num4;
                        }
                        dest[index] = (char) ((num5 << 6) | (num3 & 0x3f));
                    }
                    else
                    {
                        dest[index] = (char) num5;
                    }
                    index++;
                }
                if (index > maxDestChars)
                {
                    index = maxDestChars - 1;
                }
                dest[index] = '\0';
            }
            else
            {
                while (num < sourceBytes)
                {
                    num3 = source[num++];
                    if ((num3 & 0x80) != 0)
                    {
                        if (num >= sourceBytes)
                        {
                            return num4;
                        }
                        num3 &= 0x3f;
                        if ((num3 & 0x20) != 0)
                        {
                            num3 = source[num++];
                            if ((num3 & 0xc0) != 0x80)
                            {
                                return num4;
                            }
                            if (num >= sourceBytes)
                            {
                                return num4;
                            }
                        }
                        num3 = source[num++];
                        if ((num3 & 0xc0) != 0x80)
                        {
                            return num4;
                        }
                    }
                    index++;
                }
            }
            return (index + 1);
        }
    }
}

