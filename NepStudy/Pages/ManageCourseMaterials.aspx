<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageCourseMaterials.aspx.cs" Inherits="NepStudy.Pages.ManageCourseMaterials" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Manage Course Materials - LearnSphere Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .container { margin-top: 80px; }
        .form-section { background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px #ddd; margin-bottom: 30px; }
        .error { color: red; }
    </style>
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

        <div class="container pt-5 mt-5">
            <h2>Manage Course Materials</h2>

            <asp:Label ID="lblMessage" runat="server" CssClass="text-success"></asp:Label>
            <asp:Label ID="lblError" runat="server" CssClass="text-danger"></asp:Label>

            <!-- Add/Edit Material Section with Select Course -->
            <div class="form-section">
                <h4>Add / Edit Material</h4>

                <asp:HiddenField ID="hfMaterialId" runat="server" />

                <!-- Select Course inside Add/Edit Material -->
                <div class="mb-3">
                    <label for="ddlCourses">Select Course:</label>
                    <asp:DropDownList ID="ddlCourses" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlCourses_SelectedIndexChanged" />
                </div>

                <div class="mb-3">
                    <label for="txtTitle" class="form-label">Title</label>
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <label for="ddlMaterialType" class="form-label">Material Type</label>
                    <asp:DropDownList ID="ddlMaterialType" runat="server" CssClass="form-select">
                        <asp:ListItem Text="Select Type" Value="" Disabled="True" Selected="True" />
                        <asp:ListItem Text="YouTube" Value="YouTube" />
                        <asp:ListItem Text="PDF" Value="PDF" />
                    </asp:DropDownList>
                </div>

                <div class="mb-3">
                    <label for="txtLink" class="form-label">YouTube Embed URL or PDF Link</label>
                    <asp:TextBox ID="txtLink" runat="server" CssClass="form-control" />
                </div>

                <asp:Button ID="btnSaveMaterial" runat="server" Text="Save Material" CssClass="btn btn-primary" OnClick="btnSaveMaterial_Click" />
                <asp:Button ID="btnCancelEdit" runat="server" Text="Cancel" CssClass="btn btn-secondary ms-2" OnClick="btnCancelEdit_Click" Visible="false" />
            </div>

            <!-- Materials List -->
            <h4 class="mt-4">Materials for Selected Course</h4>
            <asp:GridView ID="gvMaterials" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"
                DataKeyNames="MaterialID"
                OnRowEditing="gvMaterials_RowEditing"
                OnRowCancelingEdit="gvMaterials_RowCancelingEdit"
                OnRowUpdating="gvMaterials_RowUpdating"
                OnRowDeleting="gvMaterials_RowDeleting"
                AllowPaging="True" PageSize="10" OnPageIndexChanging="gvMaterials_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="MaterialID" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="Title" HeaderText="Title" />
                    <asp:BoundField DataField="MaterialType" HeaderText="Type" />
                    <asp:BoundField DataField="Link" HeaderText="Link" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>