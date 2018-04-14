using System;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;



namespace HM.Util
{
    public class MultiMediaUtils
    {
        public static bool SetAvatarThumbnail(string filePath, int iThumbWidth, int iThumbHeight)
        {
            FileInfo info = new FileInfo(filePath);
            if (!info.Exists)
            {
                return false;
            }
            return SetThumbnail(filePath, info.Directory + @"\Avatar\", iThumbWidth, iThumbHeight);
        }

        public static bool SetThumbnail(string filePath, string newPath, int iThumbWidth, int iThumbHeight)
        {
            FileInfo info = new FileInfo(filePath);
            if (!info.Exists)
            {
                return false;
            }
            try
            {
                if (!Directory.Exists(newPath))
                {
                    Directory.CreateDirectory(newPath);
                }
                Image.GetThumbnailImageAbort callback = new Image.GetThumbnailImageAbort(MultiMediaUtils.ThumbnailCallback);
                Bitmap bitmap = new Bitmap(info.FullName);
                if ((iThumbHeight == 0) && (iThumbWidth == 0))
                {
                    return false;
                }
                if ((iThumbHeight != 0) && (iThumbWidth == 0))
                {
                    iThumbWidth = (iThumbHeight * bitmap.Width) / bitmap.Height;
                }
                else if ((iThumbHeight == 0) && (iThumbWidth != 0))
                {
                    iThumbHeight = (iThumbWidth * bitmap.Height) / bitmap.Width;
                }
                bitmap.GetThumbnailImage(iThumbWidth, iThumbHeight, callback, IntPtr.Zero).Save(newPath + info.Name, ImageFormat.Jpeg);
            }
            catch
            {
                return false;
            }
            return true;
        }

        public static string strInitFlash(string flashURL, int width, int height)
        {
            string str = "<EMBED align=baseline src='" + flashURL + "'";
            if (width != 0)
            {
                str = str + " width=" + width;
            }
            if (height != 0)
            {
                str = str + " height=" + height;
            }
            return (str + " type=audio/x-pn-realaudio-plugin autostart=\"true\" controls=\"ControlPanel\" console=\"Clip1\" border=\"0\">");
        }

        public static string strInitMultimedia(string mediaPath, int width, int height)
        {
            string str = "<EMBED pluginspage='http://www.microsoft.com/Windows/Downloads/Contents/Products/MediaPlayer/' ";
            if (width != 0)
            {
                str = str + " width=" + width;
            }
            if (height != 0)
            {
                str = str + " height=" + height;
            }
            return (str + " src='" + mediaPath + "' type='application/x-mplayer2' ShowStatusBar='1' AutoStart='true' ShowControls='1'></embed>");
        }

        private static bool ThumbnailCallback()
        {
            return false;
        }
    }
}

