using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NepStudy.Pages.Admin
{
    public partial class AdminDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check for Admin role in session
            if (Session["UserRole"] == null || Session["UserRole"].ToString() != "Admin")
            {
                Response.Redirect("~/Pages/Login.aspx");
            }

            if (!IsPostBack)
            {
                lblAdminName.Text = Session["UserFullName"]?.ToString() ?? "Admin";
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Pages/Landing.aspx");  
        }
    }
}