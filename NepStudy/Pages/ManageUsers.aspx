<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="NepStudy.Pages.ManageUsers" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Manage Users - LearnSphere</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .container {
            margin-top: 80px;
        }

        .message {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

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
        <div class="container">
            <h2>Manage Users</h2>

            <asp:Label ID="lblMessage" runat="server" CssClass="message text-danger"></asp:Label>

            <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"
                DataKeyNames="UserId"
                OnRowEditing="gvUsers_RowEditing"
                OnRowCancelingEdit="gvUsers_RowCancelingEdit"
                OnRowUpdating="gvUsers_RowUpdating"
                OnRowDeleting="gvUsers_RowDeleting"
                AllowPaging="True" PageSize="10" OnPageIndexChanging="gvUsers_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="UserId" HeaderText="ID" ReadOnly="True" />

                    <asp:TemplateField HeaderText="Full Name">
                        <ItemTemplate><%# Eval("FullName") %></ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFullName" runat="server" Text='<%# Bind("FullName") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate><%# Eval("Email") %></ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Password">
                        <ItemTemplate>••••••</ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPassword" runat="server" Text='<%# Bind("Password") %>' CssClass="form-control" TextMode="Password"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Role">
                        <ItemTemplate><%# Eval("Role") %></ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtRole" runat="server" Text='<%# Bind("Role") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>

            <h4>Add New User</h4>
            <div class="mb-3">
                <asp:TextBox ID="txtNewFullName" runat="server" CssClass="form-control mb-2" Placeholder="Full Name"></asp:TextBox>
                <asp:TextBox ID="txtNewEmail" runat="server" CssClass="form-control mb-2" Placeholder="Email"></asp:TextBox>
                <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control mb-2" Placeholder="Password" TextMode="Password"></asp:TextBox>
                <asp:DropDownList ID="ddlNewRole" runat="server" CssClass="form-select mb-2">
                    <asp:ListItem Text="Select Role" Value="" Disabled="True" Selected="True" />
                    <asp:ListItem Text="Student" Value="Student" />
                    <asp:ListItem Text="Admin" Value="Admin" />
                </asp:DropDownList>
                <asp:Button ID="btnAddUser" runat="server" Text="Add User" CssClass="btn btn-success" OnClick="btnAddUser_Click" />
            </div>
        </div>
    </form>
</body>
</html>
