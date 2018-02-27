package Commands;

import java.io.IOException;
import javax.servlet.ServletException;

public class ShoppingCart extends FrontCommand {

    @Override
    public void process() throws ServletException, IOException {
        forward("/Pages/shoppingCart.jsp");
    }
}