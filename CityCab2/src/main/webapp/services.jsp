<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Services - Mega City Cab</title>

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

        /* Services Section */
        .services {
            padding: 120px 20px 50px;
        }

        .services h1 {
            font-size: 40px;
            margin-bottom: 20px;
        }

        .service-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
        }

        .service-box {
            flex: 1;
            min-width: 300px;
            max-width: 350px;
            padding: 20px;
            background: rgba(0, 0, 0, 0.8);
            text-align: center;
            border-radius: 10px;
            transition: 0.3s;
        }

        .service-box:hover {
            background: #f8c529;
            color: black;
        }

        .service-box h2 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .service-box p {
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

            .services h1 {
                font-size: 35px;
            }

            .service-box {
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

    <!-- Services Section -->
    <section class="services">
        <h1>Our Services</h1>
        <div class="service-container">
            <div class="service-box">
                <h2>🚖 City Rides</h2>
                <p>Book a cab for quick and easy city travel at affordable prices.</p>
            </div>
            <div class="service-box">
                <h2>🚆 Airport Transfers</h2>
                <p>Get a comfortable and on-time ride to or from the airport.</p>
            </div>
            <div class="service-box">
                <h2>📦 Parcel Delivery</h2>
                <p>Reliable and fast package delivery service at your convenience.</p>
            </div>
        </div>
        <br>
        <div class="service-container">
            <div class="service-box">
                <h2>🏢 Corporate Cabs</h2>
                <p>Special cab services tailored for business and corporate needs.</p>
            </div>
            <div class="service-box">
                <h2>🌍 Outstation Trips</h2>
                <p>Plan intercity or outstation travel with our long-distance cabs.</p>
            </div>
            <div class="service-box">
                <h2>🚗 Luxury Rides</h2>
                <p>Enjoy premium and luxury cab rides with professional drivers.</p>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Mega City Cab | All rights reserved.</p>
    </footer>

</body>
</html>
