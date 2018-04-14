using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Reflection;

namespace HM.Util
{
    /// <summary>
    /// Class cung cấp các hàm mở rộng cho Table
    /// </summary>
    /// <Modified>
    /// Name     Date         Comments
    /// trungtq  11/6/2013   created
    /// </Modified>
    public static class DataTableExtensions
    {

        /// <summary>
        /// Convert 1 DataTabel Sang 1 List
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="dt">The dt.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  6/11/2013   created
        /// </Modified>
        public static List<T> ToList<T>(this DataTable dt)
        {
            List<T> list = null;

            if (dt == null || dt.Rows.Count == 0) return null;

            list = new List<T>();
            PropertyInfo[] props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);

            foreach (DataRow dr in dt.Rows)
            {
                T obj = Activator.CreateInstance<T>();
                foreach (PropertyInfo p in props)
                {
                    try
                    {
                        //Neu table chua column nay thi moi map duoc object.
                        if (dr.Table.Columns.Contains(p.Name))
                        {
                            p.SetValue(obj, Convert.ChangeType(dr[p.Name], p.PropertyType), null);
                        }
                    }
                    catch { }
                }
                list.Add(obj);
            }

            return list;
        }
    }
}
