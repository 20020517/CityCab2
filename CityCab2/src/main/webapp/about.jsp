<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Mega City Cab</title>

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

        /* Background Image with Dark Overlay */
        body {
            background: url('images/welcome.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
            text-align: center;
            position: relative;
        }

        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5); /* Dark overlay */
            z-index: -1;
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

        /* About Section */
        .about {
            padding: 120px 20px 50px;
            max-width: 900px;
            margin: auto;
            text-align: center;
        }

        .about h1 {
            font-size: 40px;
            margin-bottom: 20px;
        }

        /* Readability Box for Paragraphs */
        .about-content {
            background: rgba(0, 0, 0, 0.6); /* Semi-transparent background */
            padding: 20px;
            border-radius: 10px;
            display: inline-block;
            max-width: 80%;
        }

        .about p {
            font-size: 18px;
            line-height: 1.6;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7); /* Text shadow for better visibility */
        }

        /* Team Section */
        .team {
            padding: 50px 20px;
        }

        .team h2 {
            font-size: 32px;
            margin-bottom: 20px;
        }

        .team-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
        }

        .team-member {
            flex: 1;
            min-width: 250px;
            max-width: 300px;
            padding: 20px;
            background: rgba(0, 0, 0, 0.8);
            text-align: center;
            border-radius: 10px;
            transition: 0.3s;
        }

        .team-member:hover {
            background: #f8c529;
            color: black;
        }

        .team-member h3 {
            margin-top: 10px;
            font-size: 22px;
        }

        .team-member p {
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

            .about h1 {
                font-size: 35px;
            }

            .about-content {
                max-width: 90%;
            }

            .team h2 {
                font-size: 28px;
            }

            .team-member {
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
                <li><a href="Home.jsp">Home</a></li>
                <li><a href="services.jsp">Services</a></li>
                <li><a href="about.jsp">About</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li><a href="login.jsp" class="btn">Login</a></li>
                <li><a href="register.jsp" class="btn">Register</a></li>
            </ul>
        </nav>
    </header>

    <!-- About Section -->
    <section class="about">
        <h1>About Mega City Cab</h1>
        <div class="about-content">
            <p>
                Mega City Cab is a leading cab booking service in Colombo, offering fast, reliable, 
                and affordable transportation solutions for city rides, airport transfers, and more.
                Our mission is to provide a seamless and comfortable travel experience for all passengers.
            </p>
            <p>
                Whether you need a quick ride in the city, a luxury car for business trips, or a long-distance journey, 
                we have the perfect solution for you. Our drivers are trained professionals, and our fleet is well-maintained 
                to ensure safety and comfort.
            </p>
        </div>
    </section>

    <!-- Team Section -->
    <section class="team">
        <h2>Meet Our Team</h2>
        <div class="team-container">
            <div class="team-member">
                <h3>John Doe</h3>
                <p>CEO & Founder</p>
            </div>
            <div class="team-member">
                <h3>Jane Smith</h3>
                <p>Operations Manager</p>
            </div>
            <div class="team-member">
                <h3>Michael Lee</h3>
                <p>Customer Support Head</p>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Mega City Cab | All rights reserved.</p>
    </footer>

</body>
</html>
