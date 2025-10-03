<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseDetail.aspx.cs" Inherits="NepStudy.Pages.Users.CourseDetail" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Course Detail - LearnSphere</title>
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

            <asp:Panel ID="pnlCourseDetail" runat="server" Visible="false">
                <h2><asp:Label ID="lblTitle" runat="server" Text=""></asp:Label></h2>
                <p><strong>Instructor:</strong> <asp:Label ID="lblInstructor" runat="server" Text=""></asp:Label></p>
                <hr />
                <h4>Description</h4>
                <p><asp:Label ID="lblDescription" runat="server" Text=""></asp:Label></p>

                <hr />
                <h4>Study Materials</h4>
                <asp:Repeater ID="rptMaterials" runat="server" OnItemDataBound="rptMaterials_ItemDataBound">
                    <ItemTemplate>
                        <div class="mb-4">
                            <h5><%# Eval("Title") %></h5>
                            <asp:PlaceHolder ID="phMaterial" runat="server"></asp:PlaceHolder>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </asp:Panel>

            <asp:Panel ID="pnlError" runat="server" CssClass="alert alert-danger" Visible="false">
                <asp:Label ID="lblError" runat="server" Text="Course not found or invalid Course ID." />
            </asp:Panel>

            <a href="CourseList.aspx" class="btn btn-secondary mt-3">Back to Courses</a>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    </form>
</body>
</html>