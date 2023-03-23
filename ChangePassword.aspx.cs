using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Kaiser_Library_Management_System
{
    public partial class frmChangePassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Visible = false;
            if (Session["new"] != null)
            {
                try
                {
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter("Select Password from Librarian where Email='"+Session["new"].ToString()+"'", con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    txtCurrentPass.Text = dt.Rows[0][0].ToString();
                    con.Close();
                    dt.Clear();
                }
                catch(Exception ex)
                {
                    Response.Write(ex.ToString());
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
            Response.Redirect("Default.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string newpass = txtNewPass.Text;
            string confirmpass = txtConfirmPass.Text;
            if(newpass!=""||confirmpass!="")
            {
                if(newpass==confirmpass)
                {
                    try
                    {
                        con.Open();
                        string newpassword = txtConfirmPass.Text;
                        SqlCommand updatepass = new SqlCommand("Update Librarian set Password = '" + newpassword + "' where Email='" + Session["new"].ToString() + "'", con);
                        updatepass.ExecuteNonQuery();
                        con.Close();
                        lblMessage.Visible = true;
                        lblMessage.Text = "Password Successfully Changed!";
                        lblMessage.ForeColor = System.Drawing.Color.Green;

                    }
                    catch (Exception ex)
                    {
                        RequiredFieldValidator1.Text = ex.ToString();
                    }

                }
                else
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = "Passwords must Match!";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }

            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Passwords Cannot Be Empty!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
           
        }
    }
}