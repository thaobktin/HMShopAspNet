using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Reflection;
using System.Linq.Expressions;
using System.Collections;
using System.Threading.Tasks;

namespace HM.Util
{
    /// <summary>
    /// Class cung cấp các hàm mở rộng  cho  IEnumerable
    /// </summary>
    /// <Modified>
    /// Name     Date         Comments
    /// trungtq  11/6/2013   created
    /// </Modified>
    public static class IEnumerableExtensions
    {
        /// <summary>
        /// Convert 1 IEnumerable sang DataTable
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="value">The value.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  6/11/2013   created
        /// </Modified>
        public static DataTable ToDataTable<T>(this IEnumerable<T> value) where T : class
        {
            List<PropertyInfo> pList = new List<PropertyInfo>();

            Type type = typeof(T);
            DataTable dt = new DataTable();

            Array.ForEach<PropertyInfo>(type.GetProperties(), p => { pList.Add(p); dt.Columns.Add(p.Name, p.PropertyType); });
            foreach (var item in value)
            {

                DataRow row = dt.NewRow();

                pList.ForEach(p => row[p.Name] = p.GetValue(item, null));

                dt.Rows.Add(row);
            }
            return dt;
        }

        private class Status
        {
            public bool EndOfSequence;
        }

        private static IEnumerable<T> TakeOnEnumerator<T>(IEnumerator<T> enumerator, int count, Status status)
        {
            while (--count > 0 && (enumerator.MoveNext() || !(status.EndOfSequence = true)))
            {
                yield return enumerator.Current;
            }
        }

        /// <summary>
        /// Slices the iteration over an enumerable by the given chunk size.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="items"></param>
        /// <param name="chunkSize">SIze of chunk</param>
        /// <returns>The sliced enumerable</returns>
        public static IEnumerable<IEnumerable<T>> Chunk<T>(this IEnumerable<T> items, int chunkSize = 100)
        {
            if (chunkSize < 1)
            {
                throw new ArgumentException("Chunks should not be smaller than 1 element");
            }
            var status = new Status { EndOfSequence = false };
            using (var enumerator = items.GetEnumerator())
            {
                while (!status.EndOfSequence)
                {
                    yield return TakeOnEnumerator(enumerator, chunkSize, status);
                }
            }
        }

        /// <summary>
        /// Performs an action on each item while iterating through a list. 
        /// This is a handy shortcut for <c>foreach(item in list) { ... }</c>
        /// </summary>
        /// <typeparam name="T">The type of the items.</typeparam>
        /// <param name="source">The list, which holds the objects.</param>
        /// <param name="action">The action delegate which is called on each item while iterating.</param>
        public static void Each<T>(this IEnumerable<T> source, Action<T> action)
        {
            foreach (T t in source)
            {
                action(t);
            }
        }

        /// <summary>
        /// Shorthand extension method for converting enumerables into the arrays
        /// </summary>
        /// <typeparam name="TSource">The type of the source array.</typeparam>
        /// <typeparam name="TTarget">The type of the target array.</typeparam>
        /// <param name="self">The collection to convert.</param>
        /// <param name="converter">The converter.</param>
        /// <returns>target array instance</returns>
        public static TTarget[] ToArray<TSource, TTarget>(this IEnumerable<TSource> source, Func<TSource, TTarget> converter)
        {
            return source.Select(converter).ToArray();
        }

        public static bool Exists<T>(this IEnumerable<T> source, Func<T, bool> func)
        {
            return source.Count(func) > 0;
        }

        public static IEnumerable<T> CastValid<T>(this IEnumerable source)
        {
            return source.Cast<object>().Where(o => o is T).Cast<T>();
        }

        public static bool HasItems(this IEnumerable source)
        {
            return source == null || source.GetEnumerator().MoveNext();
        }

        public static int GetCount(this IEnumerable source)
        {
            return source.AsQueryable().GetCount();
        }

        public static bool IsNullOrEmpty(this IEnumerable source)
        {
            return (source == null || !source.HasItems());
        }

        public static bool TryGetItem<T>(this IEnumerable<T> source, Expression<Func<T, bool>> predicate, out T item)
        {
            item = default(T);

            try
            {
                item = source.AsQueryable().First(predicate);
                return true;
            }
            catch
            {
                return false;
            }
        }

        #region TrueForAll

        /// <summary>
        /// Determines if the predicates are true for each item in a list
        /// </summary>
        /// <typeparam name="T">The type of the items in the list</typeparam>
        /// <param name="List">IEnumerable to look through</param>
        /// <param name="Predicates">Predicates to use to check the IEnumerable</param>
        /// <returns>True if they all pass all of the predicates, false otherwise</returns>
        public static bool TrueForAll<T>(this IEnumerable<T> List, params Predicate<T>[] Predicates)
        {
            List.ThrowIfNull("List");
            Predicates.ThrowIfNull("Predicate");
            foreach (Predicate<T> Predicate in Predicates)
                if (List.Any(x => !Predicate(x)))
                    return false;
            return true;
        }

        #endregion

        #region TrueForAny

        /// <summary>
        /// Determines if the predicates are true for any item in a list
        /// </summary>
        /// <typeparam name="T">The type of the items in the list</typeparam>
        /// <param name="List">IEnumerable to look through</param>
        /// <param name="Predicates">Predicates to use to check the IEnumerable</param>
        /// <returns>True if any pass any of the predicates, false otherwise</returns>
        public static bool TrueForAny<T>(this IEnumerable<T> List, params Predicate<T>[] Predicates)
        {
            List.ThrowIfNull("List");
            Predicates.ThrowIfNull("Predicate");
            foreach (Predicate<T> Predicate in Predicates)
                if (List.Any(x => Predicate(x)))
                    return true;
            return false;
        }

        #endregion

        #region ForParallel

        /// <summary>
        /// Does an action for each item in the IEnumerable between the start and end indexes in parallel
        /// </summary>
        /// <typeparam name="T">Object type</typeparam>
        /// <param name="List">IEnumerable to iterate over</param>
        /// <param name="Start">Item to start with</param>
        /// <param name="End">Item to end with</param>
        /// <param name="Action">Action to do</param>
        /// <returns>The original list</returns>
        public static IEnumerable<T> ForParallel<T>(this IEnumerable<T> List, int Start, int End, Action<T> Action)
        {
            List.ThrowIfNull("List");
            Action.ThrowIfNull("Action");
            Parallel.For(Start, End + 1, new Action<int>(x => Action(List.ElementAt(x))));
            return List;
        }

        /// <summary>
        /// Does an action for each item in the IEnumerable between the start and end indexes in parallel
        /// </summary>
        /// <typeparam name="T">Object type</typeparam>
        /// <typeparam name="R">Results type</typeparam>
        /// <param name="List">IEnumerable to iterate over</param>
        /// <param name="Start">Item to start with</param>
        /// <param name="End">Item to end with</param>
        /// <param name="Function">Function to do</param>
        /// <returns>The resulting list</returns>
        public static IEnumerable<R> ForParallel<T, R>(this IEnumerable<T> List, int Start, int End, Func<T, R> Function)
        {
            List.ThrowIfNull("List");
            Function.ThrowIfNull("Function");
            R[] Results = new R[(End + 1) - Start];
            Parallel.For(Start, End + 1, new Action<int>(x => Results[x - Start] = Function(List.ElementAt(x))));
            return Results;
        }

        #endregion

        #region ForEachParallel

        /// <summary>
        /// Does an action for each item in the IEnumerable in parallel
        /// </summary>
        /// <typeparam name="T">Object type</typeparam>
        /// <param name="List">IEnumerable to iterate over</param>
        /// <param name="Action">Action to do</param>
        /// <returns>The original list</returns>
        public static IEnumerable<T> ForEachParallel<T>(this IEnumerable<T> List, Action<T> Action)
        {
            List.ThrowIfNull("List");
            Action.ThrowIfNull("Action");
            Parallel.ForEach(List, Action);
            return List;
        }

        /// <summary>
        /// Does an action for each item in the IEnumerable in parallel
        /// </summary>
        /// <typeparam name="T">Object type</typeparam>
        /// <typeparam name="R">Results type</typeparam>
        /// <param name="List">IEnumerable to iterate over</param>
        /// <param name="Function">Function to do</param>
        /// <returns>The results in an IEnumerable list</returns>
        public static IEnumerable<R> ForEachParallel<T, R>(this IEnumerable<T> List, Func<T, R> Function)
        {
            List.ThrowIfNull("List");
            Function.ThrowIfNull("Function");
            return List.ForParallel(0, List.Count() - 1, Function);
        }

        #endregion

        #region TryAll

        /// <summary>
        /// Tries to do the action on each item in the list. If an exception is thrown,
        /// it does the catch action on the item (if it is not null).
        /// </summary>
        /// <typeparam name="T">The type of the items in the list</typeparam>
        /// <param name="List">IEnumerable to look through</param>
        /// <param name="Action">Action to run on each item</param>
        /// <param name="CatchAction">Catch action (defaults to null)</param>
        /// <returns>The list after the action is run on everything</returns>
        public static IEnumerable<T> TryAll<T>(this IEnumerable<T> List, Action<T> Action, Action<T> CatchAction = null)
        {
            List.ThrowIfNull("List");
            Action.ThrowIfNull("Action");
            foreach (T Item in List)
            {
                try
                {
                    Action(Item);
                }
                catch { if (CatchAction != null) CatchAction(Item); }
            }
            return List;
        }

        #endregion

        #region TryAllParallel

        /// <summary>
        /// Tries to do the action on each item in the list. If an exception is thrown,
        /// it does the catch action on the item (if it is not null). This is done in
        /// parallel.
        /// </summary>
        /// <typeparam name="T">The type of the items in the list</typeparam>
        /// <param name="List">IEnumerable to look through</param>
        /// <param name="Action">Action to run on each item</param>
        /// <param name="CatchAction">Catch action (defaults to null)</param>
        /// <returns>The list after the action is run on everything</returns>
        public static IEnumerable<T> TryAllParallel<T>(this IEnumerable<T> List, Action<T> Action, Action<T> CatchAction = null)
        {
            List.ThrowIfNull("List");
            Action.ThrowIfNull("Action");
            Parallel.ForEach<T>(List, delegate(T Item)
            {
                try
                {
                    Action(Item);
                }
                catch { if (CatchAction != null) CatchAction(Item); }
            });
            return List;
        }

        #endregion
    }
}
