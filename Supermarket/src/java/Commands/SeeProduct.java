package Commands;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class SeeProduct extends FrontCommand {

    @Override
    public void process() throws ServletException, IOException {
        HttpSession session = request.getSession();
        createViewProducts(session);
        forward(request.getParameter("window"));
    }

    private void createViewProducts(HttpSession session) {
        ArrayList<String> producto = new ArrayList();
        producto.add(request.getParameter("nameArticle"));
        producto.add(request.getParameter("imageArticle"));
        producto.add(request.getParameter("pvpArticle"));
        session.setAttribute(request.getParameter("idProducto"), producto);
    }
}