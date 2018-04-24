package StatefulBeans;

import SingletonBeans.SingletonLogBean;
import Entities.Article;
import Entities.Time;
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
public class StatefulCart {
    
    @EJB
    private SingletonLogBean singletonLogBean;
    
    private ArrayList<Article> cart;
    private PrintWriter cartFile;
    private double priceCart;
    private File file;
    private Time timer;

    @PostConstruct
    public void crear() {
        createLog();
        cart = new ArrayList<>();
        priceCart = 0;
        timer = getTime();
        writeFile("Comienza a añadir artículos al carrito");
        singletonLogBean.setLog("StatefulCartBean::crear::PostConstruct");
    }
    
    private void createLog() {
        try {
            singletonLogBean = InitialContext.doLookup("java:global/Supermarket/Supermarket-ejb/SingletonLogBean!SingletonBeans.SingletonLogBean");
        } catch (NamingException ex) {
            singletonLogBean.setLog("StatefulCartBean::createLog::Exception");
        }
    }
    
    public void createFile() {
        try {
            file = new File("C:\\Users\\aytha\\Desktop\\Supermarket\\Logs\\statefulCartBeanFile.txt");
            //file = new File("C:\\Users\\Aythami\\Desktop\\Supermarket\\Logs\\statefulCartBeanFile.txt");
            FileWriter statefulBeanFile = new FileWriter(file, true);
            cartFile = new PrintWriter(statefulBeanFile);
            singletonLogBean.setLog("StatefulCartBean::createFile::statefulCartBeanFile.txt");
        } catch (IOException ex) {
            singletonLogBean.setLog("StatefulCartBean::createFile::Exception");
        }
    }
        
    @PostActivate
    public void postActivateFile() {
        writeFile("Estoy a la espera de añadir artículos al carrito");
        singletonLogBean.setLog("StatefulCartBean::postActivateFile::PostActivate");
    }
    
    public ArrayList<Article> getCart() {
        writeFile("StatefulCartBean::getCart::" + cart);
        singletonLogBean.setLog("StatefulCartBean::getCart::" + cart);
        return cart;
    }
    
    public void addArticle(Article article) {
        if(!existArticle(article.getId())) {
            Article copy = article.clone();
            copy.addCantidad();
            cart.add(copy);
        }
        else {
            Article product = getArticle(article.getId());
            product.addCantidad();
        }
        writeFile("StatefulCartBean::addArticle::" + article);
        singletonLogBean.setLog("StatefulCartBean::addArticle::" + article.getNombre());
    }
    
    private boolean existArticle(int id) {
        for (Article article : cart) {
            if(article.getId() == id) {
                writeFile("StatefulCartBean::existArticle::" + id);
                singletonLogBean.setLog("StatefulCartBean::existArticle::" + id);
                return true;
            }
        }
        return false;
    }
    
    private Article getArticle(int id) {
        for (Article articles : cart) {
            if(articles.getId() == id) {
                writeFile("StatefulCartBean::getArticle::" + id);
                singletonLogBean.setLog("StatefulCartBean::getArticle::" + id);
                return articles;
            }
        }
        return null;
    }
    
    public void removeArticle(Article article, int id) {
        Article product = getArticle(article.getNombre());
        if(repeteadArticle(product.getNombre()))
            article.removeCantidad();
        if(article.getCantidad() == 0)
            cart.remove(getPositionArticle(id));
        writeFile("StatefulCartBean::removeArticle::" + article);
        singletonLogBean.setLog("StatefulCartBean::removeArticle::" + article);
    }

    private int getPositionArticle(int id) {
        int position = 0;
        Iterator<Article> product = cart.iterator();
        while(product.hasNext()) {
            Article article = product.next();
            if(article.getId() == id)
                return position;
            position++;
        }
        writeFile("StatefulCartBean::getPositionArticle::" + id);
        singletonLogBean.setLog("StatefulCartBean::getPositionArticle::" + id);
        return position;
    }

    public boolean repeteadArticle(String name) {
        for (Article articles : cart) {
            if(articles.getNombre().equals(name) && articles.getCantidad() > 0)
                return true;
        }
        writeFile("StatefulCartBean::repeteadArticle::" + name);
        singletonLogBean.setLog("StatefulCartBean::repeteadArticle::" + name);
        return false;
    }
    
    public double calculatePriceCart() {
        double price = 0;
        for (Article articles : cart) {
            price += Double.parseDouble(articles.getPvp())*articles.getCantidad();
        }
        setPriceCart(Math.round(price*100.0)/100.0);
        writeFile("StatefulCartBean::calculatePriceCart::" + price);
        singletonLogBean.setLog("StatefulCartBean::calculatePriceCart::" + price);
        return Math.round(price*100.0)/100.0;
    }
    
    public Article getArticle(String name) {
        for (Article articles : cart) {
            if(articles.getNombre().equals(name))
                return articles;
        }
        writeFile("StatefulCartBean::getArticle::" + name);
        singletonLogBean.setLog("StatefulCartBean::getArticle::" + name);
        return null;
    }

    public double getPriceCart() {
        writeFile("StatefulCartBean::getPriceCart::" + priceCart);
        singletonLogBean.setLog("StatefulCartBean::getPriceCart::" + priceCart);
        return priceCart;
    }

    public void setPriceCart(double priceCart) {
        writeFile("StatefulCartBean::setPriceCart::" + priceCart);
        singletonLogBean.setLog("StatefulCartBean::setPriceCart::" + priceCart);
        this.priceCart = priceCart;
    }
    
    public boolean isEmpty() {
        writeFile("StatefulCartBean::isEmpty::" + cart.isEmpty());
        singletonLogBean.setLog("StatefulCartBean::isEmpty::" + cart.isEmpty());
        return cart.isEmpty();
    }
    
    public String getListArticles() {
        String purchase = "";
        for (Article article : cart) {
            purchase+=article.getCantidad() + " " + article.getNombre() + " ";
        }
        writeFile("StatefulCartBean::getListArticles::" + purchase);
        singletonLogBean.setLog("StatefulCartBean::getListArticles::" + purchase);
        return purchase;
    }

    public void setBean(String message) {
        writeFile("StatefulCartBean::setBean::" + message);
        singletonLogBean.setLog("StatefulCartBean::setBean::" + message);
    }
    
    @PrePassivate
    public void saveCart() {
        writeFile("StatefulCartBean::saveCart::");
        for (Article article : cart) {
            writeFile("Producto: " + article.getNombre() + " " + article.getCantidad() + 
                    "      " + (article.getCantidad()*Double.parseDouble(article.getPvp())) + " €");
        }
        singletonLogBean.setLog("StatefulCartBean::writeFile::PrePassivate");
    }

    private Time getTime() {
        singletonLogBean.setLog("StatefulCartBean::getTime::");
        return new Time(timer.getHour(), timer.getMinutes(), timer.getSeconds());
    }
    
    public void writeFile(String message) {
        createFile();
        cartFile.println(getTime().printTime() + "::" + message);
        singletonLogBean.setLog("StatefulCartBean::write::message");
        cartFile.close();
    }
    
    @PreDestroy
    public void remove() {
        writeFile("StatelfulCartBean::remove::PreDestroy::");
        singletonLogBean.setLog("StatefulCartBean::remove::PreDestroy");
        cart.clear();
    }
}