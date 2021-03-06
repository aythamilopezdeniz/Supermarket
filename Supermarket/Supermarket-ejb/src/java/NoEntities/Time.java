package NoEntities;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class Time {
    private final int hora;
    private final int minutos;
    private final int segundos;

    public Time(int hora, int minutos, int segundos) {
        this.hora = hora;
        this.minutos = minutos;
        this.segundos = segundos;
    }

    public Time() {
        this.hora = 0;
        this.minutos = 0;
        this.segundos = 0;
    }

    public static int getHour() {
        return GregorianCalendar.getInstance().get(Calendar.HOUR_OF_DAY);
    }

    public static int getMinutes() {
        return GregorianCalendar.getInstance().get(Calendar.MINUTE);
    }

    public static int getSeconds() {
        return GregorianCalendar.getInstance().get(Calendar.SECOND);
    }

    public String printTime() {
        if(minutos<10&&segundos<10)
            return hora+":0"+minutos+":0"+segundos;
        else if(minutos>=10&&segundos<10)
            return hora+":"+minutos+":0"+segundos;
        else if(minutos < 10)
            return hora+":0"+minutos+":"+segundos;
        return hora+":"+minutos+":"+segundos;
    }
}