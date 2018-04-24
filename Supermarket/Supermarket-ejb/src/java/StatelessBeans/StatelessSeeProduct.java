package StatelessBeans;

import SingletonBeans.SingletonLogBean;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.ejb.Stateless;
import javax.ejb.LocalBean;
import javax.naming.InitialContext;
import javax.naming.NamingException;

@Stateless
@LocalBean
public class StatelessSeeProduct {
    private SingletonLogBean singletonLogBean;
    private BufferedWriter seeProductFile;
    private File file;
    
    @PostConstruct
    public void crear() {
        createLog();
        createFile();
        try {
            seeProductFile.write("Lista productos vistos");
            seeProductFile.newLine();
            singletonLogBean.setLog("StatelessSeeProduct::crear::PostConstruct");
        } catch (IOException ex) {
            singletonLogBean.setLog("StatelessSeeProduct::crear::Exception");
        }
        close();
    }
    
    private void createLog() {
        try {
            singletonLogBean = (SingletonLogBean) InitialContext.doLookup("java:global/Supermarket/Supermarket-ejb/SingletonLogBean!SingletonBeans.SingletonLogBean");
        } catch (NamingException ex) {
            singletonLogBean.setLog("StatelessSeeProduct::createLog::Exception");
        }
    }

    public void createFile() {
        try {
            file = new File("C:\\Users\\aytha\\Desktop\\Supermarket\\Logs\\statelessSeeProductBean.txt");
//            file = new File("C:\\Users\\Aythami\\Desktop\\Supermarket\\Logs\\statelessSeeProductBean.txt");
            FileWriter fileWriter = new FileWriter(file,true);
            seeProductFile = new BufferedWriter(fileWriter);
        } catch (IOException ex) {
            singletonLogBean.setLog("StatelessSeeProduct::createFile::Exception");
        }
    }

    public void setBean(String message) {
        createFile();
        try {
            seeProductFile.write("StatelessSeeProductBean::setBean::" + message);
            seeProductFile.newLine();
            singletonLogBean.setLog("StatelessSeeProduct::setBean::"+message);
            close();
        } catch (IOException ex) {
            singletonLogBean.setLog("StatelessSeeProduct::setBean::Exception");
        }
    }

    public void close() {
        try {
            seeProductFile.close();
            singletonLogBean.setLog("StatelessSeeProduct::close::seeProductFile");
        } catch (IOException ex) {
            singletonLogBean.setLog("StatelessSeeProduct::close::Exception");
        }
    }
    
    @PreDestroy
    public void remove() {
        createFile();
        try {
            seeProductFile.write("::PreDestroy::");
            seeProductFile.newLine();
            singletonLogBean.setLog("StatelessSeeProduct::remove::PreDestroy");
            close();
        } catch (IOException ex) {
            singletonLogBean.setLog("StatelessSeeProduct::remove::Exception");
        }
    }
}