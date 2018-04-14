using System;
using System.Web;
using HM.Services;
using HM.Model;

namespace HMShop.Qwerty.HttpHandlers
{
    /// <summary>
    /// Summary description for DisplayProductImage
    /// </summary>
    public class DisplayProductImage : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            try
            {
                var productService = new ProductService();
                var imgProd = productService.ReadImage(context.Request.QueryString["ProductImageID"]);
                context.Response.BinaryWrite(imgProd.Data);
            }
            catch (Exception ex)
            {
                context.Response.ContentType = "text/plain";
                context.Response.Write(ex.Message);
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}