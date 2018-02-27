package Commands;

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
        session.setAttribute("user", request.getParameter("user"));
        session.setAttribute("password", request.getParameter("password"));
    }
}