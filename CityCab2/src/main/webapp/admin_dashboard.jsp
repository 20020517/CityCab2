<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Mega City Cab</title>
    
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
     background: url('css/images/image12.jpg') no-repeat center center fixed;
    background-size: cover;
}

/* Sidebar */
.sidebar {
    width: 250px;
    height: 100vh;
    background: #2a3f54;
    color: white;
    padding: 20px;
    position: fixed;
    left: 0;
    top: 0;
}

.sidebar h2 {
    text-align: center;
    margin-bottom: 20px;
    color: #f8c529;
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
    background: #1e2a38;
    padding-left: 10px;
}

/* Main Content */
.main-content {
    margin-left: 250px;
    padding: 20px;
    width: calc(100% - 250px);
    background: url('images/your-image.jpg') no-repeat center center; /* Background Image */
    background-size: cover;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    justify-content: flex-start;  /* Ensures content starts from the top */
}

/* Header */
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
    background: #007bff;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    transition: 0.3s;
}

.card a:hover {
    background: #0056b3;
}

/* Footer */
footer {
    width: 100%;
    background: #2a3f54;
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
        <h2>Admin Panel</h2>
        <ul>
            <li><a href="manage_customers.jsp">Manage Customers</a></li>
            <li><a href="manage_drivers.jsp">Manage Drivers</a></li>
            <li><a href="manage_bookings.jsp">Manage Bookings</a></li>
            <li><a href="manage_cars.jsp">Manage Cars</a></li>
            <li><a href="logout.jsp">Logout</a></li>
           <li><a href="logout" class="logout-btn">Logout</a></li>
            
        </ul>
    </div>

    <!-- MAIN CONTENT -->
    <div class="main-content">
        <div class="header">
            <h1>Welcome, Admin</h1>
            <a href="logout.jsp" class="logout-btn">Logout</a>
        </div>

        <div class="dashboard-sections">
            <div class="card">
                <h3>Manage Customers</h3>
                <a href="manage_customers.jsp">View & Update</a>
            </div>
            <div class="card">
                <h3>Manage Drivers</h3>
                <a href="manage_drivers.jsp">View & Update</a>
            </div>
            <div class="card">
                <h3>Manage Bookings</h3>
                <a href="manage_bookings.jsp">View, Update & Delete</a>
            </div>
            <div class="card">
                <h3>Manage Cars</h3>
                <a href="manage_cars.jsp">View & Update</a>
            </div>
        </div>
    </div>

    <!-- Footer Section -->
    <footer>
        <p>&copy; 2025 Mega City Cab. All Rights Reserved.</p>
        <p>
            <a href="index.jsp">Home</a> |
            <a href="about.jsp">About Us</a> |
            <a href="contact.jsp">Contact</a>
        </p>
    </footer>

</body>
</html>
