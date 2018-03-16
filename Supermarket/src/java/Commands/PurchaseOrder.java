package Commands;

import Model.Cart;
import Model.Pedido;
import Model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class PurchaseOrder extends FrontCommand {

    @Override
    public void process() throws ServletException, IOException {
        HttpSession session = request.getSession();
        registarPedido(session);
        forward(request.getParameter("window"));
    }

    private void registarPedido(HttpSession session) {
        User client = (User) session.getAttribute("client");
        client.setPedido(new Pedido(getCart(), Double.parseDouble(request.getParameter("pvpCart"))));
        Cart shoppingCart = new Cart();
        session.setAttribute("shoppingCart", shoppingCart);/*No se conserva el carro*/
    }
}