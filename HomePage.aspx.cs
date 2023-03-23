using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;

namespace Kaiser_Library_Management_System
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["new"] != null)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString);
                con.Open();
                string checkpass = "select userlevel from Librarian where Email = '" + Session["new"].ToString() + "'";
                SqlCommand cmd = new SqlCommand(checkpass,con);
                int level = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                if (level == 1)
                {
                    Response.Redirect("AdminHomePage.aspx");
                }
                else if(level==3)

                {
                    book.Visible = false;
                    author.Visible = false;
                }                
               
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
        protected void btnyes_Click(object sender, EventArgs e)
        {
            Session["new"] = "";
            Response.Redirect("Login.aspx");
        }
    }
}