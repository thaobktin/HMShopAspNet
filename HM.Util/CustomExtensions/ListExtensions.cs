using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HM.Util
{
    public static class ListExtensions
    {
        public static List<T> Clone<T>(this List<T> src)
          where T : ICloneable
        {
            List<T> tList = new List<T>();

            foreach (T t in src)
            {
                object c = t.Clone();
                tList.Add((T)c);
            }

            return tList;
        }
    }
}
