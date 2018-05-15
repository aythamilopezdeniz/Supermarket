package NoEntities;

public class Component {
    private final String component;
    private int value;

    public Component(String component) {
        this.component = component;
        this.value = 1;
    }

    public String getComponent() {
        return component;
    }

    public int getValue() {
        return value;
    }

    public void setValue() {
        this.value++;
    }
}