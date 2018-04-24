package Commands;

import Model.User;
import SingletonBeans.SingletonEstadisticasBean;
import StatelessBeans.StatelessSeeProduct;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
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
        ArrayList<String> producto = new ArrayList();
        producto.add(request.getParameter("nameArticle"));
        producto.add(request.getParameter("imageArticle"));
        producto.add(request.getParameter("pvpArticle"));
        producto.add(request.getParameter("descriptionArticle"));
        session.setAttribute(request.getParameter("idProducto"), producto);
    }

    private void statelessSeeProductBean(HttpSession session) {
        if(session.getAttribute("client") != null)
            estadisticasComponenteUsuarioNoAnonimo(session);
        else
            estadisticasComponenteUsuarioAnonimo();
    }
    
    private void estadisticasComponenteUsuarioNoAnonimo(HttpSession session) {
        User client = (User) session.getAttribute("client");
        seeProductBean.setBean("Artículo::" + request.getParameter("nameArticle") + "::Usuario::" + (String) session.getAttribute("user"));
        estadisticasBean.setAccessComponents("StatelessSearchBean");
        System.out.println("Estadísticas Componentes: " + estadisticasBean.getListComponents());
        estadisticasBean.setComponentsUser("StatelessSeeProductBean", client.getName());
        System.out.println("Estadísticas componentes por " + client.getName() + " " + estadisticasBean.getComponentVisitedByUser(client.getName()));
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