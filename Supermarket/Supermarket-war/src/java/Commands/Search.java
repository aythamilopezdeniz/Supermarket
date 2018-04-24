package Commands;

import DB.ArticleDB;
import Entities.Article;
import Model.User;
import SingletonBeans.SingletonEstadisticasBean;
import StatelessBeans.StatelessSearch;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class Search extends FrontCommand {
    StatelessSearch searchBean = lookupStatelessSearchBeanBean();
    SingletonEstadisticasBean estadisticasBean = lookupSingletonEstadisticasBeanBean();

    @Override
    public void process() throws ServletException, IOException {
        HttpSession session = request.getSession();
        searchArticle(session);
        statelessSearchBean(session);
        forward(request.getParameter("window"));
    }

    private void searchArticle(HttpSession session) {
        ArrayList<Article> articles = (ArrayList<Article>) ArticleDB.searchArticle(request.getParameter("search"));
        session.setAttribute("search", articles);
    }
    
    private void statelessSearchBean(HttpSession session) {
        if(session.getAttribute("client") != null)
            estadisticasComponenteUsuarioNoAnonimo(session);
        else
            estadisticasComponenteUsuarioAnonimo();
    }
    
    private void estadisticasComponenteUsuarioNoAnonimo(HttpSession session) {
        User client = (User) session.getAttribute("client");
        searchBean.setBean("Artículo::" + request.getParameter("search") + "::Usuario::" + (String) session.getAttribute("user"));
        estadisticasBean.setAccessComponents("StatelessSearchBean");
        System.out.println("Estadísticas Componentes: " + estadisticasBean.getListComponents());
        estadisticasBean.setComponentsUser("StatelessSeeProductBean", client.getName());
        System.out.println("Estadísticas componentes por " + client.getName() + " " + estadisticasBean.getComponentVisitedByUser(client.getName()));
    }
    
    private void estadisticasComponenteUsuarioAnonimo() {
        searchBean.setBean("Artículo::" + request.getParameter("search") + "::Usuario::Anonimo");
        estadisticasBean.setAccessComponents("StatelessSearchBean");
        System.out.println("Estadísticas Componentes: " + estadisticasBean.getListComponents());
        estadisticasBean.setComponentsUser("StatelessSeeProductBean", "Anonimo");
        System.out.println("Estadísticas componentes por Anonimo " + estadisticasBean.getComponentVisitedByUser("Anonimo"));
    }
    
    private StatelessSearch lookupStatelessSearchBeanBean() {
        try {
            Context c = new InitialContext();
            return (StatelessSearch) c.lookup("java:global/Supermarket/Supermarket-ejb/StatelessSearch!StatelessBeans.StatelessSearch");
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