package Commands;

import Model.Pedido;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class CashOrder extends FrontCommand {

    @Override
    public void process() throws ServletException, IOException {
        HttpSession session = request.getSession();
        registarPedido(session);
        forward("window");
    }

    private void registarPedido(HttpSession session) {
        Pedido pedido = new Pedido((ArrayList<String>) session.getAttribute("shoppingCart"), 0);
    }
}