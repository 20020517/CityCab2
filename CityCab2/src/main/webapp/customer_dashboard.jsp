<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, model.Booking" %>

<!DOCTYPE html>
<html>
<head>
    <title>Customer Dashboard - Mega City Cab</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
             background: url('css/images/image13.jpg') no-repeat center center fixed;
    background-size: cover;
        }
        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
        }
        .sidebar {
            background: #007BFF;
            color: white;
            width: 20%;
            height: 100vh;
            float: left;
            padding-top: 20px;
            position: fixed;
        }
        .sidebar h2 {
            text-align: center;
            font-size: 22px;
            margin-bottom: 20px;
        }
        .sidebar a {
            display: block;
            color: white;
            padding: 10px;
            text-decoration: none;
            font-size: 16px;
        }
        .sidebar a:hover {
            background: #0056b3;
        }
        .main-content {
            margin-left: 22%;
            padding: 20px;
        }
        .card {
            background: white;
            padding: 20px;
            margin: 10px 0;
            border-radius: 5px;
            box-shadow: 0px 0px 10px 0px #aaa;
            text-align: center;
        }
        .card h3 {
            margin-bottom: 10px;
        }
        .card button {
            background: #28a745;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .card button:hover {
            background: #218838;
        }
        .logout-btn {
            background: red;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            float: right;
            margin: 10px;
        }
    </style>
</head>
<body>

    <!-- Sidebar Navigation -->
    <div class="sidebar">
        <h2>Customer Panel</h2>
        <a href="register.jsp">Register / Login</a>
        <a href="book_cab.jsp">Book a Cab</a>
        <a href="viewbookings.jsp">View Booking Details</a>
        
        <a href="payment.jsp">Receive & Pay the Bill</a>
        <a href="logout.jsp">Logout</a>
        
        
    </div>

    <!-- Main Content -->
    <div class="main-content">s
        <button class="logout-btn" onclick="window.location.href='logout.jsp'">Logout</button>
        <h1>Welcome, Customer</h1>

        <div class="card">
            <h3>Register / Login</h3>
            <a href="register.jsp"><button>Start Here</button></a>
        </div>

        <div class="card">
            <h3>Book a Cab</h3>
            <a href="book_cab.jsp"><button>Reserve Now</button></a>
        </div>

        <div class="card">
            <h3>View Booking Details</h3>
            <a href="viewbookings.jsp"><button>Check Status</button></a>
        </div>

        <div class="card">
            <h3>Pay the Bill</h3>
            <a href="pay_bill.jsp"><button>Make Payment</button></a>
        </div>
    </div>

</body>
</html>
