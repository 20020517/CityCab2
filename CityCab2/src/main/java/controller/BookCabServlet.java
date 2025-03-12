package controller;

import dao.BookingDAO;
import dao.DatabaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Booking;

import java.io.IOException;
import java.sql.*;
import java.util.List;

@WebServlet("/BookCabServlet")
public class BookCabServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the customer_id from the session
        HttpSession session = request.getSession(false); // Prevents creating a new session
        if (session == null) {
            response.sendRedirect("login.jsp?error=session_expired");
            return;
        }

        // Retrieve userId from session
        Integer customerId = (Integer) session.getAttribute("userId");
        if (customerId == null) {
            response.sendRedirect("login.jsp?error=session_expired");
            return;
        }

        // Get booking details from form
        int carId = Integer.parseInt(request.getParameter("carId"));
        String startLocation = request.getParameter("startLocation");
        String endLocation = request.getParameter("endLocation");

        // Validate inputs
        if (startLocation.isEmpty() || endLocation.isEmpty()) {
            response.sendRedirect("book_cab.jsp?error=invalid_input");
            return;
        }

        String query = "INSERT INTO booking (customer_id, car_id, start_location, end_location, status) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setInt(1, customerId);
            stmt.setInt(2, carId);
            stmt.setString(3, startLocation);
            stmt.setString(4, endLocation);
            stmt.setString(5, "pending");

            int affectedRows = stmt.executeUpdate();
            if (affectedRows > 0) {
                ResultSet generatedKeys = stmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int bookingId = generatedKeys.getInt(1);
                    // Fetch the bookings for the current customer after booking
                    BookingDAO bookingDAO = new BookingDAO();
                    List<Booking> bookings = bookingDAO.getBookingsByCustomer(customerId);
                    request.setAttribute("bookings", bookings);
                    request.getRequestDispatcher("/viewbookings.jsp").forward(request, response);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("book_cab.jsp?error=database_error");
        }
    }
}
