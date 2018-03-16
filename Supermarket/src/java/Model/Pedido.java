package Model;

public class Pedido {
    private Cart shoppingCart;
    private final String hora;
    private final String dia;
    private final double pvp;
    private String state;
    
    public Pedido(Cart shoppingCart, double pvp) {
        this.shoppingCart = shoppingCart;
        this.hora = time(new Time()).printTime();
        this.dia = day(new Date()).printDate();
        this.pvp = pvp;
        this.state = "cola";/*3 Estados(cola->pedido realizado pero no preparado, 
                preparado->pedido preparado para ser entregado en tienda o llevado a domicilio, 
                historial->pedidos realizados ya entregados)*/
    }

    public Cart getShoppingCart() {
        return shoppingCart;
    }

    public void setShoppingCart(Cart shoppingCart) {
        this.shoppingCart = shoppingCart;
    }

    public String getHora() {
        return hora;
    }

    public String getDia() {
        return dia;
    }

    public double getPvp() {
        return pvp;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    private Time time(Time hora) {
        return new Time(hora.getHour(), hora.getMinutes(), hora.getSeconds());
    }

    private Date day(Date dia) {
        return new Date(dia.getYear(), dia.getMonth(), dia.getDay());
    }
}