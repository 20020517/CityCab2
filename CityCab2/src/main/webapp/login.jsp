<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login - Mega City Cab</title>

    <style>
        /* General Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: url('css/images/image3.jpg') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
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

        /* Login Form */
        .container {
            width: 350px;
            padding: 30px;
            background: rgba(0, 0, 0, 0.8);  /* Dark background for form */
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.4);
            text-align: center;
            margin-top: 120px;
        }

        .container h2 {
            color: #f8c529; /* Yellow color for heading */
            margin-bottom: 20px;
        }

        .input-box {
            width: 100%;
            margin: 10px 0;
        }

        .input-box input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            transition: 0.3s;
        }

        .input-box input:focus {
            border-color: #f8c529; /* Yellow border on focus */
            outline: none;
            box-shadow: 0 0 8px rgba(248, 197, 41, 0.5);
        }

        .login-btn {
            width: 100%;
            padding: 12px;
            background: #28a745; /* Green color for login button */
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        .login-btn:hover {
            background: #218838; /* Darker green on hover */
        }

        .back-link {
            display: inline-block;
            margin-top: 15px;
            color: #f8c529;
            text-decoration: none;
            font-size: 16px;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        /* Error Message */
        .error-message {
            color: red;
            font-size: 14px;
            margin-bottom: 10px;
        }

        /* Footer */
        footer {
            width: 100%;
            background: rgba(0, 0, 0, 0.7);  /* Dark footer background */
            text-align: center;
            padding: 10px 0;
            box-shadow: 0 -4px 10px rgba(0, 0, 0, 0.1);
            margin-top: auto;
            position: fixed;
            bottom: 0;
        }

        footer p {
            color: white;
            font-size: 14px;
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

            .container {
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

    <!-- LOGIN FORM -->
    <div class="container">
        <h2>User Login</h2>
        
        <%-- Display error message if login fails --%>
        <% if (request.getParameter("error") != null) { %>
            <p class="error-message">Invalid username or password!</p>
        <% } %>

        <form action="<%=request.getContextPath()%>/LoginServlet" method="post">
            <div class="input-box">
                <input type="text" name="username" placeholder="Username" required>
            </div>
            <div class="input-box">
                <input type="password" name="password" placeholder="Password" required>
            </div>
            <button type="submit" class="login-btn">Login</button>
        </form>

        <p>or <a href="register.jsp" class="back-link">Register</a></p>
    </div>

    <!-- FOOTER -->
    <footer>
        <p>&copy; 2025 Mega City Cab | All rights reserved.</p>
    </footer>

</body>
</html>
