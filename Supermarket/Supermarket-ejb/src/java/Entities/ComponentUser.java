package Entities;

public class ComponentUser {
    private final String component;
    private final String user;
    private int value;
    
    public ComponentUser(String component, String user) {
        this.component = component;
        this.user = user;
        this.value = 1;
    }

    public String getComponent() {
        return component;
    }
    
    public String getUser() {
        return user;
    }

    public void setValue() {
        this.value++;
    }

    public int getValue() {
        return value;
    }
}