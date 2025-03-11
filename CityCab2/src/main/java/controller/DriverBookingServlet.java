package controller;

import dao.BookingDAO;
import model.Booking;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.RequestDispatcher;

@WebServlet("/DriverBookingServlet")  // ✅ Correct Mapping
public class DriverBookingServlet extends HttpServlet {  
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        
        // ✅ Ensure session and driverId exist
        if (session == null || session.getAttribute("driverId") == null) {
            response.sendRedirect("login.jsp?error=session_expired"); // ✅ Redirect if session expired
            return;
        }

        Integer driverId = (Integer) session.getAttribute("driverId");

        try {
            // ✅ Fetch bookings assigned to the driver safely
            List<Booking> bookingList = BookingDAO.getBookingsByCustomer(driverId);

            // ✅ Ensure bookingList is not null to prevent JSP errors
            if (bookingList == null) {
                bookingList = new ArrayList<>(); 
            }

            request.setAttribute("bookingList", bookingList);

            // ✅ Forward to JSP to display bookings
            RequestDispatcher dispatcher = request.getRequestDispatcher("view_driver_bookings.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("view_driver_bookings.jsp?error=database_error");
        }
    }
}
