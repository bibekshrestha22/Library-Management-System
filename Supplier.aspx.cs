using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kaiser_Library_Management_System
{
    public partial class frmSupplier : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["new"]!=null)
            {

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
    }
}