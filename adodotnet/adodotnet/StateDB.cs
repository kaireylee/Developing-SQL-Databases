using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdoDotNet
{
    public static class StateDB
    {
        public static SqlDataReader GetStates()
        {
            SqlConnection conn = CourseConnection.MMABooks();

            string sql = "Select StateCode From States";
            SqlCommand selectCommand = new SqlCommand();
            selectCommand.Connection = conn;
            //selectCommand.CommandType = CommandType.StoredProcedure;
            //selectCommand.CommandText = "StoredProcName";
            selectCommand.CommandText = sql;

            try
            {
                conn.Open();
                SqlDataReader reader = selectCommand.ExecuteReader(CommandBehavior.CloseConnection);

                return reader;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                //Clean Up
                //conn.Close();
            }


        }
    }
}
