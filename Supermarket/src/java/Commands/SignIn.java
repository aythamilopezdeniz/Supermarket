package Commands;

import java.io.IOException;
import javax.servlet.ServletException;

public class SignIn extends FrontCommand {

    @Override
    public void process() throws ServletException, IOException {
        forward("/Pages/signin.jsp");
    }
}