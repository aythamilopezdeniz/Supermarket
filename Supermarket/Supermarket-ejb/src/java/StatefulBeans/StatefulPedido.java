package StatefulBeans;

import Entities.Direction;
import Entities.Time;
import Entities.Date;
import SingletonBeans.SingletonLogBean;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.ejb.EJB;
import javax.ejb.Stateful;
import javax.ejb.LocalBean;
import javax.ejb.PostActivate;
import javax.ejb.PrePassivate;
import javax.naming.InitialContext;
import javax.naming.NamingException;

@Stateful
@LocalBean
public class StatefulPedido {
    @EJB
    private SingletonLogBean singletonLogBean;
    @EJB
    private StatefulCart statefulCart;
    private PrintWriter chargeFile;
    private File file;
    private String hora;
    private String dia;
    private double pvp;
    private String state;
    private Direction direction;
    private int id;
    private static int idUnique = 1;
    private String name;
    
    @PostConstruct
    public void crear() {
        this.hora = time(new Time()).printTime();
        this.dia = day(new Date()).printDate();
        this.pvp = 0;
        this.id = getUniqueId();
        setName();
        this.state = "cola";/*3 Estados(cola->pedido realizado pero no preparado, 
                preparado->pedido preparado para ser entregado en tienda o llevado a domicilio, 
                historial->pedidos realizados ya entregados)*/
        createLog();
        writeFile("StatefulPedidoBean::crear::PostConstruct");
        singletonLogBean.setLog("StatefulPedidoBean::crear::PostConstruct");
    }
    
    private void createLog() {
        try {
            singletonLogBean = (SingletonLogBean) InitialContext.doLookup("java:global/Supermarket/Supermarket-ejb/SingletonLogBean!SingletonBeans.SingletonLogBean");
        } catch (NamingException ex) {
            singletonLogBean.setLog("StatefulPedidoBean::createLog::Exception");
        }
    }
    
    public void createFile() {
        try {
            file = new File("C:\\Users\\aytha\\Desktop\\Supermarket\\Logs\\statefulChargeBeanFile.txt");
//            file = new File("C:\\Users\\Aythami\\Desktop\\Supermarket\\Logs\\statefulChargeBeanFile.txt");
            FileWriter statefulBeanFile = new FileWriter(file, true);
            chargeFile = new PrintWriter(statefulBeanFile);
            singletonLogBean.setLog("StatefulPedidoBean::createFile::estatefulChargeBeanFile.txt");
        } catch (IOException ex) {
            singletonLogBean.setLog("StatefulPedidoBean::createFile::Exception");
        }
    }

    @PostActivate
    public void postActivateFile() {
        writeFile("StatefulPedidoBean::postActivateFile::PostActivate");
        singletonLogBean.setLog("StatefulPedidoBean::postActivateFile::PostActivate");
    }

    public StatefulCart getShoppingCart() {
        writeFile("StatefulPedidoBean::getShoppingCart::" + statefulCart.getListArticles());
        singletonLogBean.setLog("StatefulPedidoBean::getShoppingCart::" + statefulCart.getListArticles());
        return statefulCart;
    }

    public String getHora() {
        writeFile("StatefulPedidoBean::getHora::" + hora);
        singletonLogBean.setLog("StatefulPedidoBean::getHora::" + hora);
        return hora;
    }

    public String getDia() {
        writeFile("StatefulPedidoBean::getDia::" + dia);
        singletonLogBean.setLog("StatefulPedidoBean::getDia::" + dia);
        return dia;
    }

    public double getPvp() {
        writeFile("StatefulPedidoBean::getPvp::" + pvp);
        singletonLogBean.setLog("StatefulPedidoBean::getPvp::" + pvp);
        return pvp;
    }

    public String getState() {
        writeFile("StatefulPedidoBean::getState::" + state);
        singletonLogBean.setLog("StatefulPedidoBean::getState::" + state);
        return state;
    }

    public void setState(String state) {
        writeFile("StatefulPedidoBean::setState::" + state);
        singletonLogBean.setLog("StatefulPedidoBean::setState::" + state);
        this.state = state;
    }

    public Direction getDirection() {
        writeFile("StatefulPedidoBean::getDirection::" + direction);
        singletonLogBean.setLog("StatefulPedidoBean::getDirection::" + direction);
        return direction;
    }

    public void setDirection(Direction direction) {
        this.direction = direction;
        writeFile("StatefulPedidoBean::setDirection::" + direction);
        singletonLogBean.setLog("StatefulPedidoBean::setDirection::" + direction);
    }

    public void setStatefulCart(StatefulCart shoppingCart) {
        this.statefulCart = shoppingCart;
        writeFile("StatefulPedidoBean::setStatefulCart::shoppingCart");
        singletonLogBean.setLog("StatefulPedidoBean::setStatefulCart::shoppingCart");
    }

    public void setPvpCart(double pvpCart) {
        this.pvp = pvpCart;
        writeFile("StatefulPedidoBean::setPvpCart::" + pvpCart +" €");
        singletonLogBean.setLog("StatefulPedidoBean::setPvpCart::" + pvpCart +" €");
    }
    
    public static int getUniqueId() {
        return idUnique++;
    }

    public int getId() {
        writeFile("StatefulPedidoBean::getId::" + id);
        singletonLogBean.setLog("StatefulPedidoBean::getId::" + id);
        return id;
    }

    public String getName() {
        writeFile("StatefulPedidoBean::getName::" + name);
        singletonLogBean.setLog("StatefulPedidoBean::getName::" + name);
        return name;
    }

    public void setName() {
        this.name = "Pedido " + id;
        writeFile("StatefulPedidoBean::setName::" + name);
        singletonLogBean.setLog("StatefulPedidoBean::setName::" + name);
    }

    private Time time(Time hora) {
        writeFile("StatefulPedidoBean::time::");
        singletonLogBean.setLog("StatefulPedidoBean::time::");
        return new Time(hora.getHour(), hora.getMinutes(), hora.getSeconds());
    }

    private Date day(Date dia) {
        writeFile("StatefulPedidoBean::day::");
        singletonLogBean.setLog("StatefulPedidoBean::day::");
        return new Date(dia.getYear(), dia.getMonth(), dia.getDay());
    }

    public void writeFile(String message) {
        createFile();
        chargeFile.println(this.hora + "::StatefulPedidoBean::writeFile::" + message);
        singletonLogBean.setLog("StatefulPedidoBean::writeFile::message");
        chargeFile.close();
    }
    
    @PrePassivate
    public void prePassivateFile() {
        writeFile("StatefulPedidoBean::prePassivateFile::PrePassivate");
        singletonLogBean.setLog("StatefulPedidoBean::prePassivateFile::PrePassivate");
    }
    
    @PreDestroy
    public void remove() {
        this.pvp = 0;
        writeFile("::PreDestroy::");
        singletonLogBean.setLog("StatefulPedidoBean::remove::PreDestroy");
    }
}