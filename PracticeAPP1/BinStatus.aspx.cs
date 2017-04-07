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
    public partial class BinStatus : System.Web.UI.Page
    {
       
        static string cs = ConfigurationManager.ConnectionStrings["SmartWasteMgtDB"].ConnectionString;
        
        int level = 0;
        int levelval = 0;
        
        protected void Page_Load(object sender, EventArgs e)
        {
           

            if (Session["username"] != null)
            {
                onlineuser.Text = "Welcome \n" + Session["username"].ToString() + " ";
                if (!IsPostBack)
                {
                    NewSetImageURL();
                        //SetImageURL();
                }
               
            }
            else
            {
                Response.Redirect("Index.aspx");
            }

        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            NewSetImageURL();
        }

        protected void LogOut_Click(object sender, EventArgs e)
        {
            Session["username"] = null;
            
            Response.Redirect("Index.aspx");

        }

      /*  private void SetImageURL()
        {
            
            if (ViewState["imagedisplayed"]==null)
            {
                binimage.ImageUrl = "~/Images/1.png";
                ViewState["imagedisplayed"] = 1;


            }
            else
            {
                
                int i = (int)ViewState["imagedisplayed"];
                if (i==10)
                {
                    binimage.ImageUrl = "~/Images/1.png";
                    ViewState["imagedisplayed"] = 1;

                }
                else
                {
                    i = i + 1;
                    binimage.ImageUrl = "~/Images/" + i.ToString() + ".png";
                    ViewState["imagedisplayed"] = i;
                }
            }
            
            
        }*/

        private void NewSetImageURL()
        {
           level=checkBinStatus();
            if (level >= 90)
            {
                binimage.ImageUrl = "~/Images/10.png";
            }
            else if (level >= 80 && level < 90)
            {
                binimage.ImageUrl = "~/Images/9.png";
            }
            else if (level >= 70 && level < 80)
            {
                binimage.ImageUrl = "~/Images/8.png";
            }
            else if (level >= 60 && level < 70)
            {
                binimage.ImageUrl = "~/Images/7.png";
            }
            else if (level >= 50 && level < 60)
            {
                binimage.ImageUrl = "~/Images/6.png";
            }
            else if (level >= 40 && level < 50)
            {
                binimage.ImageUrl = "~/Images/5.png";
            }
            else if (level >= 30 && level < 40)
            {
                binimage.ImageUrl = "~/Images/4.png";
            }
            else if (level >= 20 && level < 30)
            {
                binimage.ImageUrl = "~/Images/3.png";
            }
            else if (level >= 10 && level < 20)
            {
                binimage.ImageUrl = "~/Images/2.png";
            }
            else
            {
                binimage.ImageUrl = "~/Images/1.png";
            }


        }

        private int checkBinStatus()
        {

            String a = "";
            SqlConnection connection = new SqlConnection(cs);
            SqlCommand command = new SqlCommand("SELECT Status from Bin_Status WHERE Bin_Id=1",connection);
            connection.Open();
            SqlDataAdapter sda = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            foreach (DataRow row in dt.Rows)
            {
                 a = row["Status"].ToString();
                Debug.WriteLine("in the method"+a);
            }
            connection.Close();
            levelval = Convert.ToInt32(Convert.ToDouble(a));
            Debug.WriteLine("outtt the method" + levelval);
              return levelval;



        }

        protected void StartLiveView_Click(object sender, EventArgs e)
        {
            if (Timer1.Enabled)
            {
                Timer1.Enabled = false;
            }
            else
            {
                Timer1.Enabled = true;
            }
        }


    }
}