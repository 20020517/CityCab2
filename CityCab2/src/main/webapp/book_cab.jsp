<%@ page import="java.util.List" %>
<%@ page import="model.Car" %>
<%@ page import="dao.CarDAO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book a Car</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
        /* Custom Styling */
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .container {
            margin-top: 50px;
        }
        .footer {
            background-color: #343a40;
            color: white;
            padding: 20px 0;
            text-align: center;
            margin-top: auto;
            width: 100%;
        }
        .footer a {
            color: #dcdcdc;
            text-decoration: none;
        }
        .footer a:hover {
            color: #ffffff;
        }
    </style>
</head>
<body>

<div class="container">
    <!-- Heading -->
    <h2 class="text-center mb-4">Book a Car</h2>

    <!-- Booking Form -->
    <form action="BookCabServlet" method="post">
        <div class="mb-3">
            <label for="carId" class="form-label">Select Car:</label>
            <select id="carId" name="carId" class="form-select" required>
                <option value="">-- Select a Car --</option>
                <!-- Populate the car options dynamically from the database -->
                <option value="1">BMW</option>
                <option value="2">Honda Civic</option>
            </select>
        </div>
        
        <div class="mb-3">
            <label for="startLocation" class="form-label">Start Location:</label>
            <input type="text" id="startLocation" name="startLocation" class="form-control" required />
        </div>

        <div class="mb-3">
            <label for="endLocation" class="form-label">End Location:</label>
            <input type="text" id="endLocation" name="endLocation" class="form-control" required />
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-primary">Book Now</button>
        </div>
    </form>
</div>

<!-- Footer -->
<div class="footer">
    <p>&copy; 2025 Mega City Cab. All Rights Reserved.</p>
    <p>
        <a href="#">Privacy Policy</a> | 
        <a href="#">Terms of Service</a> | 
        <a href="#">Contact Us</a>
    </p>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

</body>
</html>
