<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help Center - Mega City Cab</title>

    <style>
        /* General Styles */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: url('images/help-center-bg.jpg') no-repeat center center fixed;
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

        /* Hero Section */
        .hero {
            text-align: center;
            margin-top: 150px;
            position: relative;
            background: linear-gradient(to bottom, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.7)), url('images/help-center-bg.jpg');
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

        /* Help Center Sections */
        .section-title {
            text-align: center;
            font-size: 30px;
            margin: 30px 0;
            color: #f8c529;
        }

        .faqs {
            padding: 40px 60px;
            background: rgba(0, 0, 0, 0.7);
            border-radius: 10px;
            margin: 30px 0;
        }

        .faq-item {
            margin: 20px 0;
            padding: 10px;
            background-color: #333;
            border-radius: 5px;
        }

        .faq-item h3 {
            margin: 0;
            font-size: 18px;
        }

        .faq-item p {
            font-size: 16px;
            color: #ccc;
        }

        footer {
            text-align: center;
            padding: 20px;
            background: rgba(0, 0, 0, 0.9);
            color: #f8c529;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .faq-item {
                margin: 15px 0;
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
                <li><a href="help_center.jsp">Help Center</a></li>
                <li><a href="login.jsp" class="btn">Login</a></li>
                <li><a href="register.jsp" class="btn">Register</a></li>
            </ul>
        </nav>
    </header>

    <!-- Hero Section -->
    <section class="hero">
        <h1>Welcome to Mega City Cab Help Center</h1>
        <p>Your guide to everything about Mega City Cab services.</p>
    </section>

    <!-- FAQ Section -->
    <section class="faqs">
        <h2 class="section-title">Frequently Asked Questions</h2>
        <div class="faq-item">
            <h3>How do I book a ride?</h3>
            <p>You can book a ride by selecting your destination and picking a car from our available options.</p>
        </div>
        <div class="faq-item">
            <h3>How do I pay for my ride?</h3>
            <p>We accept both online and cash payments for your convenience.</p>
        </div>
        <div class="faq-item">
            <h3>Can I cancel my booking?</h3>
            <p>Yes, you can cancel your booking up to 30 minutes before your ride time.</p>
        </div>
        <div class="faq-item">
            <h3>Is there a minimum fare?</h3>
            <p>Yes, there is a minimum fare of $5 for all rides.</p>
        </div>
        <div class="faq-item">
            <h3>What happens if my driver doesn't show up?</h3>
            <p>If your driver does not arrive within the scheduled time, please contact our support team to resolve the issue.</p>
        </div>
        <div class="faq-item">
            <h3>Do I need an account to book a ride?</h3>
            <p>Yes, you must register and log in to book a ride. You can also book as a guest, but we recommend registering for easier management of your bookings.</p>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Mega City Cab | All rights reserved.</p>
    </footer>

</body>
</html>
