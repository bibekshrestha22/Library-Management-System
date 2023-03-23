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
    public partial class tester : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void dataGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteData")
            {
                // Retrieve the row index stored in the CommandArgument property.
                int index = Convert.ToInt32(e.CommandArgument);

                // Retrieve the row that contains the button from the Rows collection.
                GridViewRow row = dataGrid.Rows[index];
                Label1.Text = row.Cells[0].Text;
            }
        }
        protected void btnYes_Click(object sender,EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString);
            try
            {
                
                con.Open();
                SqlCommand cmd = new SqlCommand("Delete from Book where BOOKID='" + Label1.Text + "'", con);
                cmd.ExecuteNonQuery();
                dataGrid.DataBind();
                con.Close();
            }
            catch(Exception ex)
            {
                Label1.Text = ex.ToString();
            }
        }

        protected void dataGrid_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}