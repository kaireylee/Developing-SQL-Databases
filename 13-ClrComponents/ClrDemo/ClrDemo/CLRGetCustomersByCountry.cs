using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;

public partial class StoredProcedures
{
    [Microsoft.SqlServer.Server.SqlProcedure]
    public static void CLRGetCustomersByCountry (string Country)
    {
        using (SqlConnection conn = new SqlConnection("context connection=true"))
        {
            conn.Open();
            SqlCommand SelectCommand = new SqlCommand();
            string sql = "Select * From Customers Where Country = @country";
            SelectCommand.CommandType = CommandType.Text;
            SelectCommand.Connection = conn;
            SelectCommand.CommandText = sql;
            SelectCommand.Parameters.AddWithValue("@country", Country);

            SqlContext.Pipe.ExecuteAndSend(SelectCommand); 
        }
    }
}
