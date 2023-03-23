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
    public partial class Author : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if(Session["new"]!=null)
            {
                lblWarning.Visible = false;
                lblSelect.Text = "No ID Selected";
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnyes_Click(object sender, EventArgs e)
        {
            Session["new"] = "";
            Response.Redirect("Author.aspx");
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if(txtAuthorname.Text!="")
            {
                try
                {
                    Guid aid = Guid.NewGuid();
                    string id = aid.ToString();
                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO AUTHOR VALUES(@ID,@AUTHORNAME) ", con);
                    cmd.Parameters.AddWithValue("@ID", id);
                    cmd.Parameters.AddWithValue("@AUTHORNAME", txtAuthorname.Text);
                    cmd.ExecuteNonQuery();
                    lblWarning.Visible = true;
                    lblWarning.Text = "Author Successfully Registered!";
                    txtAuthorname.Text = "";
                    GridView1.DataBind();
                    con.Close();
                }
                catch(Exception ex)
                {
                    lblWarning.Visible = true;
                    lblWarning.Text = ex.ToString();
                }
            }
            else
            {
                lblWarning.Visible = true;
                lblWarning.Text = "Author Name Cannot be Empty";
            }
        }
        protected void dataGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteData")
            {
                // Retrieve the row index stored in the CommandArgument property.
                int index = Convert.ToInt32(e.CommandArgument);

                // Retrieve the row that contains the button from the Rows collection.
                GridViewRow row = GridView1.Rows[index];
                lblSelect.Text = row.Cells[0].Text;
            }
        }
        protected void btnYes_Click(object sender,EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM Author where AuthorId='"+ lblSelect.Text +"' ", con);
                cmd.ExecuteNonQuery();
                GridView1.DataBind();
                con.Close();
            }
            catch(Exception Ex)
            {
                lblSelect.Visible = true;
                lblSelect.Text = Ex.ToString();
            }
        }
    }
}