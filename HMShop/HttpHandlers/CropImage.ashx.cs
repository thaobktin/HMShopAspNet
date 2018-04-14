using System;
using System.Drawing;
using System.Web;
using HM.Util;

namespace HMShop.Qwerty.HttpHandlers
{
    public class CropImage : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            try
            {
                int x = Convert.ToInt32(context.Request.Params["x"]);
                int y = Convert.ToInt32(context.Request.Params["y"]);
                int w = Convert.ToInt32(context.Request.Params["w"]);
                int h = Convert.ToInt32(context.Request.Params["h"]);
                string imagePath = "~" + context.Request.Params["image"];
                Image image = Image.FromFile(context.Server.MapPath(imagePath));
                Image newImage = this.CropBitmap((Bitmap)image, x, y, w, h);
                string pathNewName = "/public/upload/" + StringHelper.RandomString(8) + System.IO.Path.GetExtension(imagePath);
                newImage.Save(context.Server.MapPath("~" + pathNewName));
                context.Response.ContentType = "text/plain";
                context.Response.Write(pathNewName);
            }
            catch (Exception ex)
            {
                context.Response.ContentType = "text/plain";
                context.Response.Write(ex.Message);
            }
        }

        public Bitmap CropBitmap(Bitmap bitmap, int cropX, int cropY, int cropWidth, int cropHeight)
        {
            Rectangle rect = new Rectangle(cropX, cropY, cropWidth, cropHeight);
            Bitmap cropped = bitmap.Clone(rect, bitmap.PixelFormat);
            return cropped;
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