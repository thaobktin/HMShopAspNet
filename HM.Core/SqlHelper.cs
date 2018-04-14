using System;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;

namespace HM.Core
{
    public class SqlHelper
    {
        #region public methods
        public static DataSet GetDataSet(string connectionString, CommandType commandType, string commandText, SqlParameter[] parameters, int timeoutSeconds = 60)
        {
            DataSet ds = null;
            using (var conn = new SqlConnection(connectionString))
            {
                conn.Open();
                using (var comm = CreateCommand(conn, commandType, commandText, parameters, timeoutSeconds))
                {
                    using (DbDataAdapter adapter = new SqlDataAdapter(comm))
                    {
                        ds = new DataSet();
                        ds.EnforceConstraints = false;
                        adapter.Fill(ds);
                    }
                }
            }
            return ds;
        }
        public static TResult ExecuteReader<TResult>(string connectionString, CommandType commandType, string commandText, SqlParameter[] parameters, Func<SqlDataReader, TResult> func)
        {
            using (var conn = new SqlConnection(connectionString))
            {
                conn.Open();
                using (var comm = CreateCommand(conn, commandType, commandText, parameters))
                {
                    var dr = comm.ExecuteReader();
                    var result = func(dr);

                    DisposeCommand(comm);

                    return result;
                }
            }
        }

        public static TResult ExecuteScalar<TResult>(string connectionString, CommandType commandType, string commandText, SqlParameter[] parameters)
        {
            using (var conn = new SqlConnection(connectionString))
            {
                conn.Open();
                using (var comm = CreateCommand(conn, commandType, commandText, parameters))
                {
                    var result = comm.ExecuteScalar();

                    DisposeCommand(comm);

                    return (TResult)result;
                }
            }
        }

        public static TResult ExecuteScalarAsync<TResult>(string connectionString, CommandType commandType, string commandText, SqlParameter[] parameters)
        {
            using (var conn = new SqlConnection(connectionString))
            {
                conn.Open();
                using (var comm = CreateCommand(conn, commandType, commandText, parameters))
                {
                    var result = comm.ExecuteScalarAsync().Result;

                    DisposeCommand(comm);

                    return (TResult)result;
                }
            }
        }

        public static int ExecuteNonQuery(string connectionString, CommandType commandType, string commandText, SqlParameter[] parameters)
        {
            var affect = 0;
            using (var conn = new SqlConnection(connectionString))
            {
                conn.Open();
                using (var comm = CreateCommand(conn, commandType, commandText, parameters))
                {
                    affect = comm.ExecuteNonQuery();

                    DisposeCommand(comm);
                }
            }
            return affect;
        }

        public static int ExecuteNonQuery(string connectionString, string storedName, SqlParameter[] parameters)
        {
            return ExecuteNonQuery(connectionString, CommandType.StoredProcedure, storedName, parameters);
        }

        public static TResult ExecuteReader<TResult>(string connectionString, CommandType commandType, string commandText, SqlParameter[] parameters, Func<SqlDataReader, SqlCommand, TResult> func)
        {
            using (var conn = new SqlConnection(connectionString))
            {
                conn.Open();
                using (var comm = CreateCommand(conn, commandType, commandText, parameters))
                {
                    var dr = comm.ExecuteReader();
                    var result = func(dr, comm);

                    DisposeCommand(comm);

                    return result;
                }
            }
        }

        public static TResult ExecuteReader<TResult>(string connectionString, string storedName, SqlParameter[] parameters,
            Func<SqlDataReader, TResult> func)
        {
            return ExecuteReader(connectionString, CommandType.StoredProcedure, storedName, parameters, func);
        }

        public static void ExecuteCommand(SqlConnection connection, SqlTransaction transaction, CommandType commandType,
            string commandText, SqlParameter[] parameters)
        {
            using (var command = CreateCommand(connection, commandType, commandText, parameters))
            {
                command.Transaction = transaction;
                command.ExecuteNonQuery();
            }
        }

        public static void StartTransaction(string connectionString, Action<SqlConnection, SqlTransaction> action)
        {
            using (var conn = new SqlConnection(connectionString))
            {
                conn.Open();
                var transaction = conn.BeginTransaction();
                try
                {
                    action.Invoke(conn, transaction);
                    transaction.Commit();
                }
                catch (Exception)
                {
                    transaction.Rollback();
                    throw;
                }                                               
            }
        }

        #endregion public methods

        #region private methods

        private static SqlCommand CreateCommand(SqlConnection conn, CommandType commandType, string commandText, SqlParameter[] parameters, int timeoutSeconds = 60)
        {
            var comm = new SqlCommand(commandText);
            comm.Parameters.Clear();
            if (parameters != null && parameters.Any())
            {
                foreach (var param in parameters)
                {
                    comm.Parameters.Add(param);
                }
            }
            comm.CommandType = commandType;
            comm.CommandTimeout = timeoutSeconds;
            comm.Connection = conn;
            comm.CommandText = commandText;
            return comm;
        }

        private static void DisposeCommand(SqlCommand comm)
        {
            comm.Parameters.Clear();
            comm.Connection.Close();
            comm.Dispose();
        }

        #endregion private methods

    }
}
