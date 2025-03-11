<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - Mega City Cab</title>

    <style>
        /* Google Fonts */
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        /* General Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: url('images/welcome.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
            text-align: center;
        }

        /* Navigation Bar */
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 50px;
            background: rgba(0, 0, 0, 0.8);
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
            z-index: 1000;
        }

        .logo {
            font-size: 28px;
            font-weight: bold;
            color: #f8c529;
        }

        nav ul {
            list-style: none;
            display: flex;
        }

        nav ul li {
            margin: 0 15px;
        }

        nav ul li a {
            text-decoration: none;
            color: white;
            font-weight: bold;
            padding: 10px 15px;
            transition: 0.3s;
            border-radius: 5px;
        }

        nav ul li a:hover {
            background: #f8c529;
            color: black;
        }

        .btn {
            background: #28a745;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            color: white;
            font-weight: bold;
        }

        .btn:hover {
            background: #218838;
        }

        /* Hero Section */
        .hero {
            margin-top: 150px;
            padding: 50px 20px;
        }

        .hero h1 {
            font-size: 45px;
            font-weight: 600;
        }

        .hero p {
            font-size: 18px;
            margin: 15px 0;
        }

        .hero .btn {
            margin-top: 20px;
            background: #ffc107;
            color: black;
        }

        /* Features Section */
        .features {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
            padding: 50px 20px;
        }

        .feature-box {
            flex: 1;
            min-width: 300px;
            max-width: 350px;
            padding: 20px;
            background: rgba(0, 0, 0, 0.8);
            text-align: center;
            border-radius: 10px;
            transition: 0.3s;
        }

        .feature-box:hover {
            background: #f8c529;
            color: black;
        }

        .feature-box h2 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .feature-box p {
            font-size: 16px;
        }

        /* Footer */
        footer {
            text-align: center;
            padding: 20px;
            background: rgba(0, 0, 0, 0.8);
            margin-top: 50px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            header {
                flex-direction: column;
                text-align: center;
            }

            nav ul {
                flex-direction: column;
                padding: 10px 0;
            }

            nav ul li {
                margin: 10px 0;
            }

            .hero h1 {
                font-size: 35px;
            }

            .hero p {
                font-size: 16px;
            }

            .feature-box {
                min-width: 80%;
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
                <li><a href="home.jsp">Home</a></li>
                <li><a href="services.jsp">Services</a></li>
                <li><a href="about.jsp">About</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li><a href="login.jsp" class="btn">Login</a></li>
                <li><a href="register.jsp" class="btn">Register</a></li>
            </ul>
        </nav>
    </header>

    <!-- Hero Section -->
    <section class="hero">
        <h1>Welcome to Mega City Cab</h1>
        <p>Your trusted cab booking service in Colombo!</p>
        <a href="book.jsp" class="btn">Book a Ride</a>
    </section>

    <!-- Features Section -->
    <section class="features">
        <div class="feature-box">
            <h2>🚗 Fast & Reliable</h2>
            <p>We ensure quick pickups and drop-offs with the best drivers.</p>
        </div>
        <div class="feature-box">
            <h2>💰 Affordable Prices</h2>
            <p>Enjoy competitive pricing with no hidden charges.</p>
        </div>
        <div class="feature-box">
            <h2>📞 24/7 Support</h2>
            <p>Our customer support is available round the clock.</p>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Mega City Cab | All rights reserved.</p>
    </footer>

</body>
</html>
