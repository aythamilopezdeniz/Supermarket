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

public class AddProduct extends FrontCommand {
    SingletonEstadisticasBean estadisticasBean = lookupSingletonEstadisticasBeanBean();
    
    @Override
    public void process() throws ServletException, IOException {
        HttpSession session = obtenerSession();
        Users client = obtenerCliente();
        CartArticleFacade cartArticleFacade = obtenerCartArticle();
        if(cartArticleFacade == null) {
            cartArticleFacade = lookupCartArticleFacadeBean();
            session.setAttribute("cartArticleFacade", cartArticleFacade);
        }
        Cart cart = obtenerCartAbierto(client);
        Article article = obtenerArticle();
        añadirArticulo(cart, article);
        forward(request.getParameter("window"));
    }
    
    private Cart obtenerCartAbierto(Users client) {
        CartFacade cartFacade = getCart();
        Cart cart = null;
        if(!cartFacade.findAll().isEmpty()) {
            if(cartFacade.existOpenCart(client.getId()))
                cart = cartFacade.findOpenCart(client.getId());
            else {
                cartFacade.insertNewCart(client);
                cart = cartFacade.findOpenCart(client.getId());
            }
        } else {
            cartFacade.insertNewCart(client);
            cart = cartFacade.findOpenCart(client.getId());
            establecerEstadisticas("CartFacade::obtenerCartAbierto", client.getNombre());
        }
        return cart;
    }
    
    private Article obtenerArticle() {
        Users client = obtenerCliente();
        ArticleFacade articleFacade = obtenerArticulo();
        List<Article> article = articleFacade.findIDArticle(Integer.parseInt(request.getParameter("idProducto")));
        establecerEstadisticas("ArticleFacade::obtenerArticle", client.getNombre());
        return article.get(0);
    }
    
    private void añadirArticulo(Cart cart, Article article) {
        Users client = obtenerCliente();
        CartArticleFacade cartArticleFacade = obtenerCartArticle();
        List<CartArticle> cartArticle = cartArticleFacade.obtenerCartArticle(cart.getId(), article.getId());
        if(cartArticle.isEmpty())
            insertarRegistroCartArticle(cart, article);
        else {
            actualizarRegistroCartArticle(cartArticle.get(0), article);
        }
        establecerEstadisticas("CartArticleFacade::añadirArtículo", client.getNombre());
    }
    
    private void insertarRegistroCartArticle(Cart cart, Article article) {
        Users client = obtenerCliente();
        CartArticleFacade cartArticleFacade = obtenerCartArticle();
        cartArticleFacade.insertCartArticle(cart, article);
        establecerEstadisticas("CartArticleFacade::insertarRegistroCartArticle", client.getNombre());
    }
    
    private void actualizarRegistroCartArticle(CartArticle cartArticle, Article article) {
        Users client = obtenerCliente();
        CartArticleFacade cartArticleFacade = obtenerCartArticle();
        cartArticleFacade.updateIncrementCartArticle(cartArticle, article);
        establecerEstadisticas("CartArticleFacade::actualizarRegistroCartArticle", client.getNombre());
    }
    
    public HttpSession obtenerSession() {
        return request.getSession();
    }

    private Users obtenerCliente() {
        HttpSession session = obtenerSession();
        return (Users) session.getAttribute("client");
    }

    private ArticleFacade obtenerArticulo() {
        HttpSession session = obtenerSession();
        return (ArticleFacade) session.getAttribute("articleFacade");
    }
    
    public CartArticleFacade obtenerCartArticle() {
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

    private CartArticleFacade lookupCartArticleFacadeBean() {
        try {
            Context c = new InitialContext();
            return (CartArticleFacade) c.lookup("java:global/Supermarket/Supermarket-ejb/CartArticleFacade!StatelessFacade.CartArticleFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}