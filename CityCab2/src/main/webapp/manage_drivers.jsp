<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, model.Driver" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Drivers - Mega City Cab</title>

    <style>
        /* General Styles */
        body {
            font-family: 'Poppins', sans-serif;
            background: url('css/images/image18.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
            margin: 0;
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

        .form-container {
            background: #2a3f54;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            margin-bottom: 30px;
        }

        .form-container h3 {
            color: #f8c529;
        }

        /* Form Styles */
        .form-container input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .btn {
            padding: 10px 15px;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            font-size: 14px;
            width: 100%;
        }

        .btn-primary {
            background-color: #f8c529;
            border: none;
        }

        .btn-primary:hover {
            background-color: #d39e00;
        }

        .table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        .table th {
            background-color: #007bff;
            color: white;
            padding: 12px;
        }

        .table td {
            padding: 10px;
            text-align: center;
            color: #333;
        }

        .table td button {
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-edit {
            background-color: #ffc107;
        }

        .btn-edit:hover {
            background-color: #e0a800;
        }

        .btn-delete {
            background-color: #dc3545;
        }

        .btn-delete:hover {
            background-color: #c82333;
        }

        /* Footer Styles */
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

    <div class="container">
        <h2>Manage Drivers</h2>

        <!-- Add Driver Form -->
        <div class="form-container">
            <h3>Add New Driver</h3>
            <form action="ManageDriverServlet" method="post">
                <input type="hidden" name="action" value="add">
                <label for="name">Name</label>
                <input type="text" name="name" required>

                <label for="licenseNo">License No</label>
                <input type="text" name="licenseNo" required>

                <label for="phone">Phone</label>
                <input type="text" name="phone" required>

                <label for="nic">NIC</label>
                <input type="text" name="nic" required>

                <button type="submit" class="btn btn-primary">Add Driver</button>
            </form>
        </div>

        <!-- Driver Table -->
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>License No</th>
                    <th>Phone</th>
                    <th>NIC</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Driver> drivers = (List<Driver>) request.getAttribute("drivers");
                    if (drivers == null || drivers.isEmpty()) {
                %>
                    <tr><td colspan="6">No drivers available</td></tr>
                <% 
                    } else {
                        for (Driver driver : drivers) {
                %>
                    <!-- Normal Row -->
                    <tr id="driverRow<%= driver.getId() %>">
                        <td><%= driver.getId() %></td>
                        <td><%= driver.getName() %></td>
                        <td><%= driver.getLicenseNo() %></td>
                        <td><%= driver.getPhone() %></td>
                        <td><%= driver.getNic() %></td>
                        <td>
                            <button type="button" class="btn btn-edit" onclick="showUpdateForm(<%= driver.getId() %>)">Edit</button>
                            <form id="deleteForm<%= driver.getId() %>" action="ManageDriverServlet" method="post" style="display:inline;">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="<%= driver.getId() %>">
                                <button type="button" class="btn btn-delete" onclick="confirmDelete(<%= driver.getId() %>)">Delete</button>
                            </form>
                        </td>
                    </tr>

                    <!-- Update Form Row (Initially Hidden) -->
                    <tr id="updateForm<%= driver.getId() %>" style="display:none;">
                        <form action="ManageDriverServlet" method="post">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="id" value="<%= driver.getId() %>">
                            <td><%= driver.getId() %></td>
                            <td><input type="text" name="name" value="<%= driver.getName() %>"></td>
                            <td><input type="text" name="licenseNo" value="<%= driver.getLicenseNo() %>"></td>
                            <td><input type="text" name="phone" value="<%= driver.getPhone() %>"></td>
                            <td><input type="text" name="nic" value="<%= driver.getNic() %>"></td>
                            <td>
                                <button type="submit" class="btn btn-primary">Save</button>
                            </td>
                        </form>
                    </tr>
                <% 
                        }
                    }
                %>
            </tbody>
        </table>
    </div>

    <!-- Footer Section -->
    <footer>
        <p>&copy; 2025 Mega City Cab. All Rights Reserved.</p>
        <p>
            <a href="index.jsp">Home</a> |
            <a href="about.jsp">About Us</a> |
            <a href="contact.jsp">Contact</a>
        </p>
    </footer>

    <script>
        function showUpdateForm(driverId) {
            document.getElementById("updateForm" + driverId).style.display = "table-row";
            document.getElementById("driverRow" + driverId).style.display = "none";
        }

        function confirmDelete(driverId) {
            if (confirm("Are you sure you want to delete this driver?")) {
                document.getElementById("deleteForm" + driverId).submit();
            }
        }
    </script>

</body>
</html>
