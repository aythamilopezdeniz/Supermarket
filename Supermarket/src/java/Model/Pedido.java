package Model;

import java.util.ArrayList;

public class Pedido {
    private ArrayList<String> shoppingCart;
    private final String hora;
    private final String dia;
    private final double pvp;
    
    public Pedido(ArrayList<String> shoppingCart, double pvp) {
        this.shoppingCart = shoppingCart;
        this.hora = time(new Hora()).imprimirHora();
        this.dia = day(new Dia()).imprimirDia();
        this.pvp = pvp;
    }

    public ArrayList<String> getShoppingCart() {
        return shoppingCart;
    }

    public void setShoppingCart(ArrayList<String> shoppingCart) {
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

    private Hora time(Hora hora) {
        return new Hora(hora.dameHoras(), hora.dameMinutos(), hora.dameSegundos());
    }

    private Dia day(Dia dia) {
        return new Dia(dia.dameAño(), dia.dameMes(), dia.dameDia());
    }
}