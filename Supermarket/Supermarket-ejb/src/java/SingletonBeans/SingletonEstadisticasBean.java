package SingletonBeans;

import Entities.ComponentUser;
import Entities.Component;
import Timers.TimerEstadisticas;
import java.util.ArrayList;
import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.ejb.EJB;
import javax.ejb.Singleton;
import javax.ejb.LocalBean;
import javax.naming.InitialContext;
import javax.naming.NamingException;

@Singleton
@LocalBean
public class SingletonEstadisticasBean {
    @EJB
    private SingletonLogBean singletonLogBean;
    @EJB
    private TimerEstadisticas timerEstadisticas;
    private ArrayList<ComponentUser> componentsUser;
    private ArrayList<Component> components;
    private int numAccessUser;
    
    @PostConstruct
    public void crear() {
        createLog();
        createTimerEstadisticas();
        numAccessUser = 0;
        components = new ArrayList<>();
        componentsUser = new ArrayList<>();
        singletonLogBean.setLog("SingletonEstadisticasBean::crear::PostConstruct");
    }
    
    private void createLog() {
        try {
            singletonLogBean = (SingletonLogBean) InitialContext.doLookup("java:global/Supermarket/Supermarket-ejb/SingletonLogBean!SingletonBeans.SingletonLogBean");
        } catch (NamingException ex) {
            singletonLogBean.setLog("SingletonEstadisticasBean::createLog::Exception");
        }
    }
    
    private void createTimerEstadisticas() {
        try {
            timerEstadisticas = (TimerEstadisticas) InitialContext.doLookup("java:global/Supermarket/Supermarket-ejb/TimerEstadisticas!Timers.TimerEstadisticas");
        } catch (NamingException ex) {
            singletonLogBean.setLog("SingletonEstadisticasBean::createTimerEstadisticas::Exception");
        }
    }
    
    public void setNewAccessUser() {
        numAccessUser++;
        singletonLogBean.setLog("SingletonEstadisticasBean::setNewAccessUser::" + numAccessUser);
    }

    public void deleteAccessUser() {
        numAccessUser--;
        singletonLogBean.setLog("SingletonEstadisticasBean::deleteNewAccessUser::" + numAccessUser);
    }
    
    public int getNumAccessUser() {
        singletonLogBean.setLog("SingletonEstadisticasBean::getNumAccessUser::" + numAccessUser);
        return numAccessUser;
    }
    
    public void setAccessComponents(String componente) {
        Component component = existComponent(componente);
        if(component != null)
            component.setValue();
        else
            components.add(new Component(componente));
        singletonLogBean.setLog("SingletonEstadisticasBean::setAccessComponents::" + componente);
    }

    private Component existComponent(String componente) {
        for (Component component : components) {
            if(component.getComponent().equals(componente))
                return component;
        }
        singletonLogBean.setLog("SingletonEstadisticasBean::existComponent::" + componente);
        return null;
    }
    
    public ArrayList<Component> getComponent() {
        singletonLogBean.setLog("SingletonEstadisticasBean::getComponent::" + getListComponents());
        return components;
    }

    public String getListComponents() {
        String string = "";
        for (int i = 0; i < components.size(); i++) {
            string+="Componente " + components.get(i).getComponent() + " - Valor " + components.get(i).getValue()+ "  ";
        }
        singletonLogBean.setLog("SingletonEstadisticasBean::getListComponents::" + string);
        return string;
    }
    
    public int getNumAccess(String access, ArrayList listAccess) {
        int numAccess = 0;
        for (Object pages : listAccess) {
            if(pages.equals(access))numAccess++;
        }
        singletonLogBean.setLog("SingletonEstadisticasBean::getNumAccess::" + numAccess);
        return numAccess;
    }
    
    public void setComponentsUser(String component, String user) {
        ComponentUser componentByUser = componentVisitedUser(component, user);
        if(componentByUser != null)
            componentByUser.setValue();
        else
            componentsUser.add(new ComponentUser(component, user));
        singletonLogBean.setLog("SingletonEstadisticasBean::setComponentsUser::" + component + "-" + user);
    }
    
    private ComponentUser componentVisitedUser(String component, String user) {
        for (ComponentUser componentes : componentsUser) {
            if(componentes.getComponent().equals(component) && componentes.getUser().equals(user))
                return componentes;
        }
        singletonLogBean.setLog("SingletonEstadisticasBean::componentVisitedUser::" + component + "-" + user);
        return null;
    }
    
    public String getComponentVisitedByUser(String user) {
        ArrayList<ComponentUser> componenteByUser = new ArrayList();
        for (ComponentUser componentes : componentsUser) {
            if(componentes.getUser().equals(user))
                componenteByUser.add(componentes);
        }
        singletonLogBean.setLog("SingletonEstadisticasBean::getComponentVisitedByUser::" + user);
        return getList(componenteByUser);
    }

    private String getList(ArrayList<ComponentUser> componenteByUser) {
        String string = "";
        for (int i = 0; i < componenteByUser.size(); i++) {
            string+="Componente " + componenteByUser.get(i).getComponent() + " Valor " + componenteByUser.get(i).getValue()+ "  ";
        }
        singletonLogBean.setLog("SingletonEstadisticasBean::getList::" + string);
        return string;
    }
    
    public ArrayList<ComponentUser> getComponentUser() {
        singletonLogBean.setLog("SingletonEstadisticasBean::getComponentUser::" + getList(componentsUser));
        return componentsUser;
    }
    
    @PreDestroy
    public void remove() {
        numAccessUser = 0;
        components.removeAll(components);
        componentsUser.removeAll(componentsUser);
        singletonLogBean.setLog("SingletonEstadisticasBean::remove::PreDestroy");
    }
}