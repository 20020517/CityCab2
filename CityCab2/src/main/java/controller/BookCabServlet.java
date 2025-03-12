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

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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

        int carId = Integer.parseInt(request.getParameter("carId"));
        String startLocation = request.getParameter("startLocation");
        String endLocation = request.getParameter("endLocation");

        if (startLocation.isEmpty() || endLocation.isEmpty()) {
            response.sendRedirect("book_cab.jsp?error=invalid_input");
            return;
        }

        try (Connection conn = DatabaseConnection.getConnection()) {
            // Fetch the driver assigned to this car
            String getDriverQuery = "SELECT driver_id FROM cars WHERE id=?";
            PreparedStatement getDriverStmt = conn.prepareStatement(getDriverQuery);
            getDriverStmt.setInt(1, carId);
            ResultSet rs = getDriverStmt.executeQuery();

            if (rs.next()) {
                int driverId = rs.getInt("driver_id");

                // Insert booking with driver ID
                String insertBookingQuery = "INSERT INTO booking (customer_id, car_id, driver_id, start_location, end_location, status) VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement insertStmt = conn.prepareStatement(insertBookingQuery);
                insertStmt.setInt(1, customerId);
                insertStmt.setInt(2, carId);
                insertStmt.setInt(3, driverId);
                insertStmt.setString(4, startLocation);
                insertStmt.setString(5, endLocation);
                insertStmt.setString(6, "pending");

                int affectedRows = insertStmt.executeUpdate();
                if (affectedRows > 0) {
                    response.sendRedirect("customer_dashboard.jsp?success=booking_confirmed");
                } else {
                    response.sendRedirect("book_cab.jsp?error=database_error");
                }
            } else {
                response.sendRedirect("book_cab.jsp?error=no_driver_assigned");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("book_cab.jsp?error=database_error");
        }
    }
}
