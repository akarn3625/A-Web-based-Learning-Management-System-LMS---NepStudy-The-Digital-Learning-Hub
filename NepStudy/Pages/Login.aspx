
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="NepStudy.Pages.Admin.Login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Login - LearnSphere</title>
    <meta charset="UTF-8" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
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
            max-width: 400px;
            width: 100%;
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
                    <img src="Images/login-side.jpg" alt="Login Illustration" />
                </div>

                <div class="col-md-6 form-panel">
                    <div class="form-box">
                        <h3 class="text-primary fw-bold mb-3">Welcome Back</h3>
                        <p class="text-muted">Login to continue your learning journey</p>

                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control mb-3" Placeholder="Email" TextMode="Email" />
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control mb-3" Placeholder="Password" TextMode="Password" />

                        <div class="d-flex justify-content-between mb-3">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="rememberMe" />
                                <label class="form-check-label" for="rememberMe">Remember me</label>
                            </div>
                            <a href="#" class="small text-decoration-none">Forgot?</a>
                        </div>

                        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary w-100 mb-3" OnClick="btnLogin_Click" />

                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" CssClass="text-center d-block mb-3"></asp:Label>

                        <p class="text-center">Don't have an account? <a href="Register.aspx" class="text-decoration-none text-primary">Sign up</a></p>
                    </div>
                </div>
            </div>
        </div>

    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
