using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace Kaiser_Library_Management_System
{
    public partial class ReturnBook : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString);
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["new"] != null)
            {
               
                lblbook.Visible = false;
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string issueid = ddIssueList.SelectedValue;
            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("Select * from IssueTable where IssueID='"+issueid+"' ", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                txtIssueId.Text = dt.Rows[0][0].ToString();
                txtIssueDate.Text= dt.Rows[0][2].ToString();
                txtDueDate.Text = dt.Rows[0][4].ToString();
                txtMemberId.Text = dt.Rows[0][1].ToString();
                txtBookId.Text = dt.Rows[0][3].ToString();
                dt.Clear();
                con.Close();
            
               
            }
            catch(Exception ex)
            {
                lblbook.Visible = true;
                lblbook.Text = ex.ToString();
            }

        }

        protected void btnCalculateDue_Click(object sender, EventArgs e)
        {
            try
            {
                DateTime duedate = Convert.ToDateTime(txtDueDate.Text);
                if (calReturn.SelectedDate > duedate)
                {
                    txtDueFine.Text = "200";
                }
                else
                {
                    txtDueFine.Text = "0";
                }
            }
            catch(Exception ex)
            {
                lblbook.Visible = true;
                lblbook.Text = "Cannot Calculate Due Amount if there is no Isseu Date and Return Date Selected";
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Guid returnid = Guid.NewGuid();
            string issueid = txtIssueId.Text;
            string returndate = calReturn.SelectedDate.ToString("yyyy-MM-dd");
            string duefine = txtDueFine.Text;
            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("Select Book_Stock from Book Where BookID='" + txtBookId.Text + "'", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                int stockval = Convert.ToInt32(dt.Rows[0][0].ToString()) + 1;
                SqlCommand updatecommand = new SqlCommand("update Book set Book_Stock = " + stockval.ToString()+ " where BookID='" + txtBookId.Text + "'", con);
                updatecommand.ExecuteNonQuery();
                SqlCommand updateissuetable = new SqlCommand("Update IssueTable set  ReturnID='" + returnid.ToString() + "' where IssueId='"+txtIssueId.Text+"' ", con);
                updateissuetable.ExecuteNonQuery();
                SqlCommand insertcommand = new SqlCommand("Insert into ReturnTable values(@RETURNID,@ISSUEID,@RETURNDATE,@DUEFINE) ", con);
                insertcommand.Parameters.AddWithValue("@RETURNID",returnid.ToString());
                insertcommand.Parameters.AddWithValue("@ISSUEID",issueid);
                insertcommand.Parameters.AddWithValue("@RETURNDATE",returndate);
                insertcommand.Parameters.AddWithValue("@DUEFINE",duefine);
                insertcommand.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();
                lblbook.Visible = true;
                lblbook.Text = "Congrats!! Book Successfully Returned";
                clear();
                
            }
            catch(Exception ex)
            {
                lblbook.Visible = true;
                lblbook.Text = ex.ToString();
            }
        }
        private void clear()
        {
            txtBookId.Text = "";
            txtDueDate.Text = "";
            txtDueFine.Text = "0";
            txtIssueDate.Text = "";
            txtIssueId.Text = "";
            txtMemberId.Text = "";
            ddIssueList.SelectedIndex = 0;
        }
    }
}