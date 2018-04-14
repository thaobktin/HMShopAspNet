using System;
using System.Data;

namespace HM.Core
{
    public class DataProvider
    {
        /// <summary>
        /// Gets the data value.
        /// </summary>
        /// <param name="dataReader">The data reader.</param>
        /// <param name="columnName">Name of the column.</param>
        public static T GetDataValue<T>(IDataReader dataReader, string columnName)
        {
            T ret = default(T);
            object value = dataReader[columnName];
            if (value == null && DBNull.Value.Equals(value))
            {
                return default(T);
            }
            if (!typeof(T).IsEnum)
            {
                Type t = typeof(T);

                ret = (T)Convert.ChangeType(value, Nullable.GetUnderlyingType(t) ?? t);
            }
            else
            {
                if (value != null)
                {
                    ret = (T)Enum.ToObject(typeof(T), value);
                }
            }
            
            return ret;
        }

        /// <summary>
        /// Gets the data value.
        /// </summary>
        /// <param name="dataReader">The data reader.</param>
        /// <param name="columnIndex">Index of the column.</param>
        public static T GetDataValue<T>(IDataReader dataReader, int columnIndex)
        {
            T ret = default(T);

            if (!typeof(T).IsEnum)
            {
                if (!dataReader.IsDBNull(columnIndex))
                {
                    //ret = (T)dataReader.GetValue(columnIndex);
                    ret = (T)Convert.ChangeType(dataReader.GetValue(columnIndex), typeof(T));
                }
            }
            else
            {
                if (!dataReader.IsDBNull(columnIndex))
                {
                    ret = (T)Enum.ToObject(typeof(T), dataReader.GetValue(columnIndex));
                }
            }

            return ret;
        }

        public static bool ColumnExists(IDataReader reader, string columnName)
        {
            for (int i = 0; i < reader.FieldCount; i++)
            {
                if (reader.GetName(i).Equals(columnName, StringComparison.InvariantCultureIgnoreCase))
                {
                    return true;
                }
            }

            return false;
        }
    }
}
