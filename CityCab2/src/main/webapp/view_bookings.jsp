<%@ page import="java.util.List" %>
<%@ page import="model.Booking" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Bookings</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-4">
    <h2 class="text-center mb-4">Your Booking Details</h2>

    <% 
        // Fetch the bookings from request attribute
        List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");

        if (bookings != null && !bookings.isEmpty()) {
    %>

    <table class="table">
        <thead>
            <tr>
                <th>Booking ID</th>
                <th>Car ID</th>
                <th>Start Location</th>
                <th>End Location</th>
                <th>Booking Date</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <% for (Booking booking : bookings) { %>
            <tr>
                <td><%= booking.getId() %></td>
                <td><%= booking.getCarId() %></td>
                <td><%= booking.getStartLocation() %></td>
                <td><%= booking.getEndLocation() %></td>
                <td><%= booking.getBookingDate() %></td>
                <td><%= booking.getStatus() %></td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <% } else { %>
        <p>No bookings found for your account.</p>
    <% } %>

    <a href="customer_dashboard.jsp">Back to Dashboard</a>
</div>

</body>
</html>
