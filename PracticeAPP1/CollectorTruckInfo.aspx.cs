using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PracticeAPP1
{
    public partial class CollectorTruckInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                onlineuser.Text = "Welcome \n" + Session["username"].ToString() + " ";
                if (!IsPostBack)
                {
                    bindCollectorInfo();

                    Citylist.DataSource = GetData("spGetCities", null);
                    Citylist.DataBind();

                    ListItem liCity = new ListItem("Select City","-1");
                    Citylist.Items.Insert(0,liCity);

                    ListItem liZone = new ListItem("Select Zone", "-1");
                    Zonelist.Items.Insert(0, liZone);

                    Zonelist.Enabled = false;
                    
                }
                
            }
            else
            {
                Response.Redirect("Index.aspx");
            }



        }
        protected void LogOut_Click(object sender, EventArgs e)
        {
            Session["username"] = null;
            Debug.WriteLine("In the method");
            Response.Redirect("Index.aspx");

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
            con.Close();
            return ds;

        }

        protected void Citylist_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Citylist.SelectedIndex==0)
            {
                Zonelist.SelectedIndex = 0;
                Zonelist.Enabled = false;
            }
            else
            {
                Zonelist.Enabled = true;
                SqlParameter parameter = new SqlParameter("@City_Id",Citylist.SelectedValue);
                DataSet ds= GetData("spGetZonesByCity_Id",parameter);
                Zonelist.DataSource = ds;
                Zonelist.DataBind();
                ListItem liZone = new ListItem("Select Zone", "-1");
                Zonelist.Items.Insert(0, liZone);

                                
            }
        }

        private void bindCollectorInfo()
        {
            string query="SELECT Username,Contact_No,City,Zone,Licence from Collector_Info";
            string cs = ConfigurationManager.ConnectionStrings["SmartWasteMgtDB"].ConnectionString;
            using (SqlConnection con=new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query,con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd );
                DataTable dt = new DataTable();
                sda.Fill(dt);
                rptrCollectorInfo.DataSource = dt;
                rptrCollectorInfo.DataBind();
            }

        }

        protected void infoSubmit_Click(object sender, EventArgs e)
        {
            if (username.Value=="" || userpassword.Value=="" || Citylist.SelectedValue=="-1" || Zonelist.SelectedValue=="-1" || contactno.Value=="" || licenceno.Value==""  )
            {
                errormsg.Text = "Invalid Information Try Again";
            }
            else
            {
                string query = "INSERT into Collector_Info VALUES('" + username.Value + "','" + userpassword.Value + "','" + contactno.Value + "','" + Citylist.SelectedItem.ToString() + "','" + Zonelist.SelectedItem.ToString() + "','" + licenceno.Value + "')";
                string cs = ConfigurationManager.ConnectionStrings["SmartWasteMgtDB"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    cmd.ExecuteNonQuery();


                }
                bindCollectorInfo();
                username.Value = "";
                userpassword.Value = "";
                contactno.Value = "";
                licenceno.Value = "";
                errormsg.Text = "";
                Citylist.SelectedIndex = 0;
                Zonelist.SelectedIndex = 0;
            }

        }
    }
}