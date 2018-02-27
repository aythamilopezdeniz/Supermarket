package Commands;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class Logout extends FrontCommand {

    @Override
    public void process() throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.invalidate();
        forward("/index.jsp");
    }
}