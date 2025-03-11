package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Car;
import model.Driver;
import dao.CarDAO;
import dao.DriverDAO;
import java.io.IOException;
import java.util.List;


@WebServlet("/ManageCarServlet")
public class ManageCarServlet extends HttpServlet {

	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("assignDriver".equals(action)) {
            int carId = Integer.parseInt(request.getParameter("carId"));
            int driverId = Integer.parseInt(request.getParameter("driverId"));

            // Assign the driver to the car
            boolean success = CarDAO.assignDriverToCar(carId, driverId);
            if (success) {
                response.sendRedirect("ManageCarServlet");
            } else {
                // Handle error
                request.setAttribute("error", "Failed to assign driver.");
                doGet(request, response); // Forward back to the page to show the error message
            }
        }

        // Other actions like add, update, delete
    }
}
