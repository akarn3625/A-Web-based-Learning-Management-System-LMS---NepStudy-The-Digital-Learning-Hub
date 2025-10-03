<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="NepStudy.Pages.Admin.Register" %>

<<!DOCTYPE html>
<html>
<head runat="server">
    <title>Sign Up - LearnSphere</title>
    <meta charset="UTF-8" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background: #eaf4ff;
        }
        .left-panel {
            height: 100vh;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .left-panel img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
        }
        .form-panel {
            display: flex;
            align-items: center;
            justify-content: center;
            height: calc(100vh - 70px);
            padding: 40px;
        }
        .form-box {
            background: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.08);
            width: 100%;
            max-width: 500px;
        }
        .form-box h3 {
            color: #0d6efd;
        }
        .terms-link {
            color: #0d6efd;
            text-decoration: underline;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm fixed-top">
            <div class="container">
                <a class="navbar-brand fw-bold text-primary" href="Index.aspx">LearnSphere</a>
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav ms-auto me-3">
                        <li class="nav-item"><a class="nav-link" href="Landing.aspx">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="CourseList.aspx">Courses</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Resources</a></li>
                        <li class="nav-item"><a class="nav-link" href="About.aspx">About</a></li>
                    </ul>
                    <a href="Login.aspx" class="btn btn-outline-primary me-2">Log In</a>
                    <a href="Register.aspx" class="btn btn-primary">Sign Up</a>
                </div>
            </div>
        </nav>

        <!-- Main Section -->
        <div class="container-fluid pt-5">
            <div class="row">
                <div class="col-md-6 left-panel d-none d-md-flex">
                    <img src="Images/register-side.jpg" alt="Register Illustration" />
                </div>

                <div class="col-md-6 form-panel">
                    <div class="form-box">
                        <h3 class="fw-bold mb-3">Create Your Account</h3>
                        <p class="text-muted mb-4">Join thousands of learners and unlock your full potential.</p>

                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control mb-3" Placeholder="Full Name" />
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control mb-3" Placeholder="Email" TextMode="Email" />
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control mb-3" Placeholder="Password" TextMode="Password" />
                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control mb-3" Placeholder="Confirm Password" TextMode="Password" />
                        <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-select mb-3">
                            <asp:ListItem Text="Select Role" Value="" Disabled="True" Selected="True" />
                            <asp:ListItem Text="Student" Value="Student" />
                            <asp:ListItem Text="Admin" Value="Admin" />
                        </asp:DropDownList>
                        

                        <div class="form-check mb-3">
                            <asp:CheckBox ID="chkAgree" runat="server" CssClass="form-check-input" />
                            <label class="form-check-label" for="chkAgree">
                                I agree to the <span class="terms-link">Terms & Privacy Policy</span>
                            </label>
                        </div>

                        <asp:Button ID="btnRegister" runat="server" Text="Sign Up" CssClass="btn btn-primary w-100 mb-3" OnClick="btnRegister_Click" />

                        <asp:Label ID="lblMessage" runat="server" CssClass="text-center d-block mb-3" />

                        <p class="text-center">Already have an account? <a href="Login.aspx" class="text-decoration-none text-primary">Login</a></p>
                    </div>
                </div>
            </div>
        </div>

    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>