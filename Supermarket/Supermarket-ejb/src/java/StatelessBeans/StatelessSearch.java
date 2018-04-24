package StatelessBeans;

import SingletonBeans.SingletonLogBean;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.ejb.Stateless;
import javax.ejb.LocalBean;
import javax.naming.InitialContext;
import javax.naming.NamingException;

@Stateless
@LocalBean
public class StatelessSearch {
    private SingletonLogBean singletonLogBean;
    private PrintWriter searchFile;
    private File file;
    
    @PostConstruct
    public void crear() {
        createLog();
        createFile();
        searchFile.println("Comienza las búsquedas");
        singletonLogBean.setLog("StatelessSearchBean::crear::PostConstruct");
        close();
    }
    
    private void createLog() {
        try {
            singletonLogBean = (SingletonLogBean) InitialContext.doLookup("java:global/Supermarket/Supermarket-ejb/SingletonLogBean!SingletonBeans.SingletonLogBean");
        } catch(NamingException ex) {
            singletonLogBean.setLog("StatelessSearchBean::createLog::Exception");
        }
    }

    public void createFile() {
        try {
            file = new File("C:\\Users\\aytha\\Desktop\\Supermarket\\Logs\\statelessSearchBeanFile.txt");
//            file = new File("C:\\Users\\Aythami\\Desktop\\Supermarket\\Logs\\statelessSearchBeanFile.txt");
            FileWriter statelessBeanFile = new FileWriter(file, true);
            searchFile = new PrintWriter(statelessBeanFile);
            singletonLogBean.setLog("StatelessSearchBean::createFile::statelessSearchBeanFile.txt");
        } catch (IOException ex) {
            singletonLogBean.setLog("StatelessSearchBean::createFile::Exception");
        }
    }
    
    public void setBean(String article) {
        createFile();
        searchFile.println("StatelessSearchBean::setBean::"+article);
        singletonLogBean.setLog("StatelessSearchBean::setBean::" + article);
        close();
    }
    
    public void close() {
        searchFile.close();
        singletonLogBean.setLog("StatelessSearchBean::close::searchFile");
    }
    
    @PreDestroy
    public void remove() {
        createFile();
        singletonLogBean.setLog("StatelessSearchBean::remove::PreDestroy");
        searchFile.println("::PreDestroy::");
        close();
    }
}