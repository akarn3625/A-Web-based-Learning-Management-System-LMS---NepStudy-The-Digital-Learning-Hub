<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MangeCources.aspx.cs" Inherits="NepStudy.Pages.Admin.MangeCources" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Manage Courses - LearnSphere Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top shadow">
    <div class="container">
        <a class="navbar-brand" href="AdminDashboard.aspx">LearnSphere Admin</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarAdmin" aria-controls="navbarAdmin" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarAdmin">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link active" href="AdminDashboard.aspx">Dashboard</a></li>
                <li class="nav-item"><a class="nav-link" href="ManageCourses.aspx">Manage Courses</a></li>
                <li class="nav-item"><a class="nav-link" href="ManageCourseMaterials.aspx">Manage Materials</a></li>
                <li class="nav-item"><a class="nav-link" href="ManageUsers.aspx">Manage Users</a></li>
                <li class="nav-item">
                    <asp:LinkButton ID="btnLogout" runat="server" CssClass="nav-link" OnClick="btnLogout_Click">Logout</asp:LinkButton>
                </li>
            </ul>
        </div>
    </div>
</nav>

        <div class="container mt-5 pt-5">
            <h2>Manage Courses</h2>
            <asp:Button ID="btnAddNew" runat="server" Text="Add New Course" CssClass="btn btn-success mb-3" OnClick="btnAddNew_Click" />

            <asp:GridView ID="gvCourses" runat="server" AutoGenerateColumns="False" CssClass="table table-striped"
                OnRowEditing="gvCourses_RowEditing" OnRowCancelingEdit="gvCourses_RowCancelingEdit"
                OnRowUpdating="gvCourses_RowUpdating" OnRowDeleting="gvCourses_RowDeleting" DataKeyNames="CourseId">
                <Columns>
                    <asp:BoundField DataField="CourseId" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="Title" HeaderText="Title" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="Instructor" HeaderText="Instructor" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-sm btn-primary me-2"></asp:LinkButton>
                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-sm btn-danger" OnClientClick="return confirm('Are you sure to delete this course?');"></asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="lnkUpdate" runat="server" CommandName="Update" Text="Update" CssClass="btn btn-sm btn-success me-2"></asp:LinkButton>
                            <asp:LinkButton ID="lnkCancel" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-sm btn-secondary"></asp:LinkButton>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <!-- Panel for Adding or Editing -->
            <asp:Panel ID="pnlEditCourse" runat="server" CssClass="border p-4 mt-4 bg-white shadow" Visible="false">
                <h3><asp:Label ID="lblEditTitle" runat="server" Text="Add New Course"></asp:Label></h3>

                <asp:HiddenField ID="hfCourseId" runat="server" />

                <div class="mb-3">
                    <asp:Label ID="lblTitle" runat="server" Text="Course Title" AssociatedControlID="txtTitle"></asp:Label>
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <asp:Label ID="lblDescription" runat="server" Text="Course Description" AssociatedControlID="txtDescription"></asp:Label>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" />
                </div>
                <div class="mb-3">
                    <asp:Label ID="lblInstructor" runat="server" Text="Instructor" AssociatedControlID="txtInstructor"></asp:Label>
                    <asp:TextBox ID="txtInstructor" runat="server" CssClass="form-control" />
                </div>

                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary ms-2" OnClick="btnCancel_Click" />
            </asp:Panel>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>