package controller;

import dao.UserDAO;
import dao.CustomerDAO;
import model.User;
import model.Customer;
import java.io.IOException;
import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password"); 
        String email = request.getParameter("email");
        String role = "customer"; // Default role for customers

        String address = request.getParameter("address");
        String nic = request.getParameter("nic");
        String phoneNumber = request.getParameter("phoneNumber");

        User user = new User(username, password,role);
        int userId = UserDAO.registerUser(user);

        if (userId > 0) {
            Customer customer = new Customer(userId, address, nic, phoneNumber);
            if (CustomerDAO.registerCustomer(customer)) {
                response.sendRedirect("login.jsp?success=1");
            } else {
                response.sendRedirect("register.jsp?error=1");
            }
        } else {
            response.sendRedirect("register.jsp?error=1");
        }
    }
}
