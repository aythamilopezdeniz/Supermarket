package Commands;

import StatefulBeans.StatefulCart;
import Entities.Article;
import Model.User;
import SingletonBeans.SingletonEstadisticasBean;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class RemoveProduct extends FrontCommand {

    @Override
    public void process() throws ServletException, IOException {
        HttpSession session = request.getSession();
        User client = (User) session.getAttribute("client");
        StatefulCart shoppingCart = getCart();
        Article article = shoppingCart.getArticle(request.getParameter("nameArticle"));
        removeArticle(shoppingCart, article);
        shoppingCart.setBean("Artículo::" + request.getParameter("nameArticle") + "::Usuario::" + client.getName() + "::JSP::" + request.getParameter("window"));
        statefulCartBean(client);
        forward(request.getParameter("window"));
    }

    private void removeArticle(StatefulCart shoppingCart, Article article) {
        if(!shoppingCart.isEmpty() && article != null) {
            shoppingCart.removeArticle(article, Integer.parseInt(request.getParameter("idArticle")));
        }
    }
    
    private void statefulCartBean(User client) {
        SingletonEstadisticasBean singletonEstadisticasBean = lookupSingletonEstadisticasBeanBean();
        singletonEstadisticasBean.setAccessComponents("StatefulCartBean::removeProductToCart");
        System.out.println("Estadísticas Componentes: " + singletonEstadisticasBean.getListComponents());
        singletonEstadisticasBean.setComponentsUser("StatelfulCartBean::removeProductToCart", client.getName());
        System.out.println("Estadísticas componentes de " + client.getName()+ " " + singletonEstadisticasBean.getComponentVisitedByUser(client.getName()));
    }

    private SingletonEstadisticasBean lookupSingletonEstadisticasBeanBean() {
        try {
            Context c = new InitialContext();
            return (SingletonEstadisticasBean) c.lookup("java:global/Supermarket/Supermarket-ejb/SingletonEstadisticasBean!SingletonBeans.SingletonEstadisticasBean");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}