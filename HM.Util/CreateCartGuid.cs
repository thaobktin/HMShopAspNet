using System;
using System.Web;

namespace HM.Util
{
    public class CreateCartGuid
    {
        public const string CartSessionKey = "CartGuid";

        public static string GetCartGUID()
        {
            if (HttpContext.Current.Request.Cookies["deal"] != null)
            {
                return HttpContext.Current.Request.Cookies["deal"]["CartID"];
            }
            Guid CartGUID = Guid.NewGuid();
            var cookie = new HttpCookie("deal");
            cookie.Values.Add("CartID", CartGUID.ToString());
            cookie.Expires = DateTime.Now.AddHours(1);
            HttpContext.Current.Response.AppendCookie(cookie);
            return CartGUID.ToString();
        }

        public static string GetCartID()
        {
            if (HttpContext.Current.Session[CartSessionKey] != null)
            {
                return HttpContext.Current.Session[CartSessionKey].ToString();
            }

            var tempCartId = Guid.NewGuid();
            HttpContext.Current.Session[CartSessionKey] = tempCartId.ToString();

            //if (!string.IsNullOrWhiteSpace(HttpContext.Current.User.Identity.Name))
            //{
            //    HttpContext.Current.Session[CartSessionKey] = HttpContext.Current.User.Identity.Name;
            //}
            //else
            //{
            //    // Generate a new random GUID using System.Guid class.     
            //    Guid tempCartId = Guid.NewGuid();
            //    HttpContext.Current.Session[CartSessionKey] = tempCartId.ToString();
            //}

            return HttpContext.Current.Session[CartSessionKey].ToString();
        }

        // We're using HttpContextBase to allow access to cookies.
        public static string GetCartId(HttpContextBase context)
        {
            if (context.Session[CartSessionKey] == null)
            {
                if (!string.IsNullOrWhiteSpace(context.User.Identity.Name))
                {
                    context.Session[CartSessionKey] =
                        context.User.Identity.Name;
                }
                else
                {
                    // Generate a new random GUID using System.Guid class
                    Guid tempCartId = Guid.NewGuid();
                    // Send tempCartId back to client as a cookie
                    context.Session[CartSessionKey] = tempCartId.ToString();
                }
            }
            return context.Session[CartSessionKey].ToString();
        }

        public static bool RemoveCartId()
        {
            HttpContext.Current.Session[CartSessionKey] = null;
            HttpContext.Current.Session.Remove(CartSessionKey);

            if (HttpContext.Current.Session[CartSessionKey] != null)
                return false;

            return true;
        }
    }
}
