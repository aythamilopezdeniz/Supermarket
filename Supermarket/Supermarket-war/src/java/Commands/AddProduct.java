package Commands;

import Entities.Article;
import StatefulBeans.StatefulCart;
import Model.User;
import SingletonBeans.SingletonEstadisticasBean;
import StatelessFacade.ArticleFacade;
import java.io.IOException;
import java.util.List;
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
        HttpSession session = request.getSession();
        StatefulCart shoppingCart = getCart();
        ArticleFacade articleFacade = (ArticleFacade) session.getAttribute("articleFacade");
        List<Article> article = articleFacade.findIDArticle(Integer.parseInt(request.getParameter("idProducto")));
        shoppingCart.addArticle(article.get(0));
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