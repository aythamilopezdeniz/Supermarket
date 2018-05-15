package Commands;

import Entities.Users;
import StatelessFacade.UsersFacade;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class EditProfile extends FrontCommand {

    @Override
    public void process() throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(request.getParameter("cancel") != null)
            deleteAccount(session);
        if(request.getParameter("save") != null)
            updateUserProfile(session);
        forward(request.getParameter("window"));
    }

    private void deleteAccount(HttpSession session) {
        Users client = (Users) session.getAttribute("client");
        UsersFacade usersFacade = (UsersFacade) session.getAttribute("usersFacade");
        usersFacade.deleteUserProfile(client.getId());
        closeSession(session);
    }
    
    private void closeSession(HttpSession session) {
        session.removeAttribute("client");
        session.removeAttribute("user");
        session.removeAttribute("password");
    }

    private void updateUserProfile(HttpSession session) {
        Users client = (Users) session.getAttribute("client");
        UsersFacade usersFacade = (UsersFacade) session.getAttribute("usersFacade");
        usersFacade.updateUserProfile(client.getId(), request.getParameter("nombre"), request.getParameter("apellidos"), 
                request.getParameter("date"), request.getParameter("user"), request.getParameter("email"), request.getParameter("password"));
        client = usersFacade.getUserAPI(request.getParameter("nombre"), request.getParameter("password"));
        createSession(session);
    }
    
    private void createSession(HttpSession session) {
        Users client = (Users) session.getAttribute("client");
        session.setAttribute("user", client.getUsuario());
        session.setAttribute("password", client.getPassword());
    }
}