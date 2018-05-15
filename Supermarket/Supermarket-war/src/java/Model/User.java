package Model;

import Entities.CreditCard;
import StatefulBeans.StatefulPedido;
import java.util.ArrayList;

public class User {
    private String name;
    private String surnames;
    private String born;
    private String user;
    private String email;
    private String password;
    private CreditCard creditCardNumber;
    private final String type;
    private final int id;
    private static int uniqueId = 0;
    private final ArrayList<StatefulPedido> pedido;

    public User(String name, String surnames, String born, String user, String email, String password, String type) {
        this.name = name;
        this.surnames = surnames;
        this.born = born;
        this.user = user;
        this.email = email;
        this.password = password;
        this.type = type;
        this.id = getUniqueId();
        this.pedido = new ArrayList();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurnames() {
        return surnames;
    }

    public void setSurnames(String surnames) {
        this.surnames = surnames;
    }

    public String getBorn() {
        return born;
    }

    public void setBorn(String born) {
        this.born = born;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getType() {
        return type;
    }

    public int getId() {
        return id;
    }
    
    public static int getUniqueId() {
        return uniqueId++;
    }

    public ArrayList<StatefulPedido> getPedido() {
        return pedido;
    }

    public void setPedido(StatefulPedido pedido) {
        this.pedido.add(pedido);
    }

    public CreditCard getCreditCardNumber() {
        return creditCardNumber;
    }

//    public void setCreditCardNumber(String creditCardNumber, String expiration) {
//        this.creditCardNumber = new CreditCard(creditCardNumber, expiration);
//    }
}