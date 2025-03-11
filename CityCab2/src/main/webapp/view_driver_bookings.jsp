<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, model.Booking" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Driver View Bookings</title>
</head>
<body>

    <h2>Your Assigned Bookings</h2>

    <%
        List<Booking> bookings = (List<Booking>) request.getAttribute("bookingList");

        if (bookings == null || bookings.isEmpty()) {
    %>
        <h3>No bookings assigned.</h3>
    <%
        } else {
    %>
        <table border="1">
            <tr>
                <th>Booking ID</th>
                <th>Customer ID</th>
                <th>Car ID</th>
                <th>Start Location</th>
                <th>End Location</th>
                <th>Booking Date</th>
                <th>Status</th>
            </tr>
            <% for (Booking booking : bookings) { %>
            <tr>
                <td><%= booking.getId() %></td>
                <td><%= booking.getCustomerId() %></td>
                <td><%= booking.getCarId() %></td>
                <td><%= booking.getStartLocation() %></td>
                <td><%= booking.getEndLocation() %></td>
                <td><%= booking.getBookingDate() %></td>
                <td><%= booking.getStatus() %></td>
            </tr>
            <% } %>
        </table>
    <%
        }
    %>

    <a href="driver_dashboard.jsp"><button>Back to Dashboard</button></a>

</body>
</html>
