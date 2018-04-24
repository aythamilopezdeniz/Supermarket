package Commands;

import Entities.Article;
import StatefulBeans.StatefulCart;
import DB.ArticleDB;
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

public class AddProduct extends FrontCommand {

    @Override
    public void process() throws ServletException, IOException {
        StatefulCart shoppingCart = getCart();
        Article article = ArticleDB.getArticle(Integer.parseInt(request.getParameter("idProducto")));
        shoppingCart.addArticle(article);
        HttpSession session = request.getSession();
        User client = (User) session.getAttribute("client");
        shoppingCart.setBean("Artículo::" + request.getParameter("nameArticle") + "::Usuario::" + client.getName() + "::JSP::" + request.getParameter("window"));
        for (Article articles : shoppingCart.getCart())
            System.out.println("Producto " + articles.getNombre() + " Cantidad " + articles.getCantidad());
        estadisticasStatefulCartBean(client);
        forward(request.getParameter("window"));
    }
    
    private void estadisticasStatefulCartBean(User client) {
        SingletonEstadisticasBean estadisticasBean = lookupSingletonEstadisticasBeanBean();
        estadisticasBean.setAccessComponents("StatelfulCartBean::addProductToCart");
        System.out.println("Estadísticas Componentes: " + estadisticasBean.getListComponents());
        estadisticasBean.setComponentsUser("StatelfulCartBean::addProductToCart", client.getName());
        System.out.println("Estadísticas componentes de " + client.getName()+ " " + estadisticasBean.getComponentVisitedByUser(client.getName()));
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