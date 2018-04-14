using System;
using System.Drawing;
using System.Web;
using HM.Common;
using HM.Util;

namespace HMShop.Qwerty.HttpHandlers
{
    /// <summary>
    /// Summary description for ResizeImage
    /// </summary>
    public class ResizeImage : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            try
            {
                HttpFileCollection files = context.Request.Files;
                HttpPostedFile file = files[0];
                string fname = context.Server.MapPath("~/public/upload/temp/" + StringHelper.RandomString(6) + System.IO.Path.GetExtension(file.FileName));
                file.SaveAs(fname);
                int checkResizeType = Convert.ToInt32(context.Request.Params["type_image"]);
                int width = 0;
                int height = 0;
                string pathNewName = "";
                if (checkResizeType == Constant.RESIZE_IMAGE_QUESTION)
                {
                    width = Constant.MAX_WIDTH_RESIZE;
                    height = Constant.MAX_HEIGHT_RESIZE;
                    pathNewName = "/public/upload/temp/" + StringHelper.RandomString(8) + System.IO.Path.GetExtension(file.FileName);
                }
                else
                {
                    width = Constant.MAX_WIDTH_LOGO_RESIZE;
                    height = Constant.MAX_HEIGHT_LOGO_RESIZE;
                    pathNewName = "/public/upload/" + StringHelper.RandomString(8) + System.IO.Path.GetExtension(file.FileName);
                    context.Response.Write("");
                }
                Image image = Image.FromFile(fname);
                var newImage = StringHelper.ScaleImage(image, width, height);
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

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}