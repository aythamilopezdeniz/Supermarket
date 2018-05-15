package NoEntities;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class Date {
    private int año;
    private int mes;
    private int dia;

    public Date(int hora, int minutos, int segundos) {
        this.año = hora;
        this.mes = minutos;
        this.dia = segundos;
    }

    public Date() {
        this.año = 0;
        this.mes = 0;
        this.dia = 0;
    }

    public static int getYear() {
        return GregorianCalendar.getInstance().get(Calendar.YEAR);
    }

    public static int getMonth() {
        return GregorianCalendar.getInstance().get(Calendar.MONTH)+1;
    }

    public static int getDay() {
        return GregorianCalendar.getInstance().get(Calendar.DATE);
    }

    public void setDay(int dia) {
        this.dia = dia;
    }

    public void setMonth(int mes) {
        this.mes = mes;
    }

    public void setYear(int año) {
        this.año = año;
    }

    public String printDate() {
        if(mes<10&&dia<10)
            return "0"+dia+":0"+mes+":"+año;
        else if(mes>=10&&dia<10)
            return "0"+dia+":"+mes+":"+año;
        else if(mes < 10)
            return dia+":0"+mes+":"+año;
        return dia+":"+mes+":"+año;
    }
}