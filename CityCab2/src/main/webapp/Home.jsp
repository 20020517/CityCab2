<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - Mega City Cab</title>

    <style>
        /* General Styles */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: url('images/welcome.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
        }

        /* Header */
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 50px;
            background: rgba(0, 0, 0, 0.7);
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.3);
        }

        .logo {
            font-size: 28px;
            font-weight: bold;
            color: #f8c529;
        }

        nav ul {
            list-style: none;
            display: flex;
            padding: 0;
        }

        nav ul li {
            margin: 0 20px;
        }

        nav ul li a {
            text-decoration: none;
            color: white;
            font-weight: bold;
            padding: 8px 15px;
            border-radius: 5px;
            transition: all 0.3s ease-in-out;
        }

        nav ul li a:hover {
            background-color: #f8c529;
            color: black;
        }

        nav ul li .btn {
            background: #28a745;
            padding: 8px 15px;
            border-radius: 5px;
            transition: background-color 0.3s ease-in-out;
        }

        nav ul li .btn:hover {
            background-color: #218838;
        }

        /* Hero Section */
        .hero {
            text-align: center;
            margin-top: 150px;
            position: relative;
            background: linear-gradient(to bottom, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.7)), url('images/welcome.jpg');
            background-size: cover;
            color: white;
            padding: 80px 0;
        }

        .hero h1 {
            font-size: 50px;
            font-weight: 700;
            margin-bottom: 20px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
        }

        .hero p {
            font-size: 22px;
            font-weight: 300;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.7);
        }

        .hero .btn {
            display: inline-block;
            margin-top: 30px;
            padding: 15px 30px;
            background: #ffc107;
            color: black;
            font-weight: bold;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease-in-out;
        }

        .hero .btn:hover {
            background-color: #e0a800;
        }

        /* Features Section */
        .features {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin-top: 80px;
            text-align: center;
            flex-wrap: wrap;
            background-color: #333; /* Added background color for contrast */
            padding: 50px 0;
        }

        .feature-box {
            width: 250px;
            padding: 30px;
            background: rgba(0, 0, 0, 0.7);
            border-radius: 10px;
            transition: transform 0.3s ease;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.5); /* Adding shadow for depth */
        }

        .feature-box:hover {
            transform: scale(1.05);
        }

        .feature-box h2 {
            font-size: 22px;
            margin-bottom: 10px;
            color: #f8c529;
        }

        .feature-box p {
            font-size: 16px;
            color: #ccc;
        }

        /* Footer */
        footer {
            text-align: center;
            padding: 20px;
            background: rgba(0, 0, 0, 0.9); /* Darker footer background */
            margin-top: 100px;
            color: #f8c529; /* Lighter text for footer */
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            header {
                flex-direction: column;
                align-items: center;
                text-align: center;
            }

            nav ul {
                flex-direction: column;
                padding: 10px 0;
            }

            .features {
                flex-direction: column;
                gap: 20px;
            }

            .feature-box {
                width: 80%;
                margin: 0 auto;
            }

            .hero h1 {
                font-size: 35px;
            }

            .hero p {
                font-size: 18px;
            }
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <header>
        <div class="logo">Mega City Cab</div>
        <nav>
            <ul>
                <li><a href="Home.jsp">Home</a></li>
                <li><a href="services.jsp">Services</a></li>
                <li><a href="about.jsp">About</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li><a href="help_center.jsp">Help Center</a></li> <!-- New Help Center Button -->
                <li><a href="login.jsp" class="btn">Login</a></li>
                <li><a href="register.jsp" class="btn">Register</a></li>
            </ul>
        </nav>
    </header>

    <!-- Hero Section -->
   <section class="hero">
    <h1>Welcome to Mega City Cab</h1>
    <p>Your trusted cab booking service in Colombo!</p>
    <!-- Redirecting to login page -->
    <a href="login.jsp?redirect=book.jsp" class="btn">Book a Ride</a>
</section>
   
    <!-- Features Section -->
    <section class="features">
        <div class="feature-box">
            <h2>Fast & Reliable</h2>
            <p>We ensure quick pickups and drop-offs with the best drivers.</p>
        </div>
        <div class="feature-box">
            <h2>Affordable Prices</h2>
            <p>Enjoy competitive pricing with no hidden charges.</p>
        </div>
        <div class="feature-box">
            <h2>24/7 Support</h2>
            <p>Our customer support is available round the clock.</p>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Mega City Cab | All rights reserved.</p>
    </footer>

</body>
</html> 
