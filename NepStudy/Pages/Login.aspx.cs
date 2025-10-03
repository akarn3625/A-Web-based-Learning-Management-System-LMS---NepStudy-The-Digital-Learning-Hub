using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NepStudy.Pages.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            string connStr = ConfigurationManager.ConnectionStrings["LMSConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "SELECT UserID, FullName, Role FROM Users WHERE Email=@Email AND Password=@Password";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    reader.Read();

                    // Save user info in session
                    Session["UserID"] = reader["UserID"].ToString();
                    Session["FullName"] = reader["FullName"].ToString();
                    Session["UserRole"] = reader["Role"].ToString();

                    // Redirect based on role
                    if (Session["UserRole"].ToString() == "Admin")
                    {
                        Response.Redirect("~/Pages/AdminDashboard.aspx");
                    }
                    else if (Session["UserRole"].ToString() == "Student")
                    {
                        Response.Redirect("~/Pages/StudentDashboard.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Your user role is not recognized.";
                    }
                }
                else
                {
                    lblMessage.Text = "Invalid email or password.";
                }
            }
        }
    }
}