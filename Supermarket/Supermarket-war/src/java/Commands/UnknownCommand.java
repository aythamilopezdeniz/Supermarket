package Commands;

import Model.User;
import SingletonBeans.SingletonEstadisticasBean;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class UnknownCommand extends FrontCommand {
    SingletonEstadisticasBean estadisticasBean = lookupSingletonEstadisticasBeanBean();

    @Override
    public void process() throws ServletException, IOException {
        singletonEstadisticasBean();
        forward("/Pages/unknown.jsp");
    }

    private void singletonEstadisticasBean() {
        HttpSession session = request.getSession();
        if(session.getAttribute("client") != null) {
            estadisticasComponenteUsuario(request, session);
        } else {
            estadisticasComponente();
        }
    }
    
    private void estadisticasComponenteUsuario(HttpServletRequest request, HttpSession session) {
        User client = (User) session.getAttribute("client");
        estadisticasBean.setComponentsUser(request.getParameter("command"), client.getName());
        System.out.println("Estadísticas componentes por " + client.getName() + " " + estadisticasBean.getComponentVisitedByUser(client.getName()));
    }
    
    private void estadisticasComponente() {
        estadisticasBean.setAccessComponents(request.getParameter("command"));
        System.out.println("Estadísticas Componentes: " + estadisticasBean.getListComponents());
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