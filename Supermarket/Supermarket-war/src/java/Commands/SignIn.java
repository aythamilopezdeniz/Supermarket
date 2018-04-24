package Commands;

import DB.UserDB;
import Model.User;
import java.io.IOException;
import javax.servlet.ServletException;

public class SignIn extends FrontCommand {

    @Override
    public void process() throws ServletException, IOException {
        addUser();
        forward("/index.jsp");
    }

    private void addUser() {
        User user = createUserProfile();
        UserDB.addUser(user);
    }

    private User createUserProfile() {
        return new User(request.getParameter("nombre"), request.getParameter("apellidos"), request.getParameter("date"), 
                request.getParameter("user"), request.getParameter("email"), request.getParameter("password"), "cliente");
    }
}