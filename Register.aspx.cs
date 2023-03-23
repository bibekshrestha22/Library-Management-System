using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Kaiser_Library_Management_System
{
    public partial class frmRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["new"] != null)
            {
                DDUserlevel.Items.Add("2");
                DDUserlevel.Items.Add("3");
                if (IsPostBack)
                {
                    SqlConnection con =
                        new SqlConnection(
                            ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString);
                    con.Open();
                    string checkuser = "Select Count(*) from Librarian where username = '" + txtUsername.Text + "'";
                    SqlCommand cmd = new SqlCommand(checkuser, con);
                    int val = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                    if (val == 1)
                    {
                        Response.Write("user already exists, try new username");
                        //ScriptManager.RegisterClientScriptBlock(this,this.GetType(),"alertMessage","alert('User Already Exists, Please choose different username')",true);
                        //txtCpass.Text = "";
                        //txtEmail.Text = "";
                        //txtUsername.Text = "";

                    }
                    con.Close();

                }
            }
            else
            {
                Response.Redirect("Default.aspx");
                    
               
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString);
                con.Open();
                string checkuser = "Select Count(*) from Librarian where Email = '" + txtUsername.Text + "'";
                SqlCommand cmd = new SqlCommand(checkuser, con);
                int val = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                if (val == 1)
                {
                    lblwarning.Visible = true;
                    lblwarning.Text=("User already exists, try new username");
                    
                    //ScriptManager.RegisterClientScriptBlock(this,this.GetType(),"alertMessage","alert('User Already Exists, Please choose different username')",true);
                    //txtCpass.Text = "";
                    //txtEmail.Text = "";
                    //txtUsername.Text = "";
                    con.Close();
                }
                else
                {
                    Guid ng = Guid.NewGuid();
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString);
                    conn.Open();
                    string insertuser = "Insert into Librarian (Id,username,Email,Password,userlevel) Values (@Id,@Uname ,@Email ,@Password,@ulevel)";
                    SqlCommand cmdd = new SqlCommand(insertuser, conn);
                    cmdd.Parameters.AddWithValue("@Id", ng.ToString());
                    cmdd.Parameters.AddWithValue("@Uname", txtUsername.Text);
                    cmdd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmdd.Parameters.AddWithValue("@Password", txtPass.Text);
                    cmdd.Parameters.AddWithValue("@ulevel", DDUserlevel.Text);
                    cmdd.ExecuteNonQuery();
                    Response.Write("The user has been registered successfully");
                    dglist.DataBind();
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                lblwarning.Text = ex.ToString();
                lblwarning.Visible = true;
            }
        }
    }
}