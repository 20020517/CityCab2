<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        /* General Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            display: flex;
            min-height: 100vh;
            background: #f4f4f4;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background: url('css/images/image11.jpg') no-repeat center center fixed;
            background-size: cover;
            text-align: center;
        }

        h2 {
            color: #f8c529;
            font-size: 36px;
            margin-bottom: 20px;
        }

        p {
            color: white;
            font-size: 18px;
        }

        a {
            color: #f8c529;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s;
        }

        a:hover {
            color: #ffffff;
        }

        footer {
            width: 100%;
            background: rgba(0, 0, 0, 0.7);
            color: white;
            text-align: center;
            padding: 15px 0;
            margin-top: auto;
        }

        footer a {
            color: #f8f9fa;
            text-decoration: none;
            margin: 0 15px;
            font-weight: 500;
            transition: 0.3s;
        }

        footer a:hover {
            color: #ffcc00;
        }
    </style>
</head>
<body>

    <h2>You have been logged out successfully!</h2>
    <p><a href="login.jsp">Go to Login Page</a></p>

    <footer>
        <p>&copy; 2025 Mega City Cab | All Rights Reserved.</p>
        <p>
            <a href="index.jsp">Home</a> |
            <a href="about.jsp">About Us</a> |
            <a href="contact.jsp">Contact</a>
        </p>
    </footer>

</body>
</html>
