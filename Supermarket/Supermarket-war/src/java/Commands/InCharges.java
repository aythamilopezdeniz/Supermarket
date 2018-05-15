package Commands;

import Entities.Pedido;
import Entities.Users;
import StatelessFacade.PedidoFacade;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class InCharges extends FrontCommand {

    @Override
    public void process() throws ServletException, IOException {
        obtenerPedidos(request);
        forward(request.getParameter("window"));
    }

    private void obtenerPedidos(HttpServletRequest request) {
        HttpSession session = obtenerSession();
        Users client = obtenerCliente();
        PedidoFacade pedidoFacade = (PedidoFacade) session.getAttribute("pedidoFacade");
        List<Pedido> pedidosCliente = (List<Pedido>) session.getAttribute("pedidosCliente");
        if(pedidoFacade == null) {
            pedidoFacade = lookupPedidoFacadeBean();
        }
        if(pedidoFacade != null) {
            if(pedidosCliente == null)
                pedidosCliente = pedidoFacade.findPedidosCliente(client, "cola");
            else {
                pedidosCliente = pedidoFacade.findPedidosCliente(client, request.getParameter("estado"));
                if(request.getParameter("estado").equals(""))
                    pedidosCliente = pedidoFacade.findPvpPedidosCliente(0.0, client.getId());
                if(pedidosCliente.isEmpty())
                    pedidosCliente = pedidoFacade.findDiaPedidosCliente(request.getParameter("estado"), client.getId());
                if(pedidosCliente.isEmpty())
                    pedidosCliente = pedidoFacade.findHoraPedidosCliente(request.getParameter("estado"), client.getId());
            }
            session.setAttribute("pedidosCliente", pedidosCliente);
        }
    }

    private HttpSession obtenerSession() {
        return request.getSession();
    }

    private PedidoFacade lookupPedidoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (PedidoFacade) c.lookup("java:global/Supermarket/Supermarket-ejb/PedidoFacade!StatelessFacade.PedidoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private Users obtenerCliente() {
        HttpSession session = obtenerSession();
        return (Users) session.getAttribute("client");
    }
}