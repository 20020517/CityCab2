<%@ page import="java.util.List, model.Booking, dao.BookingDAO" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Manage Bookings</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-4">
    <h2 class="text-center mb-4">Manage Bookings</h2>

    <!-- Booking Table -->
    <div class="card shadow-sm p-4">
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Customer ID</th>
                    <th>Car ID</th>
                    <th>Driver ID</th>
                    <th>Booking Date</th>
                    <th>Status</th>
                    <th>Start Location</th>
                    <th>End Location</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<Booking> bookingList = (List<Booking>) request.getAttribute("bookingList");
                if (bookingList != null && !bookingList.isEmpty()) { 
                    for (Booking booking : bookingList) { 
                %>
                    <tr>
                        <td><%= booking.getId() %></td>
                        <td><%= booking.getCustomerId() %></td>
                        <td><%= booking.getCarId() %></td>
                        <td><%= booking.getDriverId() %></td>
                        <td><%= booking.getBookingDate() %></td>
                        <td>
                            <form action="ManageBookingServlet" method="post">
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" name="bookingId" value="<%= booking.getId() %>">
                                <select name="status" class="form-select">
                                    <option value="Pending" <%= booking.getStatus().equals("Pending") ? "selected" : "" %>>Pending</option>
                                    <option value="Confirmed" <%= booking.getStatus().equals("Confirmed") ? "selected" : "" %>>Confirmed</option>
                                    <option value="Completed" <%= booking.getStatus().equals("Completed") ? "selected" : "" %>>Completed</option>
                                    <option value="Cancelled" <%= booking.getStatus().equals("Cancelled") ? "selected" : "" %>>Cancelled</option>
                                </select>
                                <button type="submit" class="btn btn-sm btn-primary mt-1">Update</button>
                            </form>
                        </td>
                        <td><%= booking.getStartLocation() %></td>
                        <td><%= booking.getEndLocation() %></td>
                        <td>
                            <form action="ManageBookingServlet" method="post">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="bookingId" value="<%= booking.getId() %>">
                                <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                            </form>
                        </td>
                    </tr>
                <% } } else { %>
                    <tr><td colspan="9" class="text-center">No bookings available.</td></tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
