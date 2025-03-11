<%@ page import="java.util.List" %>
<%@ page import="model.Car" %>
<%@ page import="dao.CarDAO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book a Car</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-4">
    <h2 class="text-center mb-4">Book a Car</h2>

    <!-- Form for Booking a Car -->
    <form action="BookCabServlet" method="post">
    <label for="carId">Select Car:</label>
    <select id="carId" name="carId" required>
        <option value="">-- Select a Car --</option>
        <!-- Populate the car options dynamically from the database -->
        <!-- Example: -->
        <option value="1">BMW</option>
        <option value="2">Honda Civic</option>
    </select>
    
    <label for="startLocation">Start Location:</label>
    <input type="text" id="startLocation" name="startLocation" required />

    <label for="endLocation">End Location:</label>
    <input type="text" id="endLocation" name="endLocation" required />

    <button type="submit">Book Now</button>
</form>
    
 
</div>

</body>
</html>
