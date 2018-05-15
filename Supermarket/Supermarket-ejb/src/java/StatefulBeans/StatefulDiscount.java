package StatefulBeans;

import NoEntities.Discount;
import NoEntities.Time;
import SingletonBeans.SingletonLogBean;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
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
public class StatefulDiscount {
    @EJB
    private SingletonLogBean singletonLogBean;
    private ArrayList<Discount> ticketsDiscount;
    private PrintWriter discountFile;
    private File file;
    private Time timer;
    
    @PostConstruct
    public void crear() {
        ticketsDiscount = new ArrayList<>();
        timer = getTime();
        createLog();
        writeFile("Lista de Descuentos de Usuario");
        singletonLogBean.setLog("StatefulDiscountBean::crear::PostConstruct");
    }
    
    private void createLog() {
        try {
            singletonLogBean = InitialContext.doLookup("java:global/Supermarket/Supermarket-ejb/SingletonLogBean!SingletonBeans.SingletonLogBean");
        } catch (NamingException ex) {
            singletonLogBean.setLog("StatefulDiscountBean::createLog::Exception");
        }
    }

    private void createFile() {
        try {
            file = new File("C:\\Users\\aytha\\Desktop\\Supermarket\\Logs\\statefulDiscountBeanFile.txt");
//            file = new File("C:\\Users\\Aythami\\Desktop\\Supermarket\\Logs\\statefulDiscountBeanFile.txt");
            FileWriter statefulBeanFile = new FileWriter(file, true);
            discountFile = new PrintWriter(statefulBeanFile);
            singletonLogBean.setLog("StatefulDiscountBean::createFile::statefulDiscountBeanFile.txt");
        } catch (IOException ex) {
            singletonLogBean.setLog("StatefulDiscountBean::createFile::Exception");
        }
    }
    
    @PostActivate
    public void postActivateFile() {
        writeFile("StatefulDiscountBean::postActivateFile::PostActivate");
        discountFile.println("StatefulDiscountBean::postActivateFile::PostActivate");
    }
    
    public void addDiscount(Discount discount, String client) {
        Discount ticket = existTickect(discount);
        if(ticket == null) {
            discount.addCantidad();
            ticketsDiscount.add(discount);
        }
        else
            ticket.addCantidad();
        writeFile("StatefulDiscountBean::addDiscount::" + discount.getTicket() + "::Cliente::" + client);
        singletonLogBean.setLog("StatefulDiscountBean::addDiscount::" + discount.getTicket() + "::Cliente::" + client);
    }

    private Discount existTickect(Discount discount) {
        for (Discount ticket : ticketsDiscount) {
            if(ticket.getTicket().equals(discount.getTicket()) && ticket.getClient().equals(discount.getClient())) {
                writeFile("StatefulDiscountBean::existDiscount::" + discount.getTicket());
                singletonLogBean.setLog("StatefulDiscountBean::existDiscount::" + discount.getTicket());
                return ticket;
            }
        }
        writeFile("StatefulDiscountBean::existDiscount::null");
        singletonLogBean.setLog("StatefulDiscountBean::existDiscount::null");
        return null;
    }
    
    public void removeTickectDiscount(Discount discount, String client) {
        if(repeteadDiscount(discount, client))
            discount.removeCantidad();
        if(discount.getCantidad() == 0)
            ticketsDiscount.remove(getPositionDiscount(discount));
        writeFile("StatefulDiscountBean::removeTicketDiscount::" + discount.getTicket() + "::Cliente::" + client);
        singletonLogBean.setLog("StatefulDiscountBean::removeTicketDiscount::" + discount.getTicket() + "::Cliente::" + client);
    }
    
    public boolean repeteadDiscount(Discount discount, String client) {
        for (Discount tickets : ticketsDiscount) {
            if(tickets.getTicket().equals(discount.getTicket()) && tickets.getClient().equals(client) && tickets.getCantidad() > 0) {
                writeFile("StatefulDiscountBean::repeteadDiscount::" + discount.getTicket());
                singletonLogBean.setLog("StatefulDiscountBean::repeteadDiscount::" + discount.getTicket());
                return true;
            }
        }
        writeFile("StatefulDiscountBean::repeteadDiscount::false");
        singletonLogBean.setLog("StatefulDiscountBean::repeteadDiscount::false");
        return false;
    }
    
    private int getPositionDiscount(Discount descuento) {
        int position = 0;
        Iterator<Discount> tickets = ticketsDiscount.iterator();
        while(tickets.hasNext()) {
            Discount discount = tickets.next();
            if(discount.getTicket().equals(descuento.getTicket()) && discount.getClient().equals(descuento.getClient())) {
                writeFile("StatefulDiscountBean::getPositionDiscount::" + descuento.getTicket() + "::" + descuento.getClient());
                singletonLogBean.setLog("StatefulDiscountBean::getPositionDiscount::" + descuento.getTicket() + "::" + descuento.getClient());
                return position;
            }
            position++;
        }
        writeFile("StatefulDiscountBean::getPositionDiscount::0");
        singletonLogBean.setLog("StatefulDiscountBean::getPositionDiscount::0");
        return position;
    }
    
    public Discount getDiscount(String name) {
        for (Discount discount : ticketsDiscount) {
            if(discount.getTicket().equals(name)) {
                writeFile("StatefulDiscountBean::getDiscount::" + name);
                singletonLogBean.setLog("StatefulDiscountBean::getDiscount::" + name);
                return discount;
            }
        }
        writeFile("StatefulDiscountBean::getDiscount::null");
        singletonLogBean.setLog("StatefulDiscountBean::getDiscount::null");
        return null;
    }
    
    @PrePassivate
    public void saveFile() {
        writeFile("StatefulDiscountBean::writeFile::PrePassivate");
        for (Discount tickets : ticketsDiscount) {
            writeFile("Ticket: " + tickets.getTicket()+ " " + tickets.getClient()+ 
                    " Descuento: " + tickets.getDiscount() + " €");
        }
        singletonLogBean.setLog("StatefulDiscountBean::writeFile::PrePassivate");
    }

    public ArrayList<Discount> getList() {
        writeFile("StatefulDiscountBean::getList::getTicketsDiscount");
        singletonLogBean.setLog("StatefulDiscountBean::getList::getTicketsDiscount");
        return ticketsDiscount;
    }
    
    private Time getTime() {
        singletonLogBean.setLog("StatefulDiscountBean::getTime::");
        return new Time(timer.getHour(), timer.getMinutes(), timer.getSeconds());
    }
    
    public void writeFile(String message) {
        createFile();
        discountFile.println(getTime().printTime() + "::" + message);
        discountFile.close();
        singletonLogBean.setLog("StatefulDiscountBean::writeFile::message");
    }
    
    @PreDestroy
    public void remove() {
        writeFile("::PreDestroy::");
        singletonLogBean.setLog("StatefulDiscountBean::remove::PreDestroy");
        ticketsDiscount.removeAll(ticketsDiscount);
    }
}