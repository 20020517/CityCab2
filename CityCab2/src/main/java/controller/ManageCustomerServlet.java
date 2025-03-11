package controller;

import dao.CustomerDAO;
import model.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ManageCustomerServlet")
public class ManageCustomerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customers = CustomerDAO.getAllCustomers();
        request.setAttribute("customerList", customers);
        request.getRequestDispatcher("/manage_customers.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String nic = request.getParameter("nic");
            String phone = request.getParameter("phone");

            Customer customer = new Customer(0, name, address, nic, phone);
            CustomerDAO.addCustomer(customer);
        } else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String nic = request.getParameter("nic");
            String phone = request.getParameter("phone");

            Customer customer = new Customer(id, name, address, nic, phone);
            CustomerDAO.updateCustomer(customer);
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("customer_id"));
            CustomerDAO.deleteCustomer(id);
        }

        response.sendRedirect("ManageCustomerServlet");
    }
}
