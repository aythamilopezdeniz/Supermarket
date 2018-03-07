package Commands;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class SignIn extends FrontCommand {

    @Override
    public void process() throws ServletException, IOException {
        //HttpSession sesion = request.getSession();
        //createUserProfile(sesion);
        forward("/index.jsp");
    }

    private void createUserProfile(HttpSession sesion) {
        /*Crear Perfil de Usuario*/
    }
}