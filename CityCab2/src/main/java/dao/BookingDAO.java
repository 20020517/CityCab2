package dao;

import model.Booking;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {

    // Get all bookings (for Admin)
    public static List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM booking";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Booking booking = new Booking(
                    rs.getInt("id"),
                    rs.getInt("customer_id"),
                    rs.getInt("car_id"),
                    rs.getInt("driver_id"),
                    rs.getTimestamp("booking_date"),
                    rs.getString("status"),
                    rs.getString("start_location"),
                    rs.getString("end_location")
                );
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    // Get bookings for a specific customer
    public static List<Booking> getBookingsByCustomer(int customerId) {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT *,cars.driver_id FROM booking  inner join cars on cars.id = booking.car_id WHERE customer_id = ?";
System.out.print(customerId);
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            stmt.setInt(1, customerId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Booking booking = new Booking(
                    rs.getInt("booking_id"),
                    rs.getInt("customer_id"),
                    rs.getInt("car_id"),
                    rs.getInt("driver_id"),
                    rs.getTimestamp("booking_date"),
                    rs.getString("status"),
                    rs.getString("start_location"),
                    rs.getString("end_location")
                );
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    // Add a new booking
    public static boolean addBooking(Booking booking) {
        String sql = "INSERT INTO booking (customer_id, car_id, driver_id, booking_date, status, start_location, end_location) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, booking.getCustomerId());
            stmt.setInt(2, booking.getCarId());
            stmt.setInt(3, booking.getDriverId());
            stmt.setTimestamp(4, booking.getBookingDate());
            stmt.setString(5, booking.getStatus());
            stmt.setString(6, booking.getStartLocation());
            stmt.setString(7, booking.getEndLocation());

            return stmt.executeUpdate() > 0; // Returns true if inserted successfully

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}

