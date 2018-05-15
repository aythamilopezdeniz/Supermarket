package Commands;

import Entities.Article;
import Entities.Cart;
import Entities.CartArticle;
import Entities.Users;
import SingletonBeans.SingletonEstadisticasBean;
import StatelessFacade.ArticleFacade;
import StatelessFacade.CartArticleFacade;
import StatelessFacade.CartFacade;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class RemoveProduct extends FrontCommand {
    SingletonEstadisticasBean estadisticasBean = lookupSingletonEstadisticasBeanBean();
        
    @Override
    public void process() throws ServletException, IOException {
        HttpSession session = obtenerSession();
        Users client = obtenerCliente();
        CartArticle cartArticle = getCartArticle(session, client);
        ArticleFacade articleFacade = obtenerArticleFacade();
        List<Article> article = articleFacade.findIDArticle(Integer.parseInt(request.getParameter("idArticle")));
        removeArticle(cartArticle, article.get(0));
        forward(request.getParameter("window"));
    }
    
    private CartArticle getCartArticle(HttpSession session, Users client) {
        CartFacade cartFacade = getCart();
        Cart cart = cartFacade.findOpenCart(client.getId());
        CartArticleFacade cartArticleFacade = (CartArticleFacade) session.getAttribute("cartArticleFacade");
        establecerEstadisticas("CartFacade::getCartArticle", client.getNombre());
        return cartArticleFacade.obtenerArticle(cart.getId(), Integer.parseInt(request.getParameter("idArticle")));
    }

    private void removeArticle(CartArticle cartArticle, Article article) {
        Users client = obtenerCliente();
        CartArticleFacade cartArticleFacade = obtenerCartArticleFacade();
        if(!cartArticleFacade.findAll().isEmpty() && cartArticle !=null) {
            if(cartArticle.getCantidad() > 1)
                cartArticleFacade.updateDecrementCartArticle(cartArticle, article);
            else
                cartArticleFacade.deleteCartArticle(cartArticle, article);
        }
        establecerEstadisticas("CartArticleFacade::removerArticle", client.getNombre());
    }
    
    private HttpSession obtenerSession() {
        return request.getSession();
    }

    private Users obtenerCliente() {
        HttpSession session = obtenerSession();
        return (Users) session.getAttribute("client");
    }

    private ArticleFacade obtenerArticleFacade() {
        HttpSession session = obtenerSession();
        return (ArticleFacade) session.getAttribute("articleFacade");
    }

    private CartArticleFacade obtenerCartArticleFacade() {
        HttpSession session = obtenerSession();
        return (CartArticleFacade) session.getAttribute("cartArticleFacade");
    }
    
    private void establecerEstadisticas(String component, String client) {
        estadisticasBean.setAccessComponents(component);
        estadisticasBean.setComponentsUser(component + "::", client);
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