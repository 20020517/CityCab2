package controller;

import dao.BookingDAO;
import model.Booking;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/ViewBookingsServlet")
public class ViewBookingsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the customer_id from the session
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp?error=session_expired");
            return;
        }

        Integer customerId = (Integer) session.getAttribute("userId");
        if (customerId == null) {
            response.sendRedirect("login.jsp?error=session_expired");
            return;
        }

        // Fetch the bookings for the current customer from the database
        BookingDAO bookingDAO = new BookingDAO();
        List<Booking> bookings = bookingDAO.getBookingsByCustomer(customerId);

        // Set the bookings as a request attribute
        request.setAttribute("bookings", bookings);

        // Forward the request to the view_bookings.jsp page
        request.getRequestDispatcher("viewbookings.jsp").forward(request, response);
    }
}
