using System;
using System.Data;
using System.Data.SqlClient;
using Microsoft.SqlServer.Server;
using System.Transactions;
public partial class Triggers
{        
    // Enter existing table or view for the target and uncomment the attribute line
    [Microsoft.SqlServer.Server.SqlTrigger 
        (Name="CustomerContactTrigger", Target="Customers", Event="FOR INSERT")]
    public static void CustomerContactTrigger ()
    {
        using (SqlConnection conn = new SqlConnection("context connection=true"))
        {
            string sqlString = "Select Count(*) From INSERTED Where ContactName Is Null ";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = sqlString;
            cmd.Connection = conn;
            conn.Open();

            int nullContacts = (int)cmd.ExecuteScalar();
            if (nullContacts > 0)
            {
                SqlPipe pipe = SqlContext.Pipe;
                cmd.CommandText = "RaiseError('Contact Name must be Entered',16,1)";
                pipe.ExecuteAndSend(cmd);
                
                //Rollback Transaction
                Transaction.Current.Rollback();
            }
        }
    }
}

