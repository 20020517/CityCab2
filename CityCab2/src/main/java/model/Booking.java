package model;

import java.sql.Timestamp;

public class Booking {
    private int id;
    private int customerId;
    private int carId;
    private int driverId;
    private Timestamp bookingDate;
    private String status;
    private String startLocation;
    private String endLocation;

    // Constructor
    public Booking() {}

    public Booking(int id, int customerId, int carId, int driverId, Timestamp bookingDate, String status, String startLocation, String endLocation) {
        this.id = id;
        this.customerId = customerId;
        this.carId = carId;
        this.driverId = driverId;
        this.bookingDate = bookingDate;
        this.status = status;
        this.startLocation = startLocation;
        this.endLocation = endLocation;
    }

    // Getters
    public int getId() { return id; }
    public int getCustomerId() { return customerId; }
    public int getCarId() { return carId; }
    public int getDriverId() { return driverId; }
    public Timestamp getBookingDate() { return bookingDate; }
    public String getStatus() { return status; }
    public String getStartLocation() { return startLocation; }
    public String getEndLocation() { return endLocation; }

    // Setters
    public void setId(int id) { this.id = id; }
    public void setCustomerId(int customerId) { this.customerId = customerId; }
    public void setCarId(int carId) { this.carId = carId; }
    public void setDriverId(int driverId) { this.driverId = driverId; }
    public void setBookingDate(Timestamp bookingDate) { this.bookingDate = bookingDate; }
    public void setStatus(String status) { this.status = status; }
    public void setStartLocation(String startLocation) { this.startLocation = startLocation; }
    public void setEndLocation(String endLocation) { this.endLocation = endLocation; }
}
