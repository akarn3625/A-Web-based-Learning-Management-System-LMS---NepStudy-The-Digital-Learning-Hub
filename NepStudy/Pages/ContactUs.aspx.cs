using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NepStudy.Pages.Admin
{
    public partial class EditCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Text = "";
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string subject = txtSubject.Text.Trim();
            string message = txtMessage.Text.Trim();

            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(subject) || string.IsNullOrEmpty(message))
            {
                lblMessage.CssClass = "text-danger";
                lblMessage.Text = "Please fill in all fields.";
                return;
            }

            try
            {
                // Send email logic - configure with your SMTP settings
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress(email);
                mail.To.Add("youradminemail@example.com"); // Change to your admin email
                mail.Subject = subject;
                mail.Body = $"Name: {name}\nEmail: {email}\n\nMessage:\n{message}";
                mail.IsBodyHtml = false;

                SmtpClient smtp = new SmtpClient("smtp.example.com"); // Replace with your SMTP server
                smtp.Port = 587; // Usually 587 for TLS
                smtp.Credentials = new NetworkCredential("smtpuser@example.com", "smtppassword"); // Your SMTP credentials
                smtp.EnableSsl = true;

                smtp.Send(mail);

                lblMessage.CssClass = "text-success";
                lblMessage.Text = "Thank you for contacting us! We will get back to you soon.";

                // Clear form
                txtName.Text = "";
                txtEmail.Text = "";
                txtSubject.Text = "";
                txtMessage.Text = "";
            }
            catch (Exception ex)
            {
                lblMessage.CssClass = "text-danger";
                lblMessage.Text = "Sorry, there was an error sending your message. Please try again later.";
                // Optionally log ex.Message somewhere
            }
        }
    }
}