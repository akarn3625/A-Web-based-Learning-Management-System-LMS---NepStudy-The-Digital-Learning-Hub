using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NepStudy.Pages.Admin
{
    public partial class MangeCources : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["LMSConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] == null || Session["UserRole"].ToString() != "Admin")
            {
                Response.Redirect("~/Pages/Login.aspx");
            }

            if (!IsPostBack)
            {
                BindCourses();
                pnlEditCourse.Visible = false;
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

                    gvCourses.DataSource = dt;
                    gvCourses.DataBind();
                }
            }
        }

        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            pnlEditCourse.Visible = true;
            lblEditTitle.Text = "Add New Course";
            hfCourseId.Value = "";
            txtTitle.Text = "";
            txtDescription.Text = "";
            txtInstructor.Text = "";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            pnlEditCourse.Visible = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string title = txtTitle.Text.Trim();
            string description = txtDescription.Text.Trim();
            string instructor = txtInstructor.Text.Trim();

            if (string.IsNullOrEmpty(title))
            {
                // Add validation message or alert here if you want
                return;
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query;
                if (string.IsNullOrEmpty(hfCourseId.Value))
                {
                    // Insert new course
                    query = "INSERT INTO Courses (Title, Description, Instructor) VALUES (@Title, @Description, @Instructor)";
                }
                else
                {
                    // Update existing course
                    query = "UPDATE Courses SET Title=@Title, Description=@Description, Instructor=@Instructor WHERE CourseId=@CourseId";
                }

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Title", title);
                    cmd.Parameters.AddWithValue("@Description", description);
                    cmd.Parameters.AddWithValue("@Instructor", instructor);

                    if (!string.IsNullOrEmpty(hfCourseId.Value))
                    {
                        cmd.Parameters.AddWithValue("@CourseId", Convert.ToInt32(hfCourseId.Value));
                    }

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            pnlEditCourse.Visible = false;
            BindCourses();
        }

        protected void gvCourses_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            int courseId = Convert.ToInt32(gvCourses.DataKeys[e.NewEditIndex].Value);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT Title, Description, Instructor FROM Courses WHERE CourseId=@CourseId";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@CourseId", courseId);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        pnlEditCourse.Visible = true;
                        lblEditTitle.Text = "Edit Course";
                        hfCourseId.Value = courseId.ToString();
                        txtTitle.Text = reader["Title"].ToString();
                        txtDescription.Text = reader["Description"].ToString();
                        txtInstructor.Text = reader["Instructor"].ToString();
                    }
                }
            }
            e.Cancel = true; // prevent GridView edit mode
        }

        protected void gvCourses_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            gvCourses.EditIndex = -1;
            BindCourses();
        }

        protected void gvCourses_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            // Handled by btnSave_Click, so cancel GridView update
            gvCourses.EditIndex = -1;
            BindCourses();
        }

        protected void gvCourses_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int courseId = Convert.ToInt32(gvCourses.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Courses WHERE CourseId=@CourseId";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@CourseId", courseId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            BindCourses();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Pages/Login.aspx");
        }
    }
}