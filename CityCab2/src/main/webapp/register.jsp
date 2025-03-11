<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register | Mega City Cab</title>
    
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <!-- Custom Styles -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('css/images/image9.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
            justify-content: center;
            align-items: center;
            color: white;
        }

        /* Header */
        header {
            width: 100%;
            background: rgba(0, 0, 0, 0.7);  /* Dark background for header */
            padding: 15px 10%;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 100;
        }

        .logo {
            font-size: 30px;
            font-weight: bold;
            color: #f8c529; /* Yellow color for logo */
            letter-spacing: 1px;
        }

        nav ul {
            list-style: none;
            display: flex;
        }

        nav ul li {
            margin-left: 20px;
        }

        nav ul li a {
            text-decoration: none;
            color: white;
            font-size: 16px;
            font-weight: bold;
            transition: 0.3s;
        }

        nav ul li a:hover {
            color: #f8c529; /* Hover color for nav links */
        }

        /* Register Form */
        .register-container {
            width: 400px;
            background: rgba(0, 0, 0, 0.8);  /* Dark background for form */
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.4);
            text-align: center;
            margin-top: 120px;
        }

        .register-container h2 {
            color: #f8c529; /* Yellow color for heading */
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: 500;
        }

        .btn-register {
            background: #28a745; /* Green color for register button */
            color: white;
            font-weight: bold;
            transition: 0.3s;
        }

        .btn-register:hover {
            background: #218838; /* Darker green on hover */
        }

        /* Error message styling */
        .error-msg {
            color: red;
            text-align: center;
            font-weight: bold;
        }

        /* Footer Styling */
        .footer {
            width: 100%;
            background: rgba(0, 0, 0, 0.7); /* Dark footer background */
            color: white;
            text-align: center;
            padding: 15px 0;
            margin-top: auto;
            position: fixed;
            bottom: 0;
        }

        .footer a {
            color: #f8f9fa;
            text-decoration: none;
            margin: 0 15px;
            font-weight: 500;
            transition: 0.3s;
        }

        .footer a:hover {
            color: #ffcc00; /* Yellow color for footer links */
        }

        /* Responsive Design */
        @media screen and (max-width: 768px) {
            header {
                flex-direction: column;
                text-align: center;
            }

            nav ul {
                margin-top: 10px;
            }

            nav ul li {
                margin: 0 10px;
            }

            .register-container {
                width: 90%;
            }
        }
    </style>
</head>
<body>

<!-- HEADER -->
<header>
    <div class="logo">Mega City Cab</div>
    <nav>
        <ul>
            <li><a href="Home.jsp">Home</a></li>
            <li><a href="services.jsp">Services</a></li>
            <li><a href="contact.jsp">Contact</a></li>
        </ul>
    </nav>
</header>

<!-- REGISTER FORM -->
<div class="register-container">
    <h2>User Registration</h2>
    <form action="RegisterServlet" method="post">
        <div class="mb-3">
            <label class="form-label">Username</label>
            <input type="text" name="username" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Full Name</label>
            <input type="text" name="fullName" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Address</label>
            <input type="text" name="address" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">NIC</label>
            <input type="text" name="nic" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Phone Number</label>
            <input type="text" name="phoneNumber" class="form-control" required>
        </div>

        <button type="submit" class="btn btn-register w-100">Register</button>
    </form>

    <!-- Error Message Handling -->
    <% if (request.getParameter("error") != null) { %>
        <p class="error-msg mt-3">Registration failed. Please try again.</p>
    <% } %>
</div>




</body>
</html>
