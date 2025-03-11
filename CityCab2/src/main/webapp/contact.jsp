<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Mega City Cab</title>

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

        /* Contact Section */
        .contact {
            padding: 120px 20px 50px;
        }

        .contact h1 {
            font-size: 40px;
            margin-bottom: 20px;
        }

        .contact-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
        }

        /* Contact Form */
        .contact-form {
            flex: 1;
            min-width: 300px;
            max-width: 400px;
            padding: 20px;
            background: rgba(0, 0, 0, 0.8);
            border-radius: 10px;
            text-align: left;
        }

        .contact-form label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
        }

        .contact-form input, .contact-form textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
            border: none;
            outline: none;
        }

        .contact-form button {
            width: 100%;
            margin-top: 15px;
            padding: 10px;
            background: #f8c529;
            border: none;
            font-weight: bold;
            cursor: pointer;
            border-radius: 5px;
        }

        .contact-form button:hover {
            background: #d39e00;
        }

        /* Contact Details */
        .contact-details {
            flex: 1;
            min-width: 300px;
            max-width: 400px;
            padding: 20px;
            background: rgba(0, 0, 0, 0.8);
            border-radius: 10px;
            text-align: center;
        }

        .contact-details h2 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .contact-details p {
            font-size: 18px;
            margin: 10px 0;
        }

        /* Google Map */
        .map {
            margin-top: 20px;
        }

        iframe {
            width: 100%;
            max-width: 800px;
            height: 300px;
            border-radius: 10px;
            border: none;
        }

        /* Footer */
        footer {
            text-align: center;
            padding: 20px;
            background: rgba(0, 0, 0, 0.8);
            margin-top: 50px;
        }

        /* Success Message Styling */
        .success-message {
            color: lightgreen;
            margin-top: 10px;
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

            .contact-container {
                flex-direction: column;
                align-items: center;
            }

            iframe {
                width: 90%;
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

    <!-- Contact Section -->
    <section class="contact">
        <h1>Contact Us</h1>
        <div class="contact-container">
            <!-- Contact Form -->
            <div class="contact-form">
                <h2>Get in Touch</h2>
                <form action="ContactServlet" method="POST">
                    <input type="hidden" name="action" value="add" />
                    <label for="name">Name</label>
                    <input type="text" id="name" name="name" required>
                    
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required>

                    <label for="message">Message</label>
                    <textarea id="message" name="message" rows="4" required></textarea>

                    <button type="submit">Send Message</button>
                </form>

                <!-- Success Message Display -->
                <% if (request.getParameter("success") != null && request.getParameter("success").equals("true")) { %>
                    <p class="success-message">Message sent successfully!</p>
                <% } else if (request.getParameter("success") != null && request.getParameter("success").equals("false")) { %>
                    <p class="success-message" style="color: red;">Failed to send message. Please try again.</p>
                <% } %>
            </div>

            <!-- Contact Details -->
            <div class="contact-details">
                <h2>Contact Information</h2>
                <p>📍 Address: Colombo, Sri Lanka</p>
                <p>📞 Phone: +94 707612308</p>
                <p>✉ Email: support@megacitycab.com</p>
            </div>
        </div>
        
        <!-- Google Maps Embed -->
        <div class="map">
            <iframe 
                src="https://www.google.com/maps?q=Colombo,Sri+Lanka&output=embed" 
                width="100%" 
                height="300" 
                frameborder="0" 
                style="border:0" 
                allowfullscreen>
            </iframe>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Mega City Cab | All rights reserved.</p>
    </footer>

</body>
</html>
