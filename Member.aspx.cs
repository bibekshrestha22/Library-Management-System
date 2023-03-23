using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Kaiser_Library_Management_System
{
    public partial class frmMember : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["new"]!=null)
            {
                lblInfo.Visible = false;
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

        protected void btnAddMember_Click(object sender, EventArgs e)
        {
            if (txtAddress.Text != "" || txtContact.Text != "" || txtMemberName.Text != "")
            {
                try
                {
                    Guid id = Guid.NewGuid();
                    string type = ddlType.SelectedValue.ToString();
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Insert into Member values(@ID,@NAME,@ADDRESS,@PHONE,@TYPE)", con);
                    cmd.Parameters.AddWithValue("@ID", id.ToString());
                    cmd.Parameters.AddWithValue("@NAME", txtMemberName.Text);
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                    cmd.Parameters.AddWithValue("@TYPE", type);
                    cmd.Parameters.AddWithValue("@PHONE", txtContact.Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    clear();
                    lblInfo.Visible = true;
                    lblInfo.Text = "New Member Successfully Added!";
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    lblInfo.Text = ex.ToString();
                }
            }
            else
            {
                lblInfo.Visible = true;
                lblInfo.Text = "Fields Cannot be Left Empty";
            }
        }
        private void clear()
        {
            txtAddress.Text = "";
            txtContact.Text = "";
            txtMemberName.Text = "";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}