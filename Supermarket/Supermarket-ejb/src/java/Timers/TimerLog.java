package Timers;

import Entities.Time;
import SingletonBeans.SingletonLogBean;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.ejb.Schedule;
import javax.ejb.Singleton;
import javax.ejb.LocalBean;
import javax.naming.InitialContext;
import javax.naming.NamingException;

@Singleton
@LocalBean
public class TimerLog {
    @EJB
    private SingletonLogBean singletonLogBean;
    private String lastInsert;
    private Time timer;
    
    @PostConstruct
    public void crear() {
        timer = getTime();
        createLog();
        lastInsert = "/Supermarket-war";
    }

    private void createLog() {
        try {
            singletonLogBean = (SingletonLogBean) InitialContext.doLookup("java:global/Supermarket/Supermarket-ejb/SingletonLogBean!SingletonBeans.SingletonLogBean");
        } catch (NamingException ex) {
            singletonLogBean.setLog("TimerLog::createLog::Exception");
        }
    }
        
    public void setText(String message) {
        singletonLogBean.setLog(message);
    }
    
    private Time getTime() {
        return new Time(timer.getHour(), timer.getMinutes(), timer.getSeconds());
    }

    @Schedule(hour = "*", minute = "*", second = "*/5")
    public void myTimer() {
        if(lastInsert.equals(singletonLogBean.getLastInsert())) {
            singletonLogBean.setLog(getTime().printTime() + "::TimerLog::myTimer::Esta ocioso.");
        } else {
            lastInsert = singletonLogBean.getLastInsert();
            singletonLogBean.setLog(getTime().printTime() + "::TimerLog::myTimer::Trabajando sin descanso.");
        }
    }
}