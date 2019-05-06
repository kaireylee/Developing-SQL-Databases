using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data; //Data Table
using System.Data.SqlClient; //Data Reader
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AdoDotNet
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            try
            {
                //SqlDataReader reader = StateDB.GetStates();
                //while (reader.Read())  //Take Each Row
                //{
                //    cboStates.Items.Add(reader["StateCode"]);
                //}
                cboStates.Items.Add("SP");
                cboStates.Items.Add("OR");
                cboStates.Items.Add("WA");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnGetCustomers_Click(object sender, EventArgs e)
        {
            try
            {
                string state = cboStates.Text;
                grdCustomers.DataSource = CustomerDB.GetCustomers(state);
                //grdCustomers.DataBind(); //Web

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
