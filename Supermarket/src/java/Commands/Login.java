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
        if(existUser()){
            session.setAttribute("user", request.getParameter("name"));
            session.setAttribute("password", request.getParameter("password"));
        } else {}
    }

    private boolean existUser() {
        UserDB.getUsers();
        User user = UserDB.getUser(request.getParameter("name"), request.getParameter("password"));
        return user != null;
    }
}