package Commands;

import StatefulBeans.StatefulPedido;
import Entities.Direction;
import Entities.Discount;
import Model.User;
import SingletonBeans.SingletonEstadisticasBean;
import StatefulBeans.StatefulCart;
import StatefulBeans.StatefulDiscount;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class PurchaseOrder extends FrontCommand {
    SingletonEstadisticasBean estadisticasBean = lookupSingletonEstadisticasBeanBean();

    @Override
    public void process() throws ServletException, IOException {
        HttpSession session = request.getSession();
        registrarPedido(request, session);
        forward(request.getParameter("window"));
    }
    
    private void registrarPedido(HttpServletRequest request, HttpSession session) {
        StatefulCart cart = (StatefulCart) session.getAttribute("shoppingCart");
        StatefulPedido pedido = lookupStatefulPedidoBeanBean();
        session.setAttribute("statefulPedido", pedido);
        User client = (User) session.getAttribute("client");
        generarTicket(request, session);
        if(request.getParameter("tickets") != null)
            aplicarDescuento(session, request);
        else {
            pedido.setStatefulCart(getCart());
            estadisticasBean.setAccessComponents("StatefulPedido::setStatefulCart");
            estadisticasBean.setComponentsUser("StatefulPedido::setStatefulCart::", client.getName());
            pedido.setPvpCart(Double.parseDouble(request.getParameter("pvpCart")));
            estadisticasBean.setAccessComponents("StatefulPedido::setPvpCart");
            estadisticasBean.setComponentsUser("StatefulPedido::setPvpCart::", client.getName());
        }
        if(request.getParameter("tienda").equals("local")) {
            pedido.setDirection(new Direction(request.getParameter("nombreCliente"), request.getParameter("apellidosCliente"), request.getParameter("local")));
            estadisticasBean.setAccessComponents("StatefulPedido::setDirection");
            estadisticasBean.setComponentsUser("StatefulPedido::setDirection::", client.getName());
        }
        else
            registrarEnDomicilio(client, pedido);
        client.setPedido(pedido);
        estadisticasBean.setAccessComponents("StatefulPedido::setPedido");
        estadisticasBean.setComponentsUser("StatefulPedido::setPedido::", client.getName());
        session.setAttribute("pedido", pedido.getShoppingCart().getListArticles());
        cart.remove();
    }
    
    private void registrarEnDomicilio(User client, StatefulPedido pedido) {
        Direction direction = new Direction(request.getParameter("nombreCliente"), request.getParameter("apellidosCliente"), request.getParameter("direccion"));
        direction.setPostalCode(request.getParameter("codigoPostal"));
        client.setCreditCardNumber(request.getParameter("tarjeta"), request.getParameter("caducidad"));
        pedido.setDirection(direction);
        estadisticasBean.setAccessComponents("StatefulPedido::setDirection");
        estadisticasBean.setComponentsUser("StatefulPedido::setDirection::", client.getName());
    }
    
    private void generarTicket(HttpServletRequest request, HttpSession session) {
        User client = (User) session.getAttribute("client");
        Discount discount = new Discount(Double.parseDouble(request.getParameter("pvpCart")), client.getName());
        if(discount.getDiscount() >= 10) {
            System.out.println("Aplicando descuento de " + discount.getDiscount());
            guardarDescuento(discount, session);
        }
    }
    
    private void guardarDescuento(Discount discount, HttpSession session) {
        User client = (User) session.getAttribute("client");
        StatefulDiscount statefulDiscount = (StatefulDiscount) session.getAttribute("statefulDiscount");
        if(statefulDiscount == null) {
            statefulDiscount = lookupStatefulDiscountBean();
            session.setAttribute("statefulDiscount", statefulDiscount);
        }
        statefulDiscount.addDiscount(discount, client.getName());
        estadisticasBean.setAccessComponents("StatefulDiscount::addDiscount");
        estadisticasBean.setComponentsUser("StatefulDiscount::addDiscount::", client.getName());
    }
    
    private void aplicarDescuento(HttpSession session, HttpServletRequest request) {
        User client = (User) session.getAttribute("client");
        StatefulDiscount statefulDiscount = (StatefulDiscount) session.getAttribute("statefulDiscount");
        StatefulPedido pedido = (StatefulPedido) session.getAttribute("statefulPedido");
        pedido.setStatefulCart(getCart());
        estadisticasBean.setAccessComponents("StatefulPedido::setStatefulCart");
        estadisticasBean.setComponentsUser("StatefulPedido::setStatefulCart::", client.getName());
        if(!request.getParameter("tickets").equals("Ninguno")) {
            Discount discount = statefulDiscount.getDiscount(request.getParameter("tickets"));
            statefulDiscount.removeTickectDiscount(discount, client.getName());
            estadisticasBean.setAccessComponents("StatefulDiscount::removeTickectDiscount");
            estadisticasBean.setComponentsUser("StatefulDiscount::removeTickectDiscount::", client.getName());
            pedido.setPvpCart(calculateDifference(Double.parseDouble(request.getParameter("pvpCart")), discount.getDiscount()));
            estadisticasBean.setAccessComponents("StatefulPedido::setPvpCart");
            estadisticasBean.setComponentsUser("StatefulPedido::setPvpCart::", client.getName());
        } else {
            pedido.setPvpCart((Double.parseDouble(request.getParameter("pvpCart"))));
            estadisticasBean.setAccessComponents("StatefulPedido::setPvpCart");
            estadisticasBean.setComponentsUser("StatefulPedido::setPvpCart::", client.getName());
        }
    }

    private double calculateDifference(double pvpCart, double discount) {
        Double price = pvpCart-discount;
        if(price >= 0) return price;
        return 0.0;
    }

    private StatefulPedido lookupStatefulPedidoBeanBean() {
        try {
            Context c = new InitialContext();
            StatefulPedido  s = (StatefulPedido) c.lookup("java:global/Supermarket/Supermarket-ejb/StatefulPedido!StatefulBeans.StatefulPedido");
            return s;
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private StatefulDiscount lookupStatefulDiscountBean() {
        try {
            Context c = new InitialContext();
            return (StatefulDiscount) c.lookup("java:global/Supermarket/Supermarket-ejb/StatefulDiscount!StatefulBeans.StatefulDiscount");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private SingletonEstadisticasBean lookupSingletonEstadisticasBeanBean() {
        try {
            Context c = new InitialContext();
            return (SingletonEstadisticasBean) c.lookup("java:global/Supermarket/Supermarket-ejb/SingletonEstadisticasBean!SingletonBeans.SingletonEstadisticasBean");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}