using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace PracticeAPP1
{
    public partial class NewCollectorTruckInfo : System.Web.UI.Page
    {
       
        string cs = ConfigurationManager.ConnectionStrings["SmartWasteMgtDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Session["username"] != null)
            {
                onlineuser.Text = "Welcome \n" + Session["username"].ToString() + " ";
                if (!IsPostBack)
                {

                    

                    Citylist.DataSource = GetData("spGetCities", null);
                    Citylist.DataBind();
                    Debug.WriteLine("Applying Data Data");
                    ListItem liCity = new ListItem("Select City", "-1");
                    Citylist.Items.Insert(0, liCity);

                    ListItem liZone = new ListItem("Select Zone", "-1");
                    Zonelist.Items.Insert(0, liZone);
                    Zonelist.Enabled = false;
                    addCity_Name.DataSource = GetData("spGetCities", null);
                    addCity_Name.DataBind();
                    Debug.WriteLine("Applying Data Data");
                    ListItem addliCity = new ListItem("Select City", "-1");
                    addCity_Name.Items.Insert(0, addliCity);

                    ListItem addliZone = new ListItem("Select Zone", "-1");
                    addZone_Name.Items.Insert(0, addliZone);

                    addZone_Name.Enabled = false;

                  /* 
                   *  binCity_Info.DataSource = GetData("spGetCities", null);
                    binCity_Info.DataBind();
                    Debug.WriteLine("Applying Data Data");
                    ListItem binliCity = new ListItem("Select City", "-1");
                    binCity_Info.Items.Insert(0, binliCity);

                    ListItem binliZone = new ListItem("Select Zone", "-1");
                    binZone_Info.Items.Insert(0, binliZone);
                    binZone_Info.Enabled = false;*/



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
            
            Response.Redirect("Index.aspx");

        }

        

        protected void infoSubmit_Click(object sender, EventArgs e)
        {
           bindCollectorInfo();
            addCity_Name.SelectedIndex = 0;
            addZone_Name.SelectedIndex = 0;
        }

        protected void viewinfo_Click(object sender, EventArgs e)
        {
            

            CollectorInfo.ActiveViewIndex = 0;
            currentbardisplay.Text = "View Collector's Info.";
            viewinfo.Enabled = false;
            addinfo.Enabled = true;
            addbininfobar.Enabled = true;
            Citylist.SelectedIndex = 0;
            Zonelist.SelectedIndex = 0;
            Zonelist.Enabled = false;
            clearCollectorFields();
            

        }

        protected void addinfo_Click(object sender, EventArgs e)
        {
            showCollectorInformation.DataSource = null;
            showCollectorInformation.DataBind();
            Debug.WriteLine("In Add Info");
            CollectorInfo.ActiveViewIndex = 1;
            addInfoLabel.Text = "Add New Collector's Info.";
            addinfo.Enabled = false;
            viewinfo.Enabled = true;
            addbininfobar.Enabled = true;
            Debug.WriteLine("Getting Data");
            addZone_Name.Enabled = false;
            clearCollectorFields();

        }

        protected void infoAdd_Click(object sender, EventArgs e)
        {

            if (username.Value == "" || userpassword.Value == "" || addCity_Name.SelectedValue == "-1" ||addZone_Name.SelectedValue == "-1" || contactno.Value.Count() !=10 || validateLicence(licenceno.Value))
            {
                displayMSG.Text = "Invalid Information Try Again";
            }
            else
            {
                string query = "INSERT into Collector_Info VALUES('" + username.Value + "','" + userpassword.Value + "','" + contactno.Value + "','" + addCity_Name.SelectedItem.ToString() + "','" + addZone_Name.SelectedItem.ToString() + "','" + licenceno.Value + "')";
               
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    cmd.ExecuteNonQuery();


                }
                displayMSG.Text = "Successfully Inserted The Data";

                clearCollectorFields();
            }
        }

        private DataSet GetData(string SPName, SqlParameter SPParameter)
        {
            
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

        private void bindCollectorInfo()
        {
            string query = "SELECT Username,Contact_No,City,Zone,Licence from Collector_Info WHERE City='" + Citylist.SelectedItem + "' AND Zone='" + Zonelist.SelectedItem + "'";
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                
                showCollectorInformation.DataSource = dt;
                showCollectorInformation.DataBind();
            }
            

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

        protected void addCity_Name_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (addCity_Name.SelectedIndex == 0)
            {
                addZone_Name.SelectedIndex = 0;
                addZone_Name.Enabled = false;
            }
            else
            {
                addZone_Name.Enabled = true;
                SqlParameter parameter = new SqlParameter("@City_Id", addCity_Name.SelectedValue);
                DataSet ds = GetData("spGetZonesByCity_Id", parameter);
                addZone_Name.DataSource = ds;
                addZone_Name.DataBind();
                ListItem liZone = new ListItem("Select Zone", "-1");
                addZone_Name.Items.Insert(0, liZone);


            }

            
        }

        

        protected void showCollectorInformation_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType==DataControlRowType.DataRow)
            {
                Control control= e.Row.Cells[0].Controls[0];
                if (control is LinkButton)
                {
                    ((LinkButton)control).OnClientClick = "return confirm('Are you sure')";
                }
            }
        }

       protected void showCollectorInformation_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            
           string query = "DELETE from Collector_Info where Licence='"+e.Values[4].ToString()+"'";
            
           
           using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.ExecuteNonQuery();


            }

            bindCollectorInfo();
        }

        private bool validateLicence(string checklicence)
        {

            
            if (checklicence.Count() != 15 || !checklicence.StartsWith("GJ"))
            {
                return true;
            }
            else
            {
                return false;
            }
            
        }

        protected void addbininfobar_Click(object sender, EventArgs e)
        {
            showCollectorInformation.DataSource = null;
            showCollectorInformation.DataBind();
            CollectorInfo.ActiveViewIndex = 2;
            viewinfo.Enabled = true;
            addinfo.Enabled = true;
            addbininfobar.Enabled = false;
            addBinLabel.Text = "Add Bin Info.";
        }

        private void clearCollectorFields()
        {
            username.Value = "";
            userpassword.Value = "";
            contactno.Value = "";
            licenceno.Value = "";
            errormsg.Text = "";
            addCity_Name.SelectedIndex = 0;
            addZone_Name.SelectedIndex = 0;
        }

        /** zone and city for add bin info
         *  protected void addbinCity_Name_SelectedIndexChanged(object sender, EventArgs e)
          {
              if (binCity_Info.SelectedIndex == 0)
              {
                  binZone_Info.SelectedIndex = 0;
                  binZone_Info.Enabled = false;
              }
              else
              {
                  binZone_Info.Enabled = true;
                  SqlParameter parameter = new SqlParameter("@City_Id", binCity_Info.SelectedValue);
                  DataSet ds = GetData("spGetZonesByCity_Id", parameter);
                  binZone_Info.DataSource = ds;
                  binZone_Info.DataBind();
                  ListItem libinZone = new ListItem("Select Zone", "-1");
                  binZone_Info.Items.Insert(0, libinZone);


              }*/
        protected void bininfoAdd_Click(object sender, EventArgs e)
        {

            if (binid.Value == "" || latitude.Value == "" || longitude.Value == "" )
            {
                bininfoadderror.Text = "Invalid Information Try Again";
            }
            else
            {
                try
                {
                   double latitudeval= double.Parse(latitude.Value);
                  double longitudeval= double.Parse(longitude.Value);
                    string query = "INSERT into Bin_Status VALUES('" + binid.Value + "','" + 0 + "','" + latitudeval + "','" + longitudeval + "')";

                    using (SqlConnection con = new SqlConnection(cs))
                    {
                        SqlCommand cmd = new SqlCommand(query, con);
                        con.Open();
                        cmd.ExecuteNonQuery();


                    }
                    bininfoadderror.Text = "Successfully Inserted The Data";
                    binid.Value = "";
                    latitude.Value = "";
                    longitude.Value = "";

                }
                catch (Exception)
                {

                    Debug.Write("Unable to cnvert"+latitude.Value+" and"+ longitude.Value);
                    bininfoadderror.Text = "Enter Valid Information";
                }
                
            }
        }

    }
    }


