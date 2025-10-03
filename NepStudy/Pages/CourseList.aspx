<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseList.aspx.cs" Inherits="NepStudy.Pages.Users.CourseList" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Course List - LearnSphere</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
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



        <div class="container mt-5 pt-5">
            <h2 class="mb-4">Available Courses</h2>

            <asp:Repeater ID="rptCourses" runat="server" OnItemCommand="rptCourses_ItemCommand">
                <ItemTemplate>
                    <div class="card mb-3 shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title"><%# Eval("Title") %></h5>
                            <p class="card-text"><%# Eval("Description") %></p>
                            <p class="card-text"><small class="text-muted">Instructor: <%# Eval("Instructor") %></small></p>
                            <asp:Button ID="btnView" runat="server" Text="View Details" CommandName="View" CommandArgument='<%# Eval("CourseId") %>' CssClass="btn btn-primary" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>
