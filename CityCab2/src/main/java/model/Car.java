package model;

public class Car {
    private int id;
    private String model;
    private String plateNo;
    private String status;
    private int driverId;
    private Driver driver;  // Add a field for the driver

    // Constructor
    public Car(int id, String model, String plateNo, String status, int driverId, Driver driver) {
        this.id = id;
        this.model = model;
        this.plateNo = plateNo;
        this.status = status;
        this.driverId = driverId;
        this.driver = driver;  // Initialize the driver
    }
    
    public Car() {
        
    }

    // Getter and Setter methods for all fields
    
    public int getId() { return id; }
    public String getModel() { return model; }
    public String getPlateNo() { return plateNo; }
    public String getStatus() { return status; }
    public int getDriverId() { return driverId; }

    // Add the `getDriver()` method to retrieve the driver
    public Driver getDriver() { return driver; }

    public void setId(int id) { this.id = id; }
    public void setModel(String model) { this.model = model; }
    public void setPlateNo(String plateNo) { this.plateNo = plateNo; }
    public void setStatus(String status) { this.status = status; }
    public void setDriverId(int driverId) { this.driverId = driverId; }
    public void setDriver(Driver driver) { this.driver = driver; }
    
   
}
