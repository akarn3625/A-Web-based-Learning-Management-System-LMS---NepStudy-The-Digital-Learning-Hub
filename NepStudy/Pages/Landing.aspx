<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Landing.aspx.cs" Inherits="NepStudy.Pages.Admin.Landing" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>LearnSphere - Unlock Your Learning Potential</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="Styles/style.css" />
    <style>
        .hero {
            padding: 80px 0;
            background: #f8f9fa;
        }
        .feature-icon {
            font-size: 40px;
            color: #0d6efd;
        }
        .course-card img {
            height: 180px;
            object-fit: cover;
        }
        .testimonial {
            background: #ffffff;
            border: 1px solid #eaeaea;
            padding: 20px;
            border-radius: 10px;
        }
        .stats-section {
            background: #f8f9fa;
            padding: 60px 0;
            text-align: center;
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
            <a class="navbar-brand fw-bold text-primary" href="#">LearnSphere</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto me-3">
                    <li class="nav-item"><a class="nav-link" href="Index.aspx">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="ContactUs.aspx">Contact Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="About_Us.aspx">About</a></li>
                </ul>
                <a href="Login.aspx"  class="btn btn-outline-primary me-2">Login</a>
                <a href="Register.aspx"  class="btn btn-primary">Sign Up</a>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero mt-5 pt-5">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <h1 class="display-5 fw-bold">Unlock Your Learning Potential</h1>
                    <p class="lead">Modern education support resources, and flexible learning – all in one platform.</p>
                    <a href="Register.aspx" class="btn btn-primary btn-lg me-2">Get Started</a>
                    <a href="CourseList.aspx" class="btn btn-outline-secondary btn-lg">View Courses</a>
                </div>
                <div class="col-md-6 text-center">
                    <img src="Images/hero.png" alt="Hero Image" class="img-fluid">
                </div>
            </div>
        </div>
    </section>

    <!-- Why Choose Us -->
    <section class="py-5">
        <div class="container text-center">
            <h2 class="mb-4">Why Choose Our Platform</h2>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="feature-icon mb-2">🎓</div>
                    <h5>Comprehensive Curriculum</h5>
                    <p>Access structured, high-quality learning resources across different domains.</p>
                </div>
                <div class="col-md-4">
                    <div class="feature-icon mb-2">📜</div>
                    <h5>Recognized Certificates</h5>
                    <p>Get certified upon completion to enhance your resume and career.</p>
                </div>
                <div class="col-md-4">
                    <div class="feature-icon mb-2">🤝</div>
                    <h5>Supportive Community</h5>
                    <p>Join a thriving group of learners and mentors for help and guidance.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Explore Courses -->
    <section class="py-5 bg-light">
        <div class="container">
            <h2 class="mb-4 text-center">Explore Popular Courses</h2>
            <div class="row row-cols-1 row-cols-md-4 g-4">
                <div class="col">
                    <div class="card course-card h-100">
                        <img src="Images/course1.jpg" class="card-img-top" alt="Course">
                        <div class="card-body">
                            <h5 class="card-title">Complete Web Dev</h5>
                            <p class="card-text">HTML, CSS, JS, Bootstrap, and ASP.NET</p>
                            <span class="badge bg-success">4.8 ★</span>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card course-card h-100">
                        <img src="Images/course2.jpg" class="card-img-top" alt="Course">
                        <div class="card-body">
                            <h5 class="card-title">UI/UX Design Basics</h5>
                            <p class="card-text">Wireframes, Prototypes, Figma Tools</p>
                            <span class="badge bg-success">4.7 ★</span>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card course-card h-100">
                        <img src="Images/course3.jpg" class="card-img-top" alt="Course">
                        <div class="card-body">
                            <h5 class="card-title">Data Structures</h5>
                            <p class="card-text">Trees, Graphs, Sorting, and Searching</p>
                            <span class="badge bg-success">4.6 ★</span>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card course-card h-100">
                        <img src="Images/course4.jpg" class="card-img-top" alt="Course">
                        <div class="card-body">
                            <h5 class="card-title">Database Fundamentals</h5>
                            <p class="card-text">SQL, ERD, Relationships, Queries</p>
                            <span class="badge bg-success">4.5 ★</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Testimonials -->
    <section class="py-5">
        <div class="container text-center">
            <h2 class="mb-4">What Our Students Say</h2>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="testimonial">
                        <p>“The platform helped me upskill and land an internship. Very easy to use!”</p>
                        <h6>– Aayush K.</h6>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="testimonial">
                        <p>“Affordable and effective. The quizzes really helped test my knowledge.”</p>
                        <h6>– Nivedita D.</h6>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="testimonial">
                        <p>“Great content, clean design, and helpful instructors. Highly recommend it.”</p>
                        <h6>– Tanishq M.</h6>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Statistics -->
    <section class="stats-section">
        <div class="container">
            <div class="row g-4">
                <div class="col-md-3"><h2 class="fw-bold">10,000+</h2><p>Students</p></div>
                <div class="col-md-3"><h2 class="fw-bold">500+</h2><p>Courses</p></div>
                <div class="col-md-3"><h2 class="fw-bold">50+</h2><p>Expert Instructors</p></div>
                <div class="col-md-3"><h2 class="fw-bold">95%</h2><p>Satisfaction Rate</p></div>
            </div>
        </div>
    </section>

    <!-- Call to Action -->
    <section class="cta-section">
        <div class="container">
            <h2 class="mb-3">Ready to Begin Your Learning Journey?</h2>
            <p class="mb-4">Join thousands of students who are transforming their future with LearnSphere.</p>
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
                    <h5 class="text-white">Explore</h5>
                    <ul class="list-unstyled">
                        <li><a href="#">Courses</a></li>
                        <li><a href="#">Pricing</a></li>
                        <li><a href="#">Support</a></li>
                    </ul>
                </div>
                <div class="col-md-3 mb-4">
                    <h5 class="text-white">Legal</h5>
                    <ul class="list-unstyled">
                        <li><a href="#">Terms</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Cookies</a></li>
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