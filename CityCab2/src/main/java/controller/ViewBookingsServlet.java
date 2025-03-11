package controller;

import dao.DatabaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;

@WebServlet("/ViewBookingsServlet")
public class ViewBookingsServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer customerId = (Integer) session.getAttribute("customer_id");

        if (customerId == null) {
            response.sendRedirect("login.jsp?error=session_expired");
            return;
        }

        DatabaseConnection db = new DatabaseConnection();
        String query = "SELECT b.booking_id, c.model, c.plate_no, b.start_location, b.end_location, b.booking_date, b.status " +
                "FROM bookings b " +
                "JOIN cars c ON b.car_id = c.id " +
                "WHERE b.customer_id = ?";

        try (Connection conn = db.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, customerId);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                request.setAttribute("booking_id", rs.getInt("booking_id"));
                request.setAttribute("car_model", rs.getString("model"));
                request.setAttribute("car_plate_no", rs.getString("plate_no"));
                request.setAttribute("start_location", rs.getString("start_location"));
                request.setAttribute("end_location", rs.getString("end_location"));
                request.setAttribute("booking_date", rs.getTimestamp("booking_date"));
                request.setAttribute("status", rs.getString("status"));

                request.getRequestDispatcher("view_bookings.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "No bookings found.");
                request.getRequestDispatcher("view_bookings.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
