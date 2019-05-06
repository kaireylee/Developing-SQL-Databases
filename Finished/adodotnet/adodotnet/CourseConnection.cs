using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace AdoDotNet
{
    public static class CourseConnection
    {
        public static SqlConnection MMABooks()
        {
            string connectionString = @"Data Source=.;Initial Catalog=Northwind;Integrated Security=true;";
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = connectionString;
            return conn;
        }
    }
}
