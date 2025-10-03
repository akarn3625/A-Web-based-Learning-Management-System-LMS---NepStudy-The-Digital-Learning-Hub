using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NepStudy.Pages.Users
{
    public partial class CourseList : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["LMSConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCourses();
            }
        }

        private void BindCourses()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT CourseId, Title, Description, Instructor FROM Courses";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    DataTable dt = new DataTable();
                    dt.Load(reader);

                    rptCourses.DataSource = dt;
                    rptCourses.DataBind();
                }
            }
        }

        protected void rptCourses_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                // Redirect to Course Detail page with selected CourseId in query string
                int courseId = Convert.ToInt32(e.CommandArgument);
                Response.Redirect($"CourseDetail.aspx?CourseId={courseId}");
            }
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Clear session and redirect to login page
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

    }
}