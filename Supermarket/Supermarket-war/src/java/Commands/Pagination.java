package Commands;

import Entities.Article;
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

public class Pagination extends FrontCommand {

    @Override
    public void process() throws ServletException, IOException {
        cargarArticulos();
        forward(request.getParameter("window"));
    }

    private void cargarArticulos() {
        HttpSession session = obtenerSession();
        if(request.getParameter("anterior") != null) {
            if((int)session.getAttribute("pagina") > 1)
                pagina((int) session.getAttribute("pagina") - 1);
        }
        if(request.getParameter("siguiente") != null) {
            if((int)session.getAttribute("pagina") < 7)
                pagina((int) session.getAttribute("pagina") + 1);
        }
        if(request.getParameter("1") != null)
            pagina(Integer.parseInt(request.getParameter("1")));
        if(request.getParameter("2") != null)
            pagina(Integer.parseInt(request.getParameter("2")));
        if(request.getParameter("3") != null)
            pagina(Integer.parseInt(request.getParameter("3")));
        if(request.getParameter("4") != null)
            pagina(Integer.parseInt(request.getParameter("4")));
        if(request.getParameter("5") != null)
            pagina(Integer.parseInt(request.getParameter("5")));
        if(request.getParameter("6") != null)
            pagina(Integer.parseInt(request.getParameter("6")));
        if(request.getParameter("7") != null)
            pagina(Integer.parseInt(request.getParameter("7")));
    }
    
    private void pagina(int pagina) {
        HttpSession session = obtenerSession();
        ArticleFacade articleFacade = obtenerArticleFacade();
        if(articleFacade == null)
            articleFacade = lookupArticleFacadeBean();
        int[] products = new int[2];
        products[0] = Integer.parseInt(request.getParameter("min" + pagina)) - 1;
        products[1] = Integer.parseInt(request.getParameter("max" + pagina)) - 1;
        List<Article> listArticles = articleFacade.findRange(products);
        session.setAttribute("listArticles", listArticles);
        session.setAttribute("pagina", pagina);
    }

    private HttpSession obtenerSession() {
        return request.getSession();
    }

    private ArticleFacade obtenerArticleFacade() {
        HttpSession session = obtenerSession();
        return (ArticleFacade) session.getAttribute("articleFacade");
    }

    private ArticleFacade lookupArticleFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ArticleFacade) c.lookup("java:global/Supermarket/Supermarket-ejb/ArticleFacade!StatelessFacade.ArticleFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}