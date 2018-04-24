package Commands;

import SingletonBeans.SingletonEstadisticasBean;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class Logout extends FrontCommand {
    SingletonEstadisticasBean estadisticasBean = lookupSingletonEstadisticasBeanBean();

    @Override
    public void process() throws ServletException, IOException {
        HttpSession session = request.getSession();
        deleteSession(session);
        estadisticasAccesoUsuario();
        forward("/index.jsp");
    }
    
    private void deleteSession(HttpSession session) {
        session.removeAttribute("client");
        session.removeAttribute("user");
        session.removeAttribute("password");
    }
    
    private void estadisticasAccesoUsuario() {
        estadisticasBean.deleteAccessUser();
        System.out.println("Estadísticas accesos " + estadisticasBean.getNumAccessUser());
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