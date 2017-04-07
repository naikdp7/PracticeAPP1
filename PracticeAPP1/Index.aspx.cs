using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PracticeAPP1
{
    public partial class Index : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            if (usernametextbox.Value == "" || passwordtextbox.Value == "")
            {
                
                
                errormsg.Text = "Fields cannot be left empty";
                
               
            }
            else
            {
                DBCommunication communicate = new DBCommunication();
                if (communicate.checkLogin(usernametextbox.Value, passwordtextbox.Value))
                {
                    
                    Session["username"] = usernametextbox.Value;

                    FormsAuthentication.RedirectFromLoginPage(usernametextbox.Value, false);

                }
                else
                {
                    errormsg.Text = "Invalid Information Try Again";
                }


            }
            



        }

        
    }
}