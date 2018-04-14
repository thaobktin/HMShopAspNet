using System;
using System.Net;
using System.IO;
using System.Drawing;


namespace HM.Util
{
    public static class ImageUtils
    {
        public static ImageMetadata getImageSizeByUrl(string url)
        {
            ImageMetadata ImageMeta = new ImageMetadata();
            ImageMeta.Src = url;

            WebResponse response = null;
            Stream remoteStream = null;
            try
            {
                WebRequest request = WebRequest.Create(url);
                if (request != null)
                {
                    response = request.GetResponse();
                    if (response != null)
                    {
                        // chi lay anh jpeg
                        //if (response.Headers["Content-Type"].Contains("image/jpeg"))
                        {
                            ImageMeta.IsImage = true;
                            remoteStream = response.GetResponseStream();
                            System.Drawing.Image img = System.Drawing.Image.FromStream(remoteStream);

                            if (img != null)
                            {
                                ImageMeta.Width = (int)img.PhysicalDimension.Width;
                                ImageMeta.Height = (int)img.PhysicalDimension.Height;
                            }
                            else
                                ImageMeta.IsImage = false;
                        }
                       
                    }
                }
            }
            catch
            {
                ImageMeta.Width = -1;
                ImageMeta.Height = -1;
                ImageMeta.IsImage = false;
                if (response != null) response.Close();
                if (remoteStream != null) remoteStream.Close();
            }
            finally
            {
                if (response != null) response.Close();
                if (remoteStream != null) remoteStream.Close();
            }

            return ImageMeta;

        }

        public static byte[] ImageToStream(string fileName)
        {
            var stream = new MemoryStream();

            tryagain:
            try
            {
                using (Bitmap image = new Bitmap(fileName))
                {
                    image.Save(stream, System.Drawing.Imaging.ImageFormat.Jpeg);
                }
            }
            catch (Exception)
            {
                goto tryagain;
            }

            return stream.ToArray();
        }
    }

    public class ImageMetadata
    {
        public int Width, Height;
        public bool IsImage;
        public string Src;
        public string Alt;
        public ImageMetadata()
        {
            Width = 0;
            Height = 0;
            IsImage = false;
            Src = string.Empty;
            Alt = string.Empty;
        }
    }
}