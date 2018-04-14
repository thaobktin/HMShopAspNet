using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization.Formatters.Binary;
using System.IO;
using System.Runtime.Serialization;

namespace HM.Util
{
    /// <summary>
    /// Clone class
    /// http://social.msdn.microsoft.com/Forums/en-US/csharpgeneral/thread/5c9b4c31-850d-41c4-8ea3-fae734b348c4
    /// </summary>
    /// <Modified>
    /// Name     Date         Comments
    /// TRAN QUANG TRUNG  11/4/2013   created
    /// </Modified>
    public static class CloneClassExtensions
    {
        /// <summary>
        /// Deeps clone 1 List object
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="sourceList">The source list.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// TRAN QUANG TRUNG  4/11/2013   created
        /// </Modified>
        public static List<T> DeepCloneList<T>(this List<T> sourceList) where T : class
        {
            if (!typeof(T).IsSerializable)
            {
                throw new ArgumentException("The type must be serializable.", "sourceList");
            }
            // Don't serialize a null object, simply return the default for that object
            if (Object.ReferenceEquals(sourceList, null))
            {
                return null;
            }

            IFormatter formatter = new BinaryFormatter();
            Stream stream = new MemoryStream();
            formatter.Serialize(stream, sourceList);

            using (stream)
            {
                stream.Seek(0, SeekOrigin.Begin);

                return (List<T>)formatter.Deserialize(stream);
            }
        }

        /// <summary>
        /// Deeps the clone object.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="source">The source.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// TRAN QUANG TRUNG  11/4/2013   created
        /// </Modified>
        public static T DeepCloneObject<T>(this T source) where T : class
        {
            if (!typeof(T).IsSerializable)
            {
                throw new ArgumentException("The type must be serializable.", "source");
            }
            // Don't serialize a null object, simply return the default for that object
            if (Object.ReferenceEquals(source, null))
            {
                return default(T);
            }

            IFormatter formatter = new BinaryFormatter();
            Stream stream = new MemoryStream();
            using (stream)
            {
                formatter.Serialize(stream, source);
                stream.Seek(0, SeekOrigin.Begin);
                return (T)formatter.Deserialize(stream);
            }
        }
    }
}
