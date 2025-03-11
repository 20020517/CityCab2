package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.ManageCustomer;

public class ManageCustomerDAO {

    // Retrieve all customers from database
    public static List<ManageCustomer> getAllCustomers() {
        List<ManageCustomer> customerList = new ArrayList<>();
        String query = "SELECT * FROM customers";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                ManageCustomer customer = new ManageCustomer(
                    rs.getInt("customer_id"),
                    rs.getString("name"),
                    rs.getString("address"),
                    rs.getString("phone"),
                    rs.getString("nic")
                );
                customerList.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    // Add a new customer
    public static boolean addCustomer(ManageCustomer customer) {
        String query = "INSERT INTO customers (name, address, phone, nic) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, customer.getName());
            stmt.setString(2, customer.getAddress());
            stmt.setString(3, customer.getPhone());
            stmt.setString(4, customer.getNic());

            int rowsInserted = stmt.executeUpdate();
            System.out.println("Rows inserted: " + rowsInserted); // Debugging output
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
