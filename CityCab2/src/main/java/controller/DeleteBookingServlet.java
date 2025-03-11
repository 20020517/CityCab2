package controller;

import dao.BookingDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteBookingServlet") // ✅ Servlet Mapping
public class DeleteBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int bookingId = Integer.parseInt(request.getParameter("id"));

           
            boolean isDeleted = BookingDAO.deleteBooking(bookingId);

            if (isDeleted) {
                response.sendRedirect("ManageBookingServlet?success=true");
            } else {
                response.sendRedirect("ManageBookingServlet?error=true");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ManageBookingServlet?error=true");
        }
    }
}
