package StatelessBeans;

import SingletonBeans.SingletonLogBean;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.ejb.LocalBean;
import javax.naming.InitialContext;
import javax.naming.NamingException;

@Stateless
@LocalBean
public class StatelessDiscount {
    @EJB
    private SingletonLogBean singletonLogBean;
    private PrintWriter discountFile;
    private File file;
    private boolean establishedDiscount;
    
    @PostConstruct
    public void crear() {
        createLog();
        createFile();
        establishedDiscount = false;
        discountFile.println("Establecer Descuentos");
        singletonLogBean.setLog("StatelessDiscount::crear::PostConstruct");
        close();
    }

    private void createLog() {
        try {
            singletonLogBean = (SingletonLogBean) InitialContext.doLookup("java:global/Supermarket/Supermarket-ejb/SingletonLogBean!SingletonBeans.SingletonLogBean");
        } catch(NamingException ex) {
            singletonLogBean.setLog("StatelessDiscount::createLog::Exception");
        }
    }

    public void createFile() {
        try {
            file = new File("C:\\Users\\aytha\\Desktop\\Supermarket\\Logs\\statelessDiscountBeanFile.txt");
//            file = new File("C:\\Users\\Aythami\\Desktop\\Supermarket\\Logs\\statelessDiscountBeanFile.txt");
            FileWriter statelessBeanFile = new FileWriter(file, true);
            discountFile = new PrintWriter(statelessBeanFile);
            singletonLogBean.setLog("StatelessDiscount::createFile::statelessDiscountBeanFile.txt");
        } catch (IOException ex) {
            singletonLogBean.setLog("StatelessDiscount::createFile::Exception");
        }
    }
    
    public void setText(String message) {
        createFile();
        establishedDiscount = true;
        discountFile.println("StatelessDiscount::setText::" + message);
        singletonLogBean.setLog("StatelessDiscount::setText::" + message);
        close();
    }
    
    public boolean isEstablished() {
        return establishedDiscount == true;
    }

    private void close() {
        discountFile.close();
        singletonLogBean.setLog("StatelessDiscount::close::discountFile");
    }
    
    @PreDestroy
    public void remove() {
        createFile();
        discountFile.println("StatelessDiscount::remove::PreDestroy");
        singletonLogBean.setLog("StatelessDiscount::remove::PreDestroy");
        close();
    }
}