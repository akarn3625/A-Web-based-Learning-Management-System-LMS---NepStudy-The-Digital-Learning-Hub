using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NepStudy.Pages
{
    public partial class Profile : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["LMSConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProfile();
                lblMessage.Text = "";
                lblError.Text = "";
            }
        }

        private void LoadProfile()
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            int userId = Convert.ToInt32(Session["UserID"]);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT FullName, Email FROM Users WHERE UserID = @UserID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        txtName.Text = reader["FullName"].ToString();
                        txtEmail.Text = reader["Email"].ToString();
                    }
                    else
                    {
                        lblError.Text = "Profile not found.";
                    }
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            lblError.Text = "";

            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            string fullName = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;

            if (string.IsNullOrEmpty(fullName))
            {
                lblError.Text = "Full Name is required.";
                return;
            }

            if (string.IsNullOrEmpty(email))
            {
                lblError.Text = "Email Address is required.";
                return;
            }

            if (!string.IsNullOrEmpty(password) || !string.IsNullOrEmpty(confirmPassword))
            {
                if (password != confirmPassword)
                {
                    lblError.Text = "Passwords do not match.";
                    return;
                }
            }

            int userId = Convert.ToInt32(Session["UserID"]);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query;

                if (!string.IsNullOrEmpty(password))
                {
                    // Update with new password (hash it in real apps)
                    query = "UPDATE Users SET FullName=@FullName, Email=@Email, Password=@Password WHERE UserID=@UserID";
                }
                else
                {
                    // Update without password change
                    query = "UPDATE Users SET FullName=@FullName, Email=@Email WHERE UserID=@UserID";
                }

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@FullName", fullName);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@UserID", userId);

                    if (!string.IsNullOrEmpty(password))
                    {
                        cmd.Parameters.AddWithValue("@Password", password);
                    }

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            lblMessage.Text = "Profile updated successfully.";
            ClearPasswords();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            LoadProfile();
            ClearPasswords();
            lblMessage.Text = "";
            lblError.Text = "";
        }

        private void ClearPasswords()
        {
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}