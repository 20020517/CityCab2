package controller;

import dao.BookingDAO;
import dao.CarDAO;
import model.Booking;
import model.Car;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

@WebServlet("/ManageBookingServlet")
public class ManageBookingServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    List<Car> availableCars = CarDAO.getAllCars(); // ✅ Fetch only available cars
	    request.setAttribute("availableCars", availableCars); // ✅ Send to JSP
	    request.getRequestDispatcher("book_car.jsp").forward(request, response);
	}


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {  // ✅ Handling a new booking
            int customerId = Integer.parseInt(request.getParameter("customerId"));
            int carId = Integer.parseInt(request.getParameter("carId"));
            String startLocation = request.getParameter("startLocation");
            String endLocation = request.getParameter("endLocation");
            Timestamp bookingDate = new Timestamp(System.currentTimeMillis());

            Booking booking = new Booking(0, customerId, carId, 0, bookingDate, "Pending", startLocation, endLocation);
            BookingDAO.addBooking(booking);

            // Redirect customer to their bookings page
            response.sendRedirect("CustomerBookingsServlet");

        } else if ("update".equals(action)) {  // ✅ Admin or driver updating status
            int bookingId = Integer.parseInt(request.getParameter("bookingId"));
            String status = request.getParameter("status");
            BookingDAO.updateBookingStatus(bookingId, status);
            response.sendRedirect("ManageBookingServlet");

        } else if ("delete".equals(action)) {  // ✅ Admin deleting a booking
            int bookingId = Integer.parseInt(request.getParameter("bookingId"));
            BookingDAO.deleteBooking(bookingId);
            response.sendRedirect("ManageBookingServlet");
        }
    }
}
