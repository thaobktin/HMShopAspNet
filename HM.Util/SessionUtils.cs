using System.Web;


namespace HM.Util
{
    public class SessionUtils
    {
        public static string GetValue(string Name)
        {
            HttpContext current = HttpContext.Current;
            if (current.Session[Name] != null)
            {
                return current.Session[Name].ToString();
            }
            return string.Empty;
        }

        public static void Remove(string Name)
        {
            HttpContext.Current.Session.Remove(Name);
        }

        public static void SetValue(string Name, string Value)
        {
            HttpContext current = HttpContext.Current;
            if (current.Session[Name] == null)
            {
                current.Session.Add(Name, Value);
            }
            else
            {
                current.Session[Name] = Value;
            }
        }
    }
}

