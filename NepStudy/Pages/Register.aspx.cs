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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();
            string role = ddlRole.SelectedValue;
            bool agreed = chkAgree.Checked;

            // Basic validation
            if (string.IsNullOrEmpty(fullName) || string.IsNullOrEmpty(email) ||
                string.IsNullOrEmpty(password) || string.IsNullOrEmpty(confirmPassword) ||
                string.IsNullOrEmpty(role))
            {
                ShowMessage("Please fill all the fields.", isError: true);
                return;
            }

            if (!agreed)
            {
                ShowMessage("You must agree to the Terms & Privacy Policy.", isError: true);
                return;
            }

            if (password != confirmPassword)
            {
                ShowMessage("Passwords do not match.", isError: true);
                return;
            }

            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["LMSConnection"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    // Check if email already exists
                    string checkSql = "SELECT COUNT(*) FROM Users WHERE Email = @Email";
                    using (SqlCommand checkCmd = new SqlCommand(checkSql, conn))
                    {
                        checkCmd.Parameters.AddWithValue("@Email", email);
                        int count = (int)checkCmd.ExecuteScalar();
                        if (count > 0)
                        {
                            ShowMessage("Email already registered. Please use a different email.", isError: true);
                            return;
                        }
                    }

                    // Insert new user
                    string insertSql = @"INSERT INTO Users (FullName, Email, Password, Role) 
                                         VALUES (@FullName, @Email, @Password, @Role)";
                    using (SqlCommand insertCmd = new SqlCommand(insertSql, conn))
                    {
                        insertCmd.Parameters.AddWithValue("@FullName", fullName);
                        insertCmd.Parameters.AddWithValue("@Email", email);
                        insertCmd.Parameters.AddWithValue("@Password", password); // Hash password for production
                        insertCmd.Parameters.AddWithValue("@Role", role);

                        int rows = insertCmd.ExecuteNonQuery();
                        if (rows > 0)
                        {
                            ShowMessage("Registration successful! You can now login.", isError: false);
                            ClearForm();
                        }
                        else
                        {
                            ShowMessage("Registration failed. Please try again.", isError: true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage("An error occurred: " + ex.Message, isError: true);
            }
        }

        private void ShowMessage(string message, bool isError)
        {
            lblMessage.Text = message;
            lblMessage.ForeColor = isError ? System.Drawing.Color.Red : System.Drawing.Color.Green;
        }

        private void ClearForm()
        {
            txtFullName.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
            ddlRole.SelectedIndex = 0;
            chkAgree.Checked = false;
        }
    }
}