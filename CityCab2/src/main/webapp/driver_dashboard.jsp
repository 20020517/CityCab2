<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver Dashboard - Mega City Cab</title>
    
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
            background: #f8f9fa;
             background: url('css/images/image15.jpg') no-repeat center center fixed;
    background-size: cover;
        }

        /* Sidebar */
        .sidebar {
            width: 250px;
            height: 100vh;
            background: #ff9800;
            color: white;
            padding: 20px;
            position: fixed;
            left: 0;
            top: 0;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            padding: 12px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        .sidebar ul li a {
            color: white;
            text-decoration: none;
            font-size: 16px;
            display: block;
            transition: 0.3s;
        }

        .sidebar ul li a:hover {
            background: #e68900;
            padding-left: 10px;
        }

        /* Main Content */
        .main-content {
            margin-left: 250px;
            padding: 20px;
            width: calc(100% - 250px);
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #ffffff;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .header h1 {
            font-size: 24px;
            color: #333;
        }

        .logout-btn {
            background: #d9534f;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            transition: 0.3s;
        }

        .logout-btn:hover {
            background: #c9302c;
        }

        /* Dashboard Sections */
        .dashboard-sections {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }

        .card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card h3 {
            color: #333;
            font-size: 18px;
            margin-bottom: 10px;
        }

        .card a {
            display: inline-block;
            padding: 10px 15px;
            background: #ff9800;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: 0.3s;
        }

        .card a:hover {
            background: #e68900;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
            }

            .main-content {
                margin-left: 200px;
                width: calc(100% - 200px);
            }

            .header h1 {
                font-size: 20px;
            }
        }

        @media (max-width: 600px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }

            .main-content {
                margin-left: 0;
                width: 100%;
            }

            .header {
                flex-direction: column;
                text-align: center;
            }

            .dashboard-sections {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

    <!-- SIDEBAR -->
    <div class="sidebar">
        <h2>Driver Panel</h2>
        <ul>
            <li><a href="login.jsp">Log In</a></li>
            <li><a href="DriverBookingServlet">View Bookings</a></li>
            
            <li><a href="car_details.jsp">View Car Details</a></li>
            <li><a href="logout.jsp">Log Out</a></li>
        </ul>
    </div>

    <!-- MAIN CONTENT -->
    <div class="main-content">
        <div class="header">
            <h1>Welcome, Driver</h1>
            <a href="logout.jsp" class="logout-btn">Log Out</a>
        </div>

        <div class="dashboard-sections">
            <div class="card">
                <h3>Log In</h3>
                <a href="login.jsp">Access Your Account</a>
            </div>
            <div class="card">
                <h3>View Bookings</h3>
                <a href="DriverBookingServlet">Check Assignments</a>
            </div>
            <div class="card">
                <h3>View Car Details</h3>
                <a href="car_details.jsp">See Vehicle Info</a>
            </div>
        </div>
    </div>

</body>
</html>
