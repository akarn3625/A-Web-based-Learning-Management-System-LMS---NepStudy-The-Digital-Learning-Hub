<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs" Inherits="NepStudy.Pages.Users.StudentDashboard" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Student Dashboard - LearnSphere</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body { padding-top: 70px; background: #f8f9fa; }
        .welcome-text { margin-bottom: 30px; }
        .dashboard-card {
            border-radius: 10px; box-shadow: 0 0 15px rgba(0,0,0,0.1); padding: 30px; background: #fff; text-align: center;
            transition: box-shadow 0.3s ease;
        }
        .dashboard-card:hover { box-shadow: 0 0 25px rgba(0,0,0,0.2); }
        .dashboard-card h3 { margin-bottom: 15px; color: #0d6efd; }
        .dashboard-link { text-decoration: none; color: #0d6efd; font-weight: 600; }
        .dashboard-link:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-dark bg-success fixed-top shadow">
            <div class="container">
                <a class="navbar-brand" href="StudentDashboard.aspx">LearnSphere Student</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarStudent" aria-controls="navbarStudent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarStudent">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link active" href="StudentDashboard.aspx">Dashboard</a></li>
                        <li class="nav-item"><a class="nav-link" href="CourseList.aspx">Courses</a></li>
                        <li class="nav-item">
                            <asp:LinkButton ID="btnLogout" runat="server" CssClass="nav-link" OnClick="btnLogout_Click">Logout</asp:LinkButton>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container mt-5">
            <h1 class="welcome-text">Welcome, <asp:Label ID="lblStudentName" runat="server" /></h1>
            <div class="row g-4">
                <div class="col-md-6">
                    <div class="dashboard-card">
                        <h3>Your Courses</h3>
                        <p>View the courses you are enrolled in.</p>
                        <a href="CourseList.aspx" class="dashboard-link">View Courses</a>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="dashboard-card">
                        <h3>Profile</h3>
                        <p>Manage your profile information and settings.</p>
                        <a href="Profile.aspx" class="dashboard-link">Edit Profile</a>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>