package controller;

import dao.DriverDAO;
import model.Driver;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ManageDriverServlet")
public class ManageDriverServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Driver> driverList = DriverDAO.getAllDrivers();

        if (driverList == null) {
            driverList = List.of();
        }

        request.setAttribute("drivers", driverList);
        request.getRequestDispatcher("manage_drivers.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String name = request.getParameter("name");
            String licenseNo = request.getParameter("licenseNo");
            String phone = request.getParameter("phone");
            String nic = request.getParameter("nic");

            Driver driver = new Driver(0, name, licenseNo, phone, nic);
            DriverDAO.addDriver(driver);

        } else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String licenseNo = request.getParameter("licenseNo");
            String phone = request.getParameter("phone");
            String nic = request.getParameter("nic");

            Driver driver = new Driver(id, name, licenseNo, phone, nic);
            boolean success = DriverDAO.updateDriver(driver);
            System.out.println("Driver update status: " + success);

        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            boolean success = DriverDAO.deleteDriver(id);
            System.out.println("Driver deleted successfully: " + success);
        }

        // Redirect to refresh the page and update the driver list
        response.sendRedirect(request.getContextPath() + "/ManageDriverServlet");
    }
}
