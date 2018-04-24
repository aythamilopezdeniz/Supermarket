package Entities;

import StatefulBeans.StatefulCart;
import java.util.ArrayList;

public class Pedido {

    private final ArrayList<Article> cart;
    private final double pvpCart;
    private int uniqueId = 1;
    private final int id;
    private String name;

    public Pedido(StatefulCart cart, double pvpCart) {
        this.cart = cart.getCart();
        this.pvpCart = pvpCart;
        this.id = getUniqueId();
        setName(this.id);
    }

    public ArrayList<Article> getCart() {
        return cart;
    }

    public double getPvpCart() {
        return pvpCart;
    }

    public int getId() {
        return id;
    }

    private void setName(int id) {
        this.name = "Pedido " + id;
    }
    
    public int getUniqueId() {
        return uniqueId++;
    }
}