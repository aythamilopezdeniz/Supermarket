package SingletonBeans;

import java.util.ArrayList;
import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.ejb.Singleton;
import javax.ejb.LocalBean;

@Singleton
@LocalBean
public class SingletonLogBean {
    private ArrayList<String> log;
    private String lastInsert;
    
    @PostConstruct
    public void init() {
        log = new ArrayList();
        lastInsert = "";
    }

    public void setLog(String message) {
        lastInsert = message;
        log.add(message);
    }
    
    public ArrayList<String> getLog() {
        return log;
    }

    public String getLastInsert() {
        return lastInsert;
    }
    
    @PreDestroy
    public void remove() {
        log.removeAll(log);
    }
}