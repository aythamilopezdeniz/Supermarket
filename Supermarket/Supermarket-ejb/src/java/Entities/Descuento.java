package Entities;

import java.util.ArrayList;

public class Descuento {
    private final int discount;

    public Descuento(int value) {
        this.discount = value;
    }
    
    public ArrayList<String> getDiscountArticle() {
        switch(discount) {
            case 1: return getArrayList1();
            case 2: return getArrayList2();
            case 3: return getArrayList3();
        }
        return new ArrayList<>();
    }

    private ArrayList<String> getArrayList1() {
        ArrayList list = new ArrayList();
        list.add("pastas");
        list.add("agua");
        list.add("drogueria");
        return list;
    }

    private ArrayList<String> getArrayList2() {
        ArrayList list = new ArrayList();
        list.add("vinos");
        list.add("preparados");
        list.add("congelados");
        return list;
    }

    private ArrayList<String> getArrayList3() {
        ArrayList list = new ArrayList();
        list.add("papeleria");
        list.add("limpieza");
        list.add("lacteos");
        return list;
    }

    public int getValue() {
        return discount*10;
    }
}