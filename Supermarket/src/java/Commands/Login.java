package Commands;

import DB.UserDB;
import Model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class Login extends FrontCommand {

    @Override
    public void process() throws ServletException, IOException {
        HttpSession session = request.getSession();
        createSession(session);
        forward("/index.jsp");
    }

    private void createSession(HttpSession session) {
        if(existUser(session)){
            User client = (User) session.getAttribute("client");
            session.setAttribute("user", client.getUser());
            session.setAttribute("password", client.getPassword());
            //session.setAttribute("user", request.getParameter("name"));
            //session.setAttribute("password", request.getParameter("password"));
        } else {}
    }

    private boolean existUser(HttpSession session) {
        UserDB.getUsers();
        User client = UserDB.getUser(request.getParameter("name"), request.getParameter("password"));
        session.setAttribute("client", client);
        return client != null;
    }
}