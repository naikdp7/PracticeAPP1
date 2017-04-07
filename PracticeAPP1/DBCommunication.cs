using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PracticeAPP1
{
    public class DBCommunication
    {
        public bool checkLogin(string username,string password)
        {
            string connectionstr = ConfigurationManager.ConnectionStrings["SmartWasteMgtDB"].ConnectionString;
            //   string query ="select * from AUTHORITYINFO where USERNAME='"+usernametextbox.Value+"' and PASSWORD='"+passwordtextbox+"'";
            using (SqlConnection connection = new SqlConnection(connectionstr))
            {

                SqlCommand command = new SqlCommand("select * from AUTHORITYINFO where USERNAME='" + username + "' and PASSWORD='" + password + "'", connection);
                connection.Open();
                SqlDataAdapter sda = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                
                if (dt.Rows.Count != 0)
                {
                    return true;
                    // Response.Redirect("LoggedIn.aspx");
                }
                else
                {
                    return false;

                }
            }
        }

        private DataSet GetData(string SPName, SqlParameter SPParameter)
        {
            string cs = ConfigurationManager.ConnectionStrings["SmartWasteMgtDB"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter da = new SqlDataAdapter(SPName, con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (SPParameter != null)
            {
                da.SelectCommand.Parameters.Add(SPParameter);
            }
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;

        }
    }
}