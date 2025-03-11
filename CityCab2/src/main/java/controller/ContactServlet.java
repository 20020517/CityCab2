package controller;

import dao.ContactDAO;
import model.ContactMessage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form action type
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            // Get form data
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String message = request.getParameter("message");

            // Ensure no empty fields
            if (name == null || email == null || message == null || name.isEmpty() || email.isEmpty() || message.isEmpty()) {
                response.sendRedirect("contact.jsp?success=false");
                return;
            }

            // Create a new contact message object
            ContactMessage contactMessage = new ContactMessage(0, name, email, message);

            // Debugging - check the data being sent to DAO
            System.out.println("Form data received: " + contactMessage.getName() + ", " + contactMessage.getEmail() + ", " + contactMessage.getMessage());

            // Call DAO to insert message
            boolean success = ContactDAO.addMessage(contactMessage);
            System.out.println("Message added: " + success);

            // Redirect to contact page with success message
            response.sendRedirect("contact.jsp?success=" + success);
        }
    }
}