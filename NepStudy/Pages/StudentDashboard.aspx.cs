using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NepStudy.Pages.Users
{
    public partial class StudentDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check for Student role in session
            if (Session["UserRole"] == null || Session["UserRole"].ToString() != "Student")
            {
                Response.Redirect("~/Pages/Login.aspx");
            }

            if (!IsPostBack)
            {
                lblStudentName.Text = Session["UserFullName"]?.ToString() ?? "Student";
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Pages/Landing.aspx");  // Adjust path if needed
        }
    }
}