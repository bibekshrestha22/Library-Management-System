using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
namespace Kaiser_Library_Management_System
{
    public partial class frmLogin1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            labelwarn.Visible = false;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                //retrieves if there is any record in the login table or not
                SqlConnection con =
                    new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString);
                con.Open();
                string checkuser = "Select Count(*) from Librarian where Email = '" + txtUname.Text + "'";
                SqlCommand cmd = new SqlCommand(checkuser, con);
                int val = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                con.Close();
                if (val == 1)
                {
                    //retrieves if the current user's login credentials is correct or not
                    con.Open();
                    string checkpass = "select Password from Librarian where Email = '" + txtUname.Text + "'";
                    SqlCommand comd = new SqlCommand(checkpass, con);
                    string pass = comd.ExecuteScalar().ToString().Replace(" ", "");
                    con.Close();
                    if (pass == txtPass.Text)
                    {
                        //checking the level of user
                        con.Open();
                        string checklevel = "select userlevel from Librarian where Email = '" + txtUname.Text + "'";
                        SqlCommand comdd = new SqlCommand(checklevel, con);
                        int level = Convert.ToInt32(comdd.ExecuteScalar().ToString());
                       con.Close();
                        if (level == 1)
                        {
                            Session["new"] = txtUname.Text;
                            Response.Redirect("AdminHomePage.aspx");
                        }
                        else 
                        {
                            Session["new"] = txtUname.Text;
                            Response.Redirect("HomePage.aspx");
                        }
                    }
                    else
                    {
                        labelwarn.Visible = true;
                        labelwarn.Text = "Password is incorrect";
                    }
                }
                else
                {

                    labelwarn.Visible = true;
                    labelwarn.Text = "User doesnot exist, Please register the new user";

                }
            }
            catch(Exception ex)
            {
               labelwarn.Text = ex.ToString();
                labelwarn.Visible = true;
            }

        }
    }
}