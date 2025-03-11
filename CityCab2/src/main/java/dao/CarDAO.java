package dao;
import model.Car;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.ManageCustomer;

public class CarDAO {

    // Method to assign a driver to a car
    public static boolean assignDriverToCar(int carId, int driverId) {
        String query = "UPDATE cars SET driver_id = ? WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, driverId);
            stmt.setInt(2, carId);

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Other methods for adding, updating, deleting cars
    
    public static List<Car> getAllCars() {
        List<Car> carList = new ArrayList<>();
        String query = "SELECT * FROM cars"; // Adjust the query based on your table structure

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                // Assuming you have a Car class with these fields
                Car car = new Car();
                car.setId(rs.getInt("id"));
                car.setModel(rs.getString("model"));
                carList.add(car);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return carList;
    }
}
