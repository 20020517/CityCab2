package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PaymentDAO {

    private Connection conn;

    public PaymentDAO(Connection conn) {
        this.conn = conn;
    }

    // Method to save payment data into the payments table
    public boolean savePayment(int bookingId, String cardholderName, String paymentMethod, String cardNumber, 
                               String expiryDate, String cvv, double amount) {
        String sql = "INSERT INTO payments (booking_id, cardholder_name, payment_method, card_number, expiry_date, cvv, amount) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, bookingId);
            stmt.setString(2, cardholderName);
            stmt.setString(3, paymentMethod);
            stmt.setString(4, cardNumber);
            stmt.setString(5, expiryDate);
            stmt.setString(6, cvv);
            stmt.setDouble(7, amount);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;  // If the payment data is inserted successfully
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
