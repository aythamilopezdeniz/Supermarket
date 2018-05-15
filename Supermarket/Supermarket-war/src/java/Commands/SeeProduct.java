package Commands;

import Entities.Article;
import Entities.Users;
import SingletonBeans.SingletonEstadisticasBean;
import StatelessBeans.StatelessSeeProduct;
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

public class SeeProduct extends FrontCommand {
    StatelessSeeProduct seeProductBean = lookupStatelessSeeProductBeanBean();
    SingletonEstadisticasBean estadisticasBean = lookupSingletonEstadisticasBeanBean();

    @Override
    public void process() throws ServletException, IOException {
        HttpSession session = request.getSession();
        createViewProducts(session);
        statelessSeeProductBean(session);
        forward(request.getParameter("window"));
    }

    private void createViewProducts(HttpSession session) {
        ArticleFacade articleFacade = (ArticleFacade) session.getAttribute("articleFacade");
        List<Article> producto = articleFacade.findIDArticle(Integer.parseInt(request.getParameter("idProducto")));
        session.setAttribute(request.getParameter("idProducto"), producto);
    }

    private void statelessSeeProductBean(HttpSession session) {
        if(session.getAttribute("client") != null)
            estadisticasComponenteUsuarioNoAnonimo(session);
        else
            estadisticasComponenteUsuarioAnonimo();
    }
    
    private void estadisticasComponenteUsuarioNoAnonimo(HttpSession session) {
        Users client = (Users) session.getAttribute("client");
        seeProductBean.setBean("Artículo::" + request.getParameter("nameArticle") + "::Usuario::" + (String) session.getAttribute("user"));
        estadisticasBean.setAccessComponents("StatelessSearchBean");
        System.out.println("Estadísticas Componentes: " + estadisticasBean.getListComponents());
        estadisticasBean.setComponentsUser("StatelessSeeProductBean", client.getNombre());
        System.out.println("Estadísticas componentes por " + client.getNombre() + " " + estadisticasBean.getComponentVisitedByUser(client.getNombre()));
    }
    
    private void estadisticasComponenteUsuarioAnonimo() {
        seeProductBean.setBean("Artículo::" + request.getParameter("nameArticle") + "::Usuario::Anonimo");
        estadisticasBean.setAccessComponents("StatelessSearchBean");
        System.out.println("Estadísticas Componentes: " + estadisticasBean.getListComponents());
        estadisticasBean.setComponentsUser("StatelessSeeProductBean", "Anonimo");
        System.out.println("Estadísticas componentes por Anonimo " + estadisticasBean.getComponentVisitedByUser("Anonimo"));
    }
    
    private StatelessSeeProduct lookupStatelessSeeProductBeanBean() {
        try {
            Context c = new InitialContext();
            return (StatelessSeeProduct) c.lookup("java:global/Supermarket/Supermarket-ejb/StatelessSeeProduct!StatelessBeans.StatelessSeeProduct");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
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