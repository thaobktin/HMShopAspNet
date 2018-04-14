using System;
using System.Web;
using HM.Services;
using HM.Model;

namespace HMShop.Qwerty.HttpHandlers
{
    /// <summary>
    /// Summary description for DisplayImage
    /// </summary>
    public class DisplayImage : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            try
            {
                var product = new ProductInfo
                {
                    Image = new ProductImageInfo
                    {
                        ID = context.Request.QueryString["ProductImageID"]
                    }
                };
                var productService = new ProductService();
                var imgProd = productService.ReadImage(product.Image.ID);
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