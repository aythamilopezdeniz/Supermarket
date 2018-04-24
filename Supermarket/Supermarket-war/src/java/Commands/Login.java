package Commands;

import DB.UserDB;
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

public class Login extends FrontCommand {
    SingletonEstadisticasBean estadisticasBean = lookupSingletonEstadisticasBeanBean();

    @Override
    public void process() throws ServletException, IOException {
        HttpSession session = request.getSession();
        createSession(session);
        singletonEstadisticasBean(session);
        forward("/index.jsp");
    }

    private void createSession(HttpSession session) {
        if(existUser(session)){
            User client = (User) session.getAttribute("client");
            session.setAttribute("user", client.getUser());
            session.setAttribute("password", client.getPassword());
        }
    }

    private boolean existUser(HttpSession session) {
        UserDB.getUsers();
        User client = UserDB.getUser(request.getParameter("name"), request.getParameter("password"));
        session.setAttribute("client", client);
        return client != null;
    }

    private void singletonEstadisticasBean(HttpSession session) {
        if(session.getAttribute("client") != null) {
            estadisticasAccesoUsuario();
        }
    }
    
    private void estadisticasAccesoUsuario() {
        estadisticasBean.setNewAccessUser();
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