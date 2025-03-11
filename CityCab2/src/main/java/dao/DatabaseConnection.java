package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.Booking;

public class DatabaseConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/citycab";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "123456";

    // Get the database connection
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    // Method to save payment details in the database
    public void savePaymentData(int bookingId, String cardholderName, String paymentMethod, String cardNumber, String expiryDate, String cvv, double amount) {
        String query = "INSERT INTO payments (booking_id, cardholder_name, payment_method, card_number, expiry_date, cvv, amount) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, bookingId);
            stmt.setString(2, cardholderName);
            stmt.setString(3, paymentMethod);
            stmt.setString(4, cardNumber);
            stmt.setString(5, expiryDate);
            stmt.setString(6, cvv);
            stmt.setDouble(7, amount);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to update booking status
    public void updateBookingStatus(int bookingId, String status) {
        String query = "UPDATE bookings SET status = ? WHERE booking_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, status);
            stmt.setInt(2, bookingId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

	public Booking getBookingById(int bookingId) {
		// TODO Auto-generated method stub
		return null;
	}

	public int executeUpdate(String query, Integer customerId, int carId, String startLocation, String endLocation,
			String string) {
		// TODO Auto-generated method stub
		return 0;
	}
}
