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
    public partial class Book : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblwarning.Visible = false;
            if (Session["new"] != null)
            {
                


            }
            else
            {
                Response.Redirect("Default.aspx");
            }

        }
        protected void btnyes_Click(object sender, EventArgs e)
        {
            //clears the session 
            Session["new"] = "";

            //redirects back to the login screen for creating new session
            Response.Redirect("Login.aspx");
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

        //ckick event for deleting the books
        protected void btnYes_Click(object sender,EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Delete from Book where BOOKID='" + lblSelect.Text + "'", con);
                cmd.ExecuteNonQuery();
                GridView1.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
               lblSelect.Text = ex.ToString();
            }
        }

        //click event for adding the book into the database
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (txtBookName.Text != "" || txtBookStock.Text != "")
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString);
                Guid id = Guid.NewGuid();
                string authorid = ddAuthor.SelectedValue.ToString();
                string supplierid = ddSupplier.SelectedValue.ToString();
                string date = Calendar1.SelectedDate.ToString("yyyy-MM-dd");
                string booklevel = ddlBookLevel.SelectedValue.ToString();
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO BOOK VALUES(@ID,@BOOKNAME,@BOOKSTOCK,@BOOKLEVEL,@DATE,@AUTHORID,@SUPPLIERID,@MAXSTOCK)", con);
                    cmd.Parameters.AddWithValue("@ID", id.ToString());
                    cmd.Parameters.AddWithValue("@BOOKNAME", txtBookName.Text);
                    cmd.Parameters.AddWithValue("@BOOKSTOCK", txtBookStock.Text);
                    cmd.Parameters.AddWithValue("@BOOKLEVEL", booklevel);
                    cmd.Parameters.AddWithValue("@DATE", date);
                    cmd.Parameters.AddWithValue("@AUTHORID", authorid);
                    cmd.Parameters.AddWithValue("@SUPPLIERID", supplierid);
                    cmd.Parameters.AddWithValue("@MAXSTOCK", txtBookStock.Text);
                    cmd.ExecuteNonQuery();
                    GridView1.DataBind();
                    lblwarning.Visible = true;
                    lblwarning.Text = "New Book Added Successfully!";
                    clear();
                    con.Close();

                }
                catch (Exception ex)
                {
                    lblwarning.Visible = true;
                    lblwarning.Text = ex.ToString();
                }
            }
            else
            {
                lblwarning.Visible = true;
                lblwarning.Text = "Fields Cannot be left Empty!";
            }
        }

        //for clearing all the fields in the book entry page
        public void clear()
        {
            txtBookName.Text = "";
            txtBookStock.Text = "";
            ddlBookLevel.SelectedIndex = 0;
        }

        protected void btnNewAuthor_Click(object sender, EventArgs e)
        {
            Response.Redirect("Author.aspx");
        }

        protected void btnNewSupplier_Click(object sender, EventArgs e)
        {
            Response.Redirect("Supplier.aspx");
        }

        protected void txtBookName_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ddlBookLevel_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SupplierDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}