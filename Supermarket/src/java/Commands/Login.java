package Commands;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class Login extends FrontCommand {

    @Override
    public void process() throws ServletException, IOException {
        Comando comando = Comando.find(request.getParameter("command"));
        request.setAttribute("helper", new CommandHelper(comando));
        HttpSession session = request.getSession();
        session.setAttribute("user", request.getParameter("user"));
        forward("/Pages/login.jsp");
    }
}