package DB;

import Model.User;
import java.util.ArrayList;

public class UserDB {
    private static final ArrayList<User> users = new ArrayList();
    
    public static ArrayList getUsers() {
        users.add(new User("Aythami", "López Déniz", "21/07/1990", "aythami", "aythami@hotmail.com", "1234", "cliente"));
        users.add(new User("Manuel", "Perez Ruiz", "05/02/1970", "manuel", "manuel@hotmail.com", "1234", "cliente"));
        users.add(new User("Raquel", "Gonzalez Reverte", "05/02/1970", "raquel", "raquel@hotmail.com", "1234", "empleado"));
        users.add(new User("Helena", "Montes Hernandez", "05/02/1970", "helena", "helena@hotmail.com", "1234", "repartidor"));
        return users;
    }
    
    public static User getUser(String name, String password) {
        for (User user : users) {
            if(user.getName().equals(name) && user.getPassword().equals(password))
                return user;
        }
        return null;
    }
}