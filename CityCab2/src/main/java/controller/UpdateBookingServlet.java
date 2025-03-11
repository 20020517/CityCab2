package controller;

import dao.BookingDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateBookingServlet")  // ✅ Ensure mapping is correct
public class UpdateBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // ✅ Ensure 'id' and 'status' parameters exist and are not empty
            String idParam = request.getParameter("id");
            String status = request.getParameter("status");

            if (idParam == null || status == null || idParam.trim().isEmpty() || status.trim().isEmpty()) {
                response.sendRedirect("manage_bookings.jsp?error=missing_parameters");
                return;
            }

            // ✅ Parse the booking ID safely
            int bookingId;
            try {
                bookingId = Integer.parseInt(idParam);
            } catch (NumberFormatException e) {
                response.sendRedirect("manage_bookings.jsp?error=invalid_id");
                return;
            }

            // ✅ Ensure the status is valid (e.g., only "Pending", "Confirmed", "Cancelled")
            if (!status.equalsIgnoreCase("Pending") &&
                !status.equalsIgnoreCase("Confirmed") &&
                !status.equalsIgnoreCase("Cancelled")) {
                response.sendRedirect("manage_bookings.jsp?error=invalid_status");
                return;
            }

            // ✅ Call DAO to update booking status
            boolean isUpdated = BookingDAO.updateBookingStatus(bookingId, status);

            // ✅ Redirect based on update result
            if (isUpdated) {
                response.sendRedirect("manage_bookings.jsp?success=updated");
            } else {
                response.sendRedirect("manage_bookings.jsp?error=update_failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manage_bookings.jsp?error=exception");
        }
    }
}
