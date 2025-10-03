<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="NepStudy.Pages.Admin.AboutUs" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>About Us - LearnSphere</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .section-title {
            color: #0d6efd;
            font-weight: 600;
        }
        .value-card {
            background: #ffffff;
            border: 1px solid #eaeaea;
            padding: 20px;
            border-radius: 10px;
            height: 100%;
        }
        .team-img {
            border-radius: 50%;
            height: 100px;
            width: 100px;
            object-fit: cover;
        }
        .cta-section {
            background-color: #0d6efd;
            color: white;
            padding: 50px 0;
            text-align: center;
        }
        .footer {
            background: #212529;
            color: #adb5bd;
            padding: 40px 0;
        }
        .footer a {
            color: #adb5bd;
            text-decoration: none;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm fixed-top">
        <div class="container">
            <a class="navbar-brand fw-bold text-primary" href="Index.aspx">LearnSphere</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto me-3">
                    <li class="nav-item"><a class="nav-link" href="Landing.aspx">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="CourseList.aspx">Courses</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Resources</a></li>
                    <li class="nav-item"><a class="nav-link active" href="About.aspx">About</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Blog</a></li>
                </ul>
                <a href="Login.aspx" class="btn btn-outline-primary me-2">Login</a>
                <a href="Register.aspx" class="btn btn-primary">Sign Up</a>
            </div>
        </div>
    </nav>

    <!-- Hero Header -->
    <section class="py-5 mt-5 text-center bg-light">
        <div class="container">
            <h1 class="section-title mb-3">Our Mission is to Transform Education</h1>
            <p class="lead">LearnSphere brings accessible, affordable, and high-quality digital learning to every student, anywhere.</p>
            <img src="Images/about-hero.jpg" alt="Team Image" class="img-fluid mt-4 rounded">
        </div>
    </section>

    <!-- Vision Section -->
    <section class="py-5">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <img src="Images/vision.jpg" class="img-fluid rounded" alt="Vision">
                </div>
                <div class="col-md-6">
                    <h2 class="section-title mb-3">From Vision to Reality</h2>
                    <p>Our journey began with a simple question: how can we help more students learn better, faster, and cheaper? From humble beginnings to a fast-growing learning platform, our mission is guided by innovation, community, and purpose.</p>
                    <p>We believe in building future-ready learners and empowering them with the skills needed to thrive in a digital world.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Core Values -->
    <section class="py-5 bg-light">
        <div class="container text-center">
            <h2 class="section-title mb-4">What Guides Our Journey</h2>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="value-card">
                        <h5>Accessibility</h5>
                        <p>We provide open, flexible access to education for all learners, regardless of their background.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="value-card">
                        <h5>Community</h5>
                        <p>We foster collaboration, discussion, and mentorship within a thriving learning network.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="value-card">
                        <h5>Excellence</h5>
                        <p>Our materials and instructors are vetted for quality, relevance, and impact.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="value-card">
                        <h5>Innovation</h5>
                        <p>We embrace emerging tools, gamification, and modern pedagogy to keep learners engaged.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="value-card">
                        <h5>Impact</h5>
                        <p>We track learner progress and measure success through real-world results and feedback.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="value-card">
                        <h5>Integrity</h5>
                        <p>We uphold trust, privacy, and transparency in everything we do.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Leadership -->
    <section class="py-5 text-center">
        <div class="container">
            <h2 class="section-title mb-4">Meet Our Leadership</h2>
            <p class="mb-5">Our diverse, talented, and passionate team drives LearnSphere’s mission forward.</p>
            <div class="row g-4">
                <div class="col-md-3">
                    <img src="Images/team1.jpg" class="team-img mb-3" alt="Alex">
                    <h6>Alexandra Williams</h6>
                    <p class="text-muted">Co-Founder & CEO</p>
                </div>
                <div class="col-md-3">
                    <img src="Images/team2.jpg" class="team-img mb-3" alt="Michael">
                    <h6>Michael Chang</h6>
                    <p class="text-muted">Head of Product</p>
                </div>
                <div class="col-md-3">
                    <img src="Images/team3.jpg" class="team-img mb-3" alt="Sarah">
                    <h6>Sarah Johnson</h6>
                    <p class="text-muted">Marketing Director</p>
                </div>
                <div class="col-md-3">
                    <img src="Images/team4.jpg" class="team-img mb-3" alt="James">
                    <h6>James Rodriguez</h6>
                    <p class="text-muted">CTO</p>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA -->
    <section class="cta-section">
        <div class="container">
            <h2 class="mb-3">Ready to Begin Your Learning Journey?</h2>
            <p class="mb-4">Join thousands of students transforming their future through LearnSphere.</p>
            <a href="Register.aspx" class="btn btn-light btn-lg">Sign Up Now</a>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container text-center text-md-start">
            <div class="row">
                <div class="col-md-3 mb-4">
                    <h5 class="text-white">About</h5>
                    <ul class="list-unstyled">
                        <li><a href="#">Company Info</a></li>
                        <li><a href="#">Vision & Mission</a></li>
                        <li><a href="#">Careers</a></li>
                    </ul>
                </div>
                <div class="col-md-3 mb-4">
                    <h5 class="text-white">Resources</h5>
                    <ul class="list-unstyled">
                        <li><a href="#">Courses</a></li>
                        <li><a href="#">Blog</a></li>
                        <li><a href="#">Support</a></li>
                    </ul>
                </div>
                <div class="col-md-3 mb-4">
                    <h5 class="text-white">Legal</h5>
                    <ul class="list-unstyled">
                        <li><a href="#">Terms</a></li>
                        <li><a href="#">Privacy</a></li>
                        <li><a href="#">Accessibility</a></li>
                    </ul>
                </div>
                <div class="col-md-3 mb-4">
                    <h5 class="text-white">Newsletter</h5>
                    <form>
                        <input type="email" class="form-control mb-2" placeholder="Your email" />
                        <button class="btn btn-primary w-100" type="submit">Subscribe</button>
                    </form>
                </div>
            </div>
            <div class="text-center mt-3">
                <p class="mb-0">&copy; 2025 LearnSphere. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>