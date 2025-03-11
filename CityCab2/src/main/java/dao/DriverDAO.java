package dao;

import model.Driver;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DriverDAO {

    // Fetch all drivers
    public static List<Driver> getAllDrivers() {
        List<Driver> driverList = new ArrayList<>();
        String query = "SELECT * FROM drivers";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Driver driver = new Driver(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("license_no"),
                    rs.getString("phone"),
                    rs.getString("nic")
                );
                driverList.add(driver);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return driverList;
    }

    // Add a new driver
    public static boolean addDriver(Driver driver) {
        String query = "INSERT INTO drivers (name, license_no, phone, nic) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, driver.getName());
            stmt.setString(2, driver.getLicenseNo());
            stmt.setString(3, driver.getPhone());
            stmt.setString(4, driver.getNic());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // ✅ Update driver details
    public static boolean updateDriver(Driver driver) {
        String query = "UPDATE drivers SET name=?, license_no=?, phone=?, nic=? WHERE id=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, driver.getName());
            stmt.setString(2, driver.getLicenseNo());
            stmt.setString(3, driver.getPhone());
            stmt.setString(4, driver.getNic());
            stmt.setInt(5, driver.getId());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // ✅ Delete driver
    public static boolean deleteDriver(int id) {
        String query = "DELETE FROM drivers WHERE id=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public List<Driver> selectAllDrivers() throws SQLException {
        List<Driver> drivers = new ArrayList<>();
        String sql = "SELECT * FROM drivers ";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Driver driver = new Driver();
                driver.setId(rs.getInt("id"));
                driver.setName(rs.getString("name"));  

                drivers.add(driver);
            }
        }
        return drivers;
    }
}


