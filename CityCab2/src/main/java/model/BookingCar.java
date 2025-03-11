package model;

import java.sql.Timestamp;

public class BookingCar {
    private int id;
    private int customerId;
    private int carId;
    private String startLocation;
    private String endLocation;
    private Timestamp bookingDate;
    private String status;

    // Constructor
    public BookingCar(int id, int customerId, int carId, String startLocation, String endLocation, Timestamp bookingDate, String status) {
        this.id = id;
        this.customerId = customerId;
        this.carId = carId;
        this.startLocation = startLocation;
        this.endLocation = endLocation;
        this.bookingDate = bookingDate;
        this.status = status;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getCarId() {
        return carId;
    }

    public void setCarId(int carId) {
        this.carId = carId;
    }

    public String getStartLocation() {
        return startLocation;
    }

    public void setStartLocation(String startLocation) {
        this.startLocation = startLocation;
    }

    public String getEndLocation() {
        return endLocation;
    }

    public void setEndLocation(String endLocation) {
        this.endLocation = endLocation;
    }

    public Timestamp getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Timestamp bookingDate) {
        this.bookingDate = bookingDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
