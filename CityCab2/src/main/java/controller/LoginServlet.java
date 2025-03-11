package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import dao.UserDAO;
import model.User;

//@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = UserDAO.authenticateUser(username, password);
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("userId", user.getUserId());
            if (user.getRole().equals("admin")) {
                response.sendRedirect("admin_dashboard.jsp");
            } else if (user.getRole().equals("customer")) {
                response.sendRedirect("customer_dashboard.jsp");
            } else if (user.getRole().equals("driver")) { 
                response.sendRedirect("driver_dashboard.jsp");
            }
        } else {
            response.sendRedirect("login.jsp?error=1");
        }
    }
}
