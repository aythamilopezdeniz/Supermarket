package Timers;

import NoEntities.Time;
import NoEntities.Component;
import NoEntities.ComponentUser;
import SingletonBeans.SingletonEstadisticasBean;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.ejb.Schedule;
import javax.ejb.Singleton;
import javax.ejb.LocalBean;
import javax.naming.InitialContext;
import javax.naming.NamingException;

@Singleton
@LocalBean
public class TimerEstadisticas {
    @EJB
    private SingletonEstadisticasBean singletonEstadisticas;
    private PrintWriter timerEstadisticasFile;
    private Time timer;
    private File file;
    
    @PostConstruct
    public void crear() {
        timer = getTime();
        createEstadisticas();
        createFile();
        timerEstadisticasFile.println("Estadisticas accesos, componentes y usuarios.");
        close();
    }

    private void createEstadisticas() {
        try {
            singletonEstadisticas = (SingletonEstadisticasBean) InitialContext.doLookup("java:global/Supermarket/Supermarket-ejb/SingletonEstadisticasBean!SingletonBeans.SingletonEstadisticasBean");
        } catch (NamingException ex) {}
    }

    public void createFile() {
        try {
            file = new File("C:\\Users\\aytha\\Desktop\\Supermarket\\Logs\\singletonEstadisticasBeanFile.txt");
//            file = new File("C:\\Users\\Aythami\\Desktop\\Supermarket\\Logs\\singletonEstadisticasBeanFile.txt");
            FileWriter statefulBeanFile = new FileWriter(file);
            timerEstadisticasFile = new PrintWriter(statefulBeanFile);
        } catch (IOException ex) {}
    }
    
    public Time getTime() {
        return new Time(timer.getHour(), timer.getMinutes(), timer.getSeconds());
    }
    
    public void setText(String message) {
        createFile();
        timerEstadisticasFile.println(message);
        close();
    }
    
    private void close() {
        timerEstadisticasFile.close();
    }

    @Schedule(second="*/5", minute = "*", hour = "*")
    public void myTimer() {
        createFile();
        timerEstadisticasFile.println("Numero de accesos de usuario " + singletonEstadisticas.getNumAccessUser());
        timerEstadisticasFile.println();
        timerEstadisticasFile.println("Componentes");
        for (Component components : singletonEstadisticas.getComponent())
            timerEstadisticasFile.println("Componente " + components.getComponent());
        timerEstadisticasFile.println();
        timerEstadisticasFile.println("Componentes de Usuario");
        for (ComponentUser components : singletonEstadisticas.getComponentUser())
            timerEstadisticasFile.println(getTime().printTime() + "::Componente " + components.getComponent() + " Usuario " + components.getUser());
        close();
    }
}