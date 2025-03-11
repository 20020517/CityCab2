package model;

public class Driver {
    private int id;
    private String name;
    private String licenseNo;
    private String phone;
    private String nic;

    // Constructor
    public Driver(int id, String name, String licenseNo, String phone, String nic) {
        this.id = id;
        this.name = name;
        this.licenseNo = licenseNo;
        this.phone = phone;
        this.nic = nic;
    }

    public Driver() {
		 
	}

	// Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getLicenseNo() { return licenseNo; }
    public void setLicenseNo(String licenseNo) { this.licenseNo = licenseNo; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getNic() { return nic; }
    public void setNic(String nic) { this.nic = nic; }
}
