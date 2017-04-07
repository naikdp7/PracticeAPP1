using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PracticeAPP1
{
    public partial class UserRegisteration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterInfo_Click(object sender, EventArgs e)
        {
            if (username.Value=="" || password.Value== "" || licenceid.Value=="" || password.Value!=confirmpassword.Value )
            {
                regerrormsg.Text = "Registration Unsuccessful Try Again";
            }
            else
            {
                Response.Write("Successful ");
                string connectionstr = ConfigurationManager.ConnectionStrings["SmartWasteMgtDB"].ConnectionString;
                string query = "insert into AUTHORITYINFO values('" + username.Value + "','" + password.Value + "','" + licenceid.Value + "') ";
                using (SqlConnection connection = new SqlConnection(connectionstr))
                {
                    
                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();
                    command.ExecuteNonQuery();
                    Response.Redirect("Index.aspx");
                }
            }
            

        }



        /*protected void RegisterBtn_Click(object sender, EventArgs e)
        {
            string connectionstr = ConfigurationManager.ConnectionStrings["SmartWasteMgtDB"].ConnectionString;
            string query = "insert into AUTHORITYINFO values('"+username.Value+"','"+password.Value+"','"+licenceid.Value+"') ";
            SqlConnection connection = new SqlConnection(connectionstr);
            SqlCommand command = new SqlCommand(query,connection);
            connection.Open();
            command.ExecuteNonQuery();
            Response.Write("Successfully Registeered");

        }*/
    }
}