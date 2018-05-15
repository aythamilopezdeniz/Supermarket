package Commands;

import Entities.Users;
import StatelessFacade.UsersFacade;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class SignIn extends FrontCommand {

    @Override
    public void process() throws ServletException, IOException {
        addUser();
        forward("/index.jsp");
    }

    private void addUser() {
        HttpSession session = request.getSession();
        if(!existUser(session)) {
            createNewUserProfile(session);
        }
    }

    private boolean existUser(HttpSession session) {
        UsersFacade usersFacade = (UsersFacade) session.getAttribute("usersFacade");
        if(usersFacade == null) {
            try {
                usersFacade = InitialContext.doLookup("java:global/Supermarket/Supermarket-ejb/UsersFacade!StatelessFacade.UsersFacade");
                session.setAttribute("usersFacade", usersFacade);
            } catch (NamingException ex) {}
        }
        return usersFacade.existUserProfile(request.getParameter("user"), request.getParameter("email"));
    }

    private void createNewUserProfile(HttpSession session) {
        try {
            UsersFacade usersFacade = (UsersFacade) session.getAttribute("usersFacade");
            usersFacade.insertUserProfile(request.getParameter("nombre"), request.getParameter("apellidos"), new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date")), request.getParameter("user"), request.getParameter("email"), request.getParameter("password"), "cliente");
            Users client = usersFacade.getUserAPI(request.getParameter("user"), request.getParameter("password"));
            createSession(session, client);
        } catch (ParseException ex) {}
    }

    private void createSession(HttpSession session, Users client) {
        session.setAttribute("client", client);
        session.setAttribute("user", client.getUsuario());
        session.setAttribute("password", client.getPassword());
    }
}