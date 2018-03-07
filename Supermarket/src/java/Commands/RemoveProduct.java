package Commands;

import java.io.IOException;
import javax.servlet.ServletException;

public class RemoveProduct extends FrontCommand {

    @Override
    public void process() throws ServletException, IOException {
        /*Eliminar Producto del carrito*/
        forward(request.getParameter("window"));
    }
}