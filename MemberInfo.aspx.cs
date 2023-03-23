using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Text.RegularExpressions;



namespace Kaiser_Library_Management_System
{
    public partial class MemberInfoaspx : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["new"] != null)
            {
                lblMember.Visible = false;
                if (!this.IsPostBack)
                {
                    lblMember.Visible = false;
                    this.BindGrid();
                }
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.BindGrid();
        }
      
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

        protected void BindGrid()
        {
            string val = ddlMember.SelectedValue;
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select * from IssueTable where IssueDate > getdate() -30 and MemberId='"+val+"'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                lblMember.Visible = true;
                lblMember.Text = "Sorry! The Member hasnot loaned any books in the past 31 days!";
                lblMember.ForeColor = System.Drawing.Color.Red;
            }


        }

    }
}