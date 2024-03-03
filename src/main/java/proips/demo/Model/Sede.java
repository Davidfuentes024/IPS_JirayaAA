package proips.demo.Model;

public class Sede {
    private long id;
    private String name;
    private String location;
    private String address;

    public Sede(long id, String name, String location, String address) {
        this.id = id;
        this.name = name;
        this.location = location;
        this.address = address;
    }

    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getLocation() {
        return location;
    }

    public String getAddress() {
        return address;
    }

}
