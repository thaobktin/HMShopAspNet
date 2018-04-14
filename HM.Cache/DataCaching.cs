using System;
using System.Collections;
using System.Data;
using System.Web;
using HtmlAgilityPack;


namespace HM.Cache
{
    public class DataCaching
    {
        //static HttpContext context = HttpContext.Current;

        public static object GetCache(string key)
        {
            object obj = null;
            //this.context.Cache.Get(key);
            obj = HttpRuntime.Cache.Get(key);
            return obj;
        }

        public static object GetHashCache(string hashKey, object param)
        {
            Hashtable cache = (Hashtable)GetCache(hashKey);
            if (cache == null)
            {
                return null;
            }
            if (cache[param] == null)
            {
                return null;
            }
            return cache[param];
        }

        public static void InsertCache(string key, object data, double expireTime)
        {
            if (expireTime == 0.0)
            {
                expireTime = CommonCache.DefaultCacheExpire;
            }
            
            //this.context.Cache.Insert(key, data, null, DateTime.Now.AddHours(expireTime), Cache.NoSlidingExpiration);
            HttpRuntime.Cache.Insert(key, data, null, 
                DateTime.Now.AddHours(expireTime),
                System.Web.Caching.Cache.NoSlidingExpiration);
        }

        public static void InsertCacheNoExpireTime(string key, object data)
        {
            if (data != null)
            {
                //this.context.Cache.Insert(key, data);
                HttpRuntime.Cache.Insert(key, data);
            }
        }

        public static bool RemoveCache(string key)
        {
            bool ret = false;
            //if (this.context.Cache[key] != null)
            //{
            //    this.context.Cache.Remove(key);
            //    return true;
            //}
            if(HttpRuntime.Cache[key] != null)
            {
                HttpRuntime.Cache.Remove(key);
                ret = true;
            }

            return ret;
        }

        public static void SetHashCache(string hashKey, object param, double expireTime, object data)
        {
            Hashtable cache = (Hashtable)GetCache(hashKey);
            if (cache == null)
            {
                cache = new Hashtable();
                cache.Add(param, data);
                InsertCache(hashKey, cache, expireTime);
            }
            else if ((cache[param] == null) && !cache.ContainsKey(param))
            {
                cache.Add(param, data);
            }
        }
    }
}

