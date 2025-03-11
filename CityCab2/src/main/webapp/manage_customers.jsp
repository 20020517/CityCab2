<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, model.Customer, dao.CustomerDAO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Manage Customers - Mega City Cab</title>

    <!-- Bootstrap CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        body {
            font-family: 'Poppins', sans-serif;
           background: url('css/images/image2.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
            padding-bottom: 50px;
        }
        
        /* Container for centered content */
        .container {
            margin-top: 50px;
            padding: 30px;
            background: rgba(0, 0, 0, 0.6);
            border-radius: 10px;
        }

        .card {
            background: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .card h4 {
            color: #f8c529;
        }

        .btn {
            border-radius: 5px;
        }

        .btn-primary {
            background-color: #f8c529;
            border-color: #f8c529;
        }

        .btn-primary:hover {
            background-color: #d39e00;
            border-color: #d39e00;
        }

        .btn-danger {
            background-color: #d9534f;
            border-color: #d9534f;
        }

        .btn-danger:hover {
            background-color: #c9302c;
            border-color: #c9302c;
        }

        .table th {
            background-color: #007bff;
            color: white;
            text-align: center;
        }

        .table td {
            text-align: center;
            color: #333;
        }

        .form-control {
            border-radius: 5px;
        }

        .error-msg {
            color: red;
            text-align: center;
            font-weight: bold;
        }

        footer {
            background: rgba(0, 0, 0, 0.7);
            color: white;
            text-align: center;
            padding: 15px 0;
            position: fixed;
            width: 100%;
            bottom: 0;
        }

        footer a {
            color: #f8f9fa;
            text-decoration: none;
            margin: 0 15px;
            font-weight: 500;
        }

        footer a:hover {
            color: #ffcc00;
        }

    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center mb-4">Manage Customers</h2>

    <!-- Add Customer Form -->
    <div class="card shadow-sm p-4 mb-4 bg-white rounded">
        <h4 class="mb-3">Add Customer</h4>
        <form action="ManageCustomerServlet" method="post">
            <input type="hidden" name="action" value="add">
            <div class="row">
                <div class="col-md-3">
                    <input type="text" name="name" class="form-control" placeholder="Name" required>
                </div>
                <div class="col-md-3">
                    <input type="text" name="address" class="form-control" placeholder="Address" required>
                </div>
                <div class="col-md-2">
                    <input type="text" name="nic" class="form-control" placeholder="NIC" required>
                </div>
                <div class="col-md-2">
                    <input type="text" name="phone" class="form-control" placeholder="Phone" required>
                </div>
                <div class="col-md-2">
                    <button type="submit" class="btn btn-primary w-100">Add Customer</button>
                </div>
            </div>
        </form>
    </div>

    <!-- Customer List Table -->
    <div class="card shadow-sm p-4 bg-white rounded">
        <h4 class="mb-3">Customer List</h4>
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>ID</th><th>Name</th><th>Address</th><th>NIC</th><th>Phone</th><th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<Customer> customerList = (List<Customer>) request.getAttribute("customerList");
                if (customerList != null && !customerList.isEmpty()) { 
                    for (Customer customer : customerList) { 
                %>
                    <tr>
                        <td><%= customer.getCustomerId() %></td>
                        <td><%= customer.getName() %></td>
                        <td><%= customer.getAddress() %></td>
                        <td><%= customer.getNic() %></td>
                        <td><%= customer.getPhone() %></td>
                        <td>
                            <form action="ManageCustomerServlet" method="post" class="d-inline">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="customer_id" value="<%= customer.getCustomerId() %>">
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                        </td>
                    </tr>
                <% 
                    } 
                } else { 
                %>
                    <tr><td colspan="6" class="text-center">No customers found.</td></tr>
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
