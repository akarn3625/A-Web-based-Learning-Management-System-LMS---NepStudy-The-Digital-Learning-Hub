using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NepStudy.Pages.Users
{
    public partial class CourseDetail : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["LMSConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                if (Request.QueryString["CourseId"] != null)
                {
                    int courseId;
                    if (int.TryParse(Request.QueryString["CourseId"], out courseId))
                    {
                        LoadCourseDetail(courseId);
                        LoadMaterials(courseId);
                    }
                    else
                    {
                        ShowError();
                    }
                }
                else
                {
                    ShowError();
                }
            }
        }

        private void LoadCourseDetail(int courseId)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT Title, Description, Instructor FROM Courses WHERE CourseId = @CourseId";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@CourseId", courseId);
                    con.Open();

                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblTitle.Text = reader["Title"].ToString();
                            lblDescription.Text = reader["Description"].ToString();
                            lblInstructor.Text = reader["Instructor"].ToString();

                            pnlCourseDetail.Visible = true;
                            pnlError.Visible = false;
                        }
                        else
                        {
                            ShowError();
                        }
                    }
                }
            }
        }

        private void LoadMaterials(int courseId)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT Title, MaterialType, Link FROM CourseMaterials WHERE CourseID = @CourseId";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@CourseId", courseId);
                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        rptMaterials.DataSource = dt;
                        rptMaterials.DataBind();
                    }
                }
            }
        }

        protected void rptMaterials_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView drv = (DataRowView)e.Item.DataItem;
                string materialType = drv["MaterialType"].ToString();
                string link = drv["Link"].ToString();
                PlaceHolder phMaterial = (PlaceHolder)e.Item.FindControl("phMaterial");

                if (materialType == "YouTube")
                {
                    phMaterial.Controls.Add(new LiteralControl($@"
                        <iframe width='560' height='315' src='{link}' frameborder='0' allowfullscreen></iframe>
                    "));
                }
                else if (materialType == "PDF")
                {
                    phMaterial.Controls.Add(new LiteralControl($@"
                        <embed src='{link}' type='application/pdf' width='100%' height='600px' />
                    "));
                }
            }
        }

        private void ShowError()
        {
            pnlCourseDetail.Visible = false;
            pnlError.Visible = true;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}