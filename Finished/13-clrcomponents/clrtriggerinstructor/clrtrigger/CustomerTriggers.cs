using System;
using System.Data;
using System.Data.SqlClient;
using Microsoft.SqlServer.Server;
using System.Transactions;

public partial class Triggers
{
    [Microsoft.SqlServer.Server.SqlTrigger
        (Name = "CustomerTrigger", Target = "Customers", Event = "FOR INSERT")]
    public static void CustomerTrigger()
    {
        using (SqlConnection conn = new SqlConnection("context connection = true"))
        {
            string sqlString =
                "Select Count(*) From INSERTED Where ContactName Is Null";
            SqlCommand cmd = new SqlCommand(sqlString, conn);
            conn.Open();

            int nullContacts = (int)cmd.ExecuteScalar();

            if (nullContacts > 0)
            {
                SqlPipe pipe = SqlContext.Pipe;
                cmd.CommandText =
                    "RaiseError('FIELD - ContactName muse have Content', 16, 1)";
                pipe.ExecuteAndSend(cmd);

                //Rollback - Rows are not fullfilled
                Transaction.Current.Rollback();
            }
        }
    }
}

