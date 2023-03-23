using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text.RegularExpressions;

namespace Kaiser_Library_Management_System
{
    public partial class frmLogin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BLOOD"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            lblbook.Visible = false;
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }
        protected void btnSearch_Click(object sender,EventArgs e)
        {
            this.BindGrid();
            
        }
        protected void BindGrid()
        {
            string val = txtSearch.Text.Trim();
            string choosetypeofsearch = DropDownList1.SelectedValue;
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [DONOR] WHERE [DONARNAME] LIKE  '%" + val + "%'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count>0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                lblbook.Visible = true;
                lblbook.Text = "Sorry! Search Not Found";
                lblbook.ForeColor = System.Drawing.Color.Red;
            }
            
            
        }
       
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].Text = Regex.Replace(e.Row.Cells[0].Text, txtSearch.Text.Trim(), delegate (Match match)
                {
                    return string.Format("<span style = 'background-color:#D9EDF7'>{0}</span>", match.Value);
                }, RegexOptions.IgnoreCase);
            }
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {

        }

        //protected void Searchbar_TextChanged(object sender, EventArgs e)
        //{
        //    string val = valTxtSearch.Text;
        //    if (val == "")
        //    {
        //        Response.Write("Please Provide Book Name");
        //    }
        //    else
        //    {
        //        con.Open();
        //        SqlDataAdapter da = new SqlDataAdapter("Select * from Book where BOOKNAME Like '" + val + "%'", con);
        //        DataTable dt = new DataTable();
        //        da.Fill(dt);
        //        GridView1.DataSource = dt;
        //        GridView1.DataBind();
        //        con.Close();
        //    }

        //}
    }
}