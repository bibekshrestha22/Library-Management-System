using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kaiser_Library_Management_System
{
    public partial class okay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Click(object sender, EventArgs e)
        {
            string id = GridView1.SelectedRow.Cells[0].Text.ToString();
            Label1.Text = id;
        }
    }
}