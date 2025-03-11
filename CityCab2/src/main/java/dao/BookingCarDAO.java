package dao;

import model.BookingCar;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingCarDAO {

    // Fetch all bookings
    public static List<BookingCar> getAllBookings() {
        List<BookingCar> bookingList = new ArrayList<>();
        String query = "SELECT * FROM booking_car";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                BookingCar booking = new BookingCar(
                    rs.getInt("id"),
                    rs.getInt("customer_id"),
                    rs.getInt("car_id"),
                    rs.getString("start_location"),
                    rs.getString("end_location"),
                    rs.getTimestamp("booking_date"),
                    rs.getString("status")
                );
                bookingList.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookingList;
    }

    // Add a new booking
    public static boolean addBooking(BookingCar booking) {
        String query = "INSERT INTO booking_car (customer_id, car_id, start_location, end_location, booking_date, status) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, booking.getCustomerId());
            stmt.setInt(2, booking.getCarId());
            stmt.setString(3, booking.getStartLocation());
            stmt.setString(4, booking.getEndLocation());
            stmt.setTimestamp(5, booking.getBookingDate());
            stmt.setString(6, booking.getStatus());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
