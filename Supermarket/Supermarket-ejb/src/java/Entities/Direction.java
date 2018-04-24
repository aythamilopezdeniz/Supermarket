package Entities;

public class Direction {
    private final String name;
    private final String surname;
    private final String direction;
    private String postalCode;

    public Direction(String name, String surname, String meetingPoint) {
        this.name = name;
        this.surname = surname;
        this.direction = meetingPoint;
        this.postalCode = "";
    }

    public String getName() {
        return name;
    }

    public String getSurname() {
        return surname;
    }

    public String getDirection() {
        return direction;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }
}