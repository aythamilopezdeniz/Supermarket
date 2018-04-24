package Entities;

public final class Discount {
    private String ticket;
    private final String client;
    private int cantidad;
    private double discount;

    public Discount(Double pvp, String client) {
        this.ticket = "";
        this.client = client;
        this.cantidad = 0;
        establishedDiscount(pvp);
    }

    public String getTicket() {
        return ticket;
    }

    public String getClient() {
        return client;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void addCantidad() {
        this.cantidad++;
    }
    
    public void removeCantidad() {
        this.cantidad--;
    }

    public double getDiscount() {
        return discount;
    }
    
    private void establishedDiscount(Double pvp) {
        if(pvp >= 50.0) {
            setTicket("ticket1");
            setDiscount(10.0);
        }
        if(pvp >=100.0) {
            setTicket("ticket2");
            setDiscount(20.0);
        }
        if(pvp < 50.0) {
            setDiscount(0.0);
        }
    }

    private void setTicket(String name) {
        this.ticket = name;
    }

    private void setDiscount(double discount) {
        this.discount = discount;
    }
}