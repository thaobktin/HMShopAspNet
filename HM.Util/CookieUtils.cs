using System;
using System.Web;


namespace HM.Util
{
    public class CookieUtils
    {
        public static string GetCookie(string Name)
        {
            HttpContext current = HttpContext.Current;
            if (current.Request.Cookies[Name] != null)
            {
                return current.Request.Cookies[Name].Value;
            }
            return null;
        }

        public static void SetCookie(string Name, string Value, int dayExpires)
        {
            HttpCookie cookie;
            HttpContext current = HttpContext.Current;
            if (current.Request.Cookies[Name] == null)
            {
                cookie = new HttpCookie(Name);
            }
            else
            {
                cookie = current.Request.Cookies[Name];
            }
            current.Response.Cookies[Name].Value = Value;
            current.Response.Cookies[Name].Expires = DateTime.Now.AddDays((double) dayExpires);
        }

        public static void SetCookieNoExpire(string Name, string Value)
        {
            SetCookie(Name, Value, 360);
        }
    }
}

