package Commands;

import Servlet.FrontCommand;
import java.io.IOException;
import javax.servlet.ServletException;

public class Login extends FrontCommand {

    @Override
    public void process() throws ServletException, IOException {
        Comando comando = Comando.find(request.getParameter("command"));
        request.setAttribute("helper", new CommandHelper(comando));
        forward("/Pages/login.jsp");
    }
}