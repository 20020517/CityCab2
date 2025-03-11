<%@ page import="model.Driver" %>
<%@ page import="model.Car" %>
<%@ page import="java.util.List,dao.CarDAO, dao.DriverDAO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Manage Cars</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- Custom Styles -->
    <style>
        /* General Styles */
        body {
            font-family: 'Poppins', sans-serif;
            background: url('css/images/image2.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
            padding: 20px;
        }

        .container {
            max-width: 900px;
            background: rgba(0, 0, 0, 0.7);
            padding: 30px;
            margin: auto;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.3);
        }

        h2 {
            color: #f8c529;
            text-align: center;
        }

        /* Table Styles */
        .table th {
            background-color: #007bff;
            color: white;
            text-align: center;
        }

        .table td {
            text-align: center;
        }

        .btn {
            border-radius: 5px;
            font-size: 14px;
            width: 100%;
            padding: 8px;
        }

        .btn-primary {
            background-color: #f8c529;
            color: white;
        }

        .btn-primary:hover {
            background-color: #d39e00;
        }

        .btn-warning {
            background-color: #ffc107;
        }

        .btn-warning:hover {
            background-color: #e0a800;
        }

        .btn-danger {
            background-color: #dc3545;
        }

        .btn-danger:hover {
            background-color: #c82333;
        }

        /* Footer Section */
        footer {
            text-align: center;
            padding: 15px;
            margin-top: 30px;
            background: rgba(0, 0, 0, 0.7);
            color: white;
        }
    </style>
</head>
<body>

<div class="container mt-4">
    <h2 class="text-center mb-4">Manage Cars</h2>

    <!-- Car List Table -->
    <div class="card shadow-sm p-4 mb-4">
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Model</th>
                    <th>Plate No</th>
                    <th>Status</th>
                    <th>Driver</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<Car> cars = CarDAO.getAllCars(); 
                List<Driver> drivers = DriverDAO.getAllDrivers(); 
                    for (Car car : cars) { 
                %>
                    <tr>
                        <td><%= car.getId() %></td>
                        <td><%= car.getModel() %></td>
                        <td><%= car.getPlateNo() %></td>
                        <td><%= car.getStatus() %></td>

                        <!-- Driver Assignment Dropdown -->
                        <td>
                            <form action="ManageCarServlet" method="post">
                                <input type="hidden" name="action" value="assignDriver">
                                <input type="hidden" name="carId" value="<%= car.getId() %>">
                                <select name="driverId" class="form-control">
                                    <option value="">-- Select a Driver --</option>
                                    <% 
                                        for (Driver driver : drivers) {
                                    %>
                                        <option value="<%= driver.getId() %>">
                                            <%= driver.getName() %>
                                        </option>
                                    <% 
                                        }
                                    %>
                                </select>
                                <button type="submit" class="btn btn-primary mt-2">Assign Driver</button>
                            </form>
                        </td>

                        <td>
                            <a href="ManageCarServlet?action=update&id=<%= car.getId() %>" class="btn btn-warning btn-sm">Update</a>
                            <a href="ManageCarServlet?action=delete&id=<%= car.getId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this car?')">Delete</a>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>
<!-- Footer Section -->
<footer>
    <p>&copy; 2025 Mega City Cab. All Rights Reserved.</p>
    <p>
        <a href="Home.jsp">Home</a> |
        <a href="about.jsp">About Us</a> |
        <a href="contact.jsp">Contact</a>
    </p>
</footer>

</body>
</html>
