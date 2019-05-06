using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdoDotNet
{
    public static class CustomerDB
    {
        public static DataTable GetCustomers()
        {
            DataTable dt = new DataTable();
            return dt;
        }

        public static DataTable GetCustomers(int id)
        {
            DataTable dt = new DataTable();
            return dt;
        }

        public static DataTable GetCustomers(string state)
        {
            SqlConnection conn = CourseConnection.MMABooks();

            SqlCommand selectCommand = new SqlCommand();
            selectCommand.Connection = conn;
            selectCommand.CommandText = "Select * From Customers Where Region = @State";
            selectCommand.Parameters.AddWithValue("@State", state);

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = selectCommand;
            
            DataTable dt = new DataTable();

            try
            {
                conn.Open();
                da.Fill(dt); 

                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }
    }
}
