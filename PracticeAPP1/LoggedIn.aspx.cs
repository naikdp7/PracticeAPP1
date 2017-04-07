using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PracticeAPP1
{
    public partial class NavigationBar : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"]!=null)
            {
                onlineuser.Text = "Welcome \n"+Session["username"].ToString()+" ";
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
    }
}