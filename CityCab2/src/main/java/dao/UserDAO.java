package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.User;

public class UserDAO {
	 public static int registerUser(User user) {
	        String sql = "INSERT INTO users (username, password,role) VALUES (?, ?, ?)";
	        int userId = -1;

	        try (Connection conn = DBConnection.getConnection();
	             PreparedStatement stmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
	            
	            stmt.setString(1, user.getUsername());
	            stmt.setString(2, user.getPassword()); 
//	            stmt.setString(4, user.getEmail());
	            stmt.setString(3, user.getRole());

	            int rowsAffected = stmt.executeUpdate();
	            if (rowsAffected > 0) {
	                try (ResultSet rs = stmt.getGeneratedKeys()) {
	                    if (rs.next()) {
	                        userId = rs.getInt(1);
	                    }
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return userId;
	    }
	 
	
    public static User authenticateUser(String username, String password) {
        User user = null;
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM users WHERE username=? AND password=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            
            
            ResultSet rs = stmt.executeQuery();
//            int count = 0;
//            while (rs.next()) {
//                count++;
//            }
//            System.out.println("Row Count: " + count);
            if (rs.next()) {
                user = new User( rs.getString("username"), rs.getString("password"), rs.getString("role"));
                user.setUserId( rs.getInt("user_id"));
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
