using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NepStudy.Pages
{
    public partial class ManageCourseMaterials : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["LMSConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCourses();
                btnCancelEdit.Visible = false;
                lblMessage.Text = "";
                lblError.Text = "";
            }
        }

        private void LoadCourses()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT CourseID, Title FROM Courses ORDER BY Title";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    ddlCourses.DataSource = cmd.ExecuteReader();
                    ddlCourses.DataTextField = "Title";
                    ddlCourses.DataValueField = "CourseID";
                    ddlCourses.DataBind();
                }
            }
            ddlCourses.Items.Insert(0, new ListItem("Select Course", ""));
        }

        protected void ddlCourses_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            lblError.Text = "";
            hfMaterialId.Value = "";
            ClearForm();

            if (!string.IsNullOrEmpty(ddlCourses.SelectedValue))
            {
                LoadMaterials(int.Parse(ddlCourses.SelectedValue));
            }
            else
            {
                gvMaterials.DataSource = null;
                gvMaterials.DataBind();
            }
        }

        private void LoadMaterials(int courseId)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT MaterialID, Title, MaterialType, Link FROM CourseMaterials WHERE CourseID = @CourseID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@CourseID", courseId);
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);
                        gvMaterials.DataSource = dt;
                        gvMaterials.DataBind();
                    }
                }
            }
        }

        protected void gvMaterials_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvMaterials.EditIndex = e.NewEditIndex;
            if (!string.IsNullOrEmpty(ddlCourses.SelectedValue))
            {
                LoadMaterials(int.Parse(ddlCourses.SelectedValue));
            }
        }

        protected void gvMaterials_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvMaterials.EditIndex = -1;
            if (!string.IsNullOrEmpty(ddlCourses.SelectedValue))
            {
                LoadMaterials(int.Parse(ddlCourses.SelectedValue));
            }
        }

        protected void gvMaterials_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int materialId = Convert.ToInt32(gvMaterials.DataKeys[e.RowIndex].Value);
            GridViewRow row = gvMaterials.Rows[e.RowIndex];

            string title = ((TextBox)row.Cells[1].Controls[0]).Text.Trim();
            string materialType = ((TextBox)row.Cells[2].Controls[0]).Text.Trim();
            string link = ((TextBox)row.Cells[3].Controls[0]).Text.Trim();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "UPDATE CourseMaterials SET Title=@Title, MaterialType=@MaterialType, Link=@Link WHERE MaterialID=@MaterialID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Title", title);
                    cmd.Parameters.AddWithValue("@MaterialType", materialType);
                    cmd.Parameters.AddWithValue("@Link", link);
                    cmd.Parameters.AddWithValue("@MaterialID", materialId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            gvMaterials.EditIndex = -1;

            if (!string.IsNullOrEmpty(ddlCourses.SelectedValue))
            {
                LoadMaterials(int.Parse(ddlCourses.SelectedValue));
            }

            lblMessage.Text = "Material updated successfully.";
        }

        protected void gvMaterials_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int materialId = Convert.ToInt32(gvMaterials.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM CourseMaterials WHERE MaterialID=@MaterialID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@MaterialID", materialId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            if (!string.IsNullOrEmpty(ddlCourses.SelectedValue))
            {
                LoadMaterials(int.Parse(ddlCourses.SelectedValue));
            }

            lblMessage.Text = "Material deleted successfully.";
        }

        protected void btnSaveMaterial_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            lblError.Text = "";

            if (string.IsNullOrEmpty(ddlCourses.SelectedValue))
            {
                lblError.Text = "Please select a course.";
                return;
            }

            if (string.IsNullOrWhiteSpace(txtTitle.Text))
            {
                lblError.Text = "Please enter a title.";
                return;
            }

            if (ddlMaterialType.SelectedValue == "")
            {
                lblError.Text = "Please select a material type.";
                return;
            }

            if (string.IsNullOrWhiteSpace(txtLink.Text))
            {
                lblError.Text = "Please enter a valid link.";
                return;
            }

            int courseId = int.Parse(ddlCourses.SelectedValue);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query;
                SqlCommand cmd;

                if (string.IsNullOrEmpty(hfMaterialId.Value)) // Insert new
                {
                    query = "INSERT INTO CourseMaterials (CourseID, Title, MaterialType, Link) VALUES (@CourseID, @Title, @MaterialType, @Link)";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@CourseID", courseId);
                }
                else // Update existing
                {
                    query = "UPDATE CourseMaterials SET Title=@Title, MaterialType=@MaterialType, Link=@Link WHERE MaterialID=@MaterialID";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@MaterialID", int.Parse(hfMaterialId.Value));
                }

                cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
                cmd.Parameters.AddWithValue("@MaterialType", ddlMaterialType.SelectedValue);
                cmd.Parameters.AddWithValue("@Link", txtLink.Text.Trim());

                con.Open();
                cmd.ExecuteNonQuery();
            }

            lblMessage.Text = string.IsNullOrEmpty(hfMaterialId.Value) ? "Material added successfully." : "Material updated successfully.";

            hfMaterialId.Value = "";
            ClearForm();
            LoadMaterials(courseId);
            btnCancelEdit.Visible = false;
        }

        protected void btnCancelEdit_Click(object sender, EventArgs e)
        {
            hfMaterialId.Value = "";
            ClearForm();
            btnCancelEdit.Visible = false;
        }

        private void ClearForm()
        {
            txtTitle.Text = "";
            ddlMaterialType.SelectedIndex = 0;
            txtLink.Text = "";
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        protected void gvMaterials_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMaterials.PageIndex = e.NewPageIndex;
            if (!string.IsNullOrEmpty(ddlCourses.SelectedValue))
            {
                LoadMaterials(int.Parse(ddlCourses.SelectedValue));
            }
        }
    }
}