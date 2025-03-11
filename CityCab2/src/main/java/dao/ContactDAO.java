package dao;

import model.ContactMessage;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ContactDAO {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/citycab"; // Ensure this is correct
    private static final String DB_USER = "root"; // Change if needed
    private static final String DB_PASSWORD = "123456"; // Change if needed

    // Load MySQL JDBC Driver explicitly (optional if auto-loading is working)
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Ensure the driver is loaded
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Retrieve all contact messages
    public static List<ContactMessage> getAllMessages() {
        List<ContactMessage> messages = new ArrayList<>();
        String sql = "SELECT * FROM contact_messages ORDER BY created_at DESC";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                messages.add(new ContactMessage(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("message"),
                        rs.getTimestamp("created_at")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return messages;
    }

    // Insert a new contact message
    public static boolean addMessage(ContactMessage message) {
        String sql = "INSERT INTO contact_messages (name, email, message) VALUES (?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, message.getName());
            pstmt.setString(2, message.getEmail());
            pstmt.setString(3, message.getMessage());

            int rowsInserted = pstmt.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
