using System;
using System.Text;
using HM.Util;
using HM.Common;

namespace HM.Cache
{
    public class MediaCache
    {
        public static string UploadPath()
        {
            return CommonCache.GetValue(Constant.CMS_UploadPath);
        }

        public static int ImageMaxSize()
        {
            return Convert.ToInt32(CommonCache.GetValue(Constant.CMS_ImageMaxSize));
        }

        public static int FlashMaxSize()
        {
            return Convert.ToInt32(CommonCache.GetValue(Constant.CMS_FlashMaxSize));
        }

        public static int ThumbWidth()
        {
            return Convert.ToInt32(CommonCache.GetValue(Constant.CMS_ThumbWidth));
        }

        public static int ThumbHeight()
        {
            return Convert.ToInt32(CommonCache.GetValue(Constant.CMS_ThumbHeight));
        }
    }
}