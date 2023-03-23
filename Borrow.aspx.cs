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
    public partial class frmIssueBook : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["new"] != null)
            {
                lblInfo.Visible = false;
                lblMoreInfo.Visible = false;
            }
            else
            {
                Response.Redirect("Default.aspx");
            }

        }
        protected void btnyes_Click(object sender,EventArgs e)
        {
            Session["new"] = "";
            Response.Redirect("Default.aspx");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string bid = ddlBook.SelectedValue.ToString();
            string mid = ddlMember.SelectedValue.ToString();
            string issuedate = calIssue.SelectedDate.ToString("yyyy-MM-dd");
            string duedate = calDue.SelectedDate.ToString("yyyy-MM-dd");
           int count = Convert.ToInt32(txtBookCount.Text);
            try
            {
                if (ddlBook.SelectedValue == "" || ddlBook.SelectedValue == "" || calDue.SelectedDate == null || calIssue.SelectedDate == null || txtMemberName.Text == "")
                {
                    lblInfo.Text = "Missing Fields";
                }
                else
                {
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter("Select Book_Level from Book where BookID='"+bid+"'", con);
                    SqlDataAdapter da1 = new SqlDataAdapter("Select Member_Type from Member where MemberId='"+mid+"'  ", con);
                    DataTable dt = new DataTable();
                    DataTable dt1 = new DataTable();
                    da.Fill(dt);
                    da1.Fill(dt1);
                    string booklevel = dt.Rows[0][0].ToString();
                    string membertype = dt1.Rows[0][0].ToString();
                    con.Close();
                    if (membertype == "Gold" && booklevel=="Normal")
                    {
                        if (count > 3)
                        {
                            lblInfo.Visible = true;
                            lblInfo.Text = "This member is not allowed to borrow any more books!";
                        }
                        else
                        {
                            insert();
                            lblMoreInfo.Visible = true;
                            lblMoreInfo.Text = "Done with normal book @ Gold User";
                        }
                    }
                    else if(membertype=="Gold" && booklevel=="Gold")
                    {
                        if (count > 3)
                        {
                            lblInfo.Visible = true;
                            lblInfo.Text = "This member is not allowed to borrow any more books!";
                        }
                        else
                        {
                            insert();
                            lblMoreInfo.Visible = true;
                            lblMoreInfo.Text = "Done with Gold book @ Gold User";
                        }
                    }
                    else if (membertype=="Sliver" && booklevel =="Sliver")
                    {
                        if (count < 2)
                        {
                            insert();
                            lblMoreInfo.Visible = true;
                            lblMoreInfo.Text = "Done with Sliver level book @ Sliver Level Member";
                        }
                        else
                        {
                            
                            lblInfo.Visible = true;
                            lblInfo.Text = "This member is not allowed to borrow any more books!";
                        }
                    }
                    else
                    {
                        lblInfo.Visible = true;
                        lblInfo.Text = "Please Make Sure that the member is of Gold Type";
                    }

                }
            }
            catch(Exception ex)
            {
                lblInfo.Text = ex.ToString();
            }
        }
        private void insert()
        {
            string bid = ddlBook.SelectedValue.ToString();
            string mid = ddlMember.SelectedValue.ToString();
            string issuedate = calIssue.SelectedDate.ToString("yyyy-MM-dd");
            string duedate = calDue.SelectedDate.ToString("yyyy-MM-dd");
            string returnid = "Not Returned Yet";
            Guid issueid = Guid.NewGuid();
            con.Open();
            SqlCommand insertcommand = new SqlCommand("Insert into IssueTable Values(@ISSUEID,@MEMBERID,@ISSUEDATE,@BOOKID,@DUEDATE,@RETURNID)",con);
            insertcommand.Parameters.AddWithValue("@ISSUEID", issueid.ToString());
            insertcommand.Parameters.AddWithValue("@MEMBERID", mid);
            insertcommand.Parameters.AddWithValue("@ISSUEDATE", issuedate);
            insertcommand.Parameters.AddWithValue("@BOOKID", bid);
            insertcommand.Parameters.AddWithValue("@DUEDATE", duedate);
            insertcommand.Parameters.AddWithValue("@RETURNID", returnid);
            insertcommand.ExecuteNonQuery();
            SqlDataAdapter stock = new SqlDataAdapter("Select Book_Stock from Book where BookID='"+bid+"'", con);
            DataTable stockval = new DataTable();
            stock.Fill(stockval);
            int stockvalue =Convert.ToInt32(stockval.Rows[0][0].ToString())-1;
            SqlCommand updatecommand = new SqlCommand("update book set Book_Stock = "+ stockvalue.ToString() + " where BookID='"+bid+"'", con);
            updatecommand.ExecuteNonQuery();
            con.Close();
            GridView1.DataBind();
            lblInfo.Visible = true;
            lblInfo.Text = "Issue Recorded Successfully With:";
          
        }

        protected void btnShowMemberName_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                string mid = ddlMember.SelectedValue.ToString();
                SqlDataAdapter da = new SqlDataAdapter("Select MemberName from Member where MemberId='"+mid+"' ", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                txtMemberName.Text = dt.Rows[0][0].ToString();
                dt.Clear();
                con.Close();
                count(); 
            }
            catch(Exception ex)
            {
                lblInfo.Visible = true;
                lblInfo.Text = ex.ToString();
            }
        }

        private void count()
        {
            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("select count(*) from IssueTable where MemberId ='" + ddlMember.SelectedValue.ToString() +"' and ReturnID='Not Returned Yet' ", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                int count = Convert.ToInt32(dt.Rows[0][0].ToString());
                txtBookCount.Text = count.ToString();
                con.Close();
                

            }
            catch(Exception ex)
            {
                lblInfo.Visible = true;
                lblInfo.Text = ex.ToString();
            }


        }
    }
}