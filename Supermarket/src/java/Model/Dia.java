package Model;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class Dia {
    private final int año;
    private final int mes;
    private final int dia;

    public Dia(int hora, int minutos, int segundos) {
        this.año = hora;
        this.mes = minutos;
        this.dia = segundos;
    }

    public Dia() {
        this.año = 0;
        this.mes = 0;
        this.dia = 0;
    }

    public static int dameAño() {
        return GregorianCalendar.getInstance().get(Calendar.YEAR);
    }

    public static int dameMes() {
        return GregorianCalendar.getInstance().get(Calendar.MONTH);
    }

    public static int dameDia() {
        return GregorianCalendar.getInstance().get(Calendar.DATE);
    }

    public String imprimirDia() {
        if(mes<10&&dia<10)
            return año+":0"+mes+":0"+dia;
        else if(mes>=10&&dia<10)
            return año+":"+mes+":0"+dia;
        else if(mes < 10)
            return año+":0"+mes+":"+dia;
        return año+":"+mes+":"+dia;
    }
}