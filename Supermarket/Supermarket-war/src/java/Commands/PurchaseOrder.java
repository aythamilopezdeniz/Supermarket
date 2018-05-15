package Commands;

import NoEntities.Discount;
import Entities.Users;
import SingletonBeans.SingletonEstadisticasBean;
import StatefulBeans.StatefulDiscount;
import Entities.Cart;
import Entities.Pedido;
import StatelessFacade.CartFacade;
import StatelessFacade.CreditCardFacade;
import StatelessFacade.DirectionFacade;
import StatelessFacade.PedidoFacade;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class PurchaseOrder extends FrontCommand {
    SingletonEstadisticasBean estadisticasBean = lookupSingletonEstadisticasBeanBean();

    @Override
    public void process() throws ServletException, IOException {
        try {
            registrarPedido();
            generarTickectDescuento();
            aplicarDescuento();
            registrarRecogida();
            cargarPedidos();
            cerrarCart();
            forward(request.getParameter("window"));
        } catch (ParseException ex) {}
    }
    
    private void registrarPedido() {
        Users client = obtenerCliente();
        CartFacade cartFacade = obtenerCart();
        Cart cartClientOpen = cartFacade.findOpenCart(client.getId());
        PedidoFacade pedidoFacade = lookupPedidoFacadeBean();
        if(!pedidoFacade.findExistPedido(cartClientOpen.getId()))
            pedidoFacade.insertPedido(client, cartClientOpen, new SimpleDateFormat("dd-MM-yyyy").format(new Date()), new SimpleDateFormat("HH:mm:ss").format(new Date()), "cola");
        establecerEstadisticas("PedidoEntity::registrarPedido", client.getNombre());
    }
    
    private void generarTickectDescuento() {
        Users client = obtenerCliente();
        Discount discount = new Discount(Double.parseDouble(request.getParameter("pvpCart")), client.getNombre());
        if(discount.getDiscount() >= 10) {
            System.out.println("Aplicando descuento de " + discount.getDiscount());
            guardarDescuento(discount);
        }
    }
    
    private void guardarDescuento(Discount discount) {
        HttpSession session = obtenerSesion();
        Users client = obtenerCliente();
        StatefulDiscount statefulDiscount = obtenerDescuentos();
        if(statefulDiscount == null) {
            statefulDiscount = lookupStatefulDiscountBean();
            session.setAttribute("statefulDiscount", statefulDiscount);
        }
        statefulDiscount.addDiscount(discount, client.getNombre());
        establecerEstadisticas("StatefulDiscount::addDiscount", client.getNombre());
    }
    
    private void aplicarDescuento() {
        Users client = obtenerCliente();
        PedidoFacade pedidoFacade = lookupPedidoFacadeBean();
        StatefulDiscount statefulDiscount = obtenerDescuentos();
        if(request.getParameter("tickets") != null) {
            if(!request.getParameter("tickets").equals("Ninguno")) {
                Discount discount = statefulDiscount.getDiscount(request.getParameter("tickets"));
                statefulDiscount.removeTickectDiscount(discount, client.getNombre());
                Pedido pedido = pedidoFacade.obtenerUltimoPedido(client.getId());
                double price = calculateDifference(pedido.getPvp(), discount.getDiscount());
                pedidoFacade.updatePvpPedido(pedido.getId(), price);
                //pedidoFacade.updatePvpPedido(pedido.getId(), calculateDifference(pedido.getPvp(), discount.getDiscount()));
                CartFacade cartFacade = obtenerCart();
                Cart cart = cartFacade.findOpenCart(client.getId());
                cartFacade.updatePvpCart(cart.getId(), price);
                establecerEstadisticas("StatefulDiscount::removeTickectDiscount", client.getNombre());
            }
        }
    }
    
    private void registrarRecogida() throws ParseException {
        if(request.getParameter("tienda").equals("local"))
            registroEnLocal();
        else {
            registroEnDomicilio();
            registroTarjetaCredito();
        }
    }
    
    private void registroEnLocal() {
        Users client = obtenerCliente();
        DirectionFacade directionFacade = lookupDirectionFacadeBean();
        PedidoFacade pedidoFacade = lookupPedidoFacadeBean();
        Pedido pedido = pedidoFacade.obtenerUltimoPedido(client.getId());
        if(directionFacade.findExistDirection(client.getId()))
            directionFacade.updateDirectionLocal(client.getId(), request.getParameter("nombreCliente"), request.getParameter("apellidosCliente"), request.getParameter("local"));
        else
            directionFacade.insertDirectionLocal(client.getId(), pedido, request.getParameter("nombreCliente"), request.getParameter("apellidosCliente"), request.getParameter("local"));
        establecerEstadisticas("DirectionEntity::insertDirection", client.getNombre());
    }
    
    private void registroEnDomicilio() {
        Users client = obtenerCliente();
        DirectionFacade directionFacade = lookupDirectionFacadeBean();
        PedidoFacade pedidoFacade = lookupPedidoFacadeBean();
        Pedido pedido = pedidoFacade.obtenerUltimoPedido(client.getId());
        if(directionFacade.findExistDirection(client.getId()))
            directionFacade.updateDirectionDomicilio(client.getId(), request.getParameter("nombreCliente"), request.getParameter("apellidosCliente"), request.getParameter("direccion"), Integer.parseInt(request.getParameter("codigoPostal")));
        else
            directionFacade.insertDirectionDomicilio(client.getId(), pedido, request.getParameter("nombreCliente"), request.getParameter("apellidosCliente"), request.getParameter("direccion"), Integer.parseInt(request.getParameter("codigoPostal")));
        establecerEstadisticas("DirectionEntity::insertDirection", client.getNombre());
    }
    
    private void registroTarjetaCredito() throws ParseException {
        Users client = obtenerCliente();
        CreditCardFacade creditCardFacade = lookupCreditCardFacadeBean();
        if(!creditCardFacade.existCreditCard(client.getId()))
            creditCardFacade.insertCreditCart(client.getId(), Integer.parseInt(request.getParameter("tarjeta")), new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("caducidad")));
        else
            creditCardFacade.updateCreditCardNumber(client.getId(), request.getParameter("tarjeta"), new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("caducidad")));
        establecerEstadisticas("CreditCardEntity::insertCreditcard", client.getNombre());
    }
    
    private void cargarPedidos() {
        HttpSession session = obtenerSesion();
        Users client = obtenerCliente();
        PedidoFacade pedidoFacade = lookupPedidoFacadeBean();
        List<Pedido> pedidosCliente = pedidoFacade.findPedidosCliente(client, "cola");
        session.setAttribute("pedidosCliente", pedidosCliente);
    }

    private void cerrarCart() {
        CartFacade cartFacade = obtenerCart();
        Users client = obtenerCliente();
        Cart cart = cartFacade.findOpenCart(client.getId());
        cartFacade.closeCartAPI(1, cart);
        establecerEstadisticas("CartEntity::closeCart", client.getNombre());
    }

    private double calculateDifference(double pvpCart, double discount) {
        Double price = pvpCart-discount;
        if(price >= 0) return price;
        return 0.0;
    }

    private Users obtenerCliente() {
        HttpSession session = obtenerSesion();
        return (Users) session.getAttribute("client");
    }

    private HttpSession obtenerSesion() {
        return request.getSession();
    }

    private CartFacade obtenerCart() {
        HttpSession session = obtenerSesion();
        return (CartFacade) session.getAttribute("cartFacade");
    }
    
    private StatefulDiscount obtenerDescuentos() {
        HttpSession session = obtenerSesion();
        return (StatefulDiscount) session.getAttribute("statefulDiscount");
    }
    
    private void establecerEstadisticas(String component, String client) {
        estadisticasBean.setAccessComponents(component);
        estadisticasBean.setComponentsUser(component + "::", client);
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

    private DirectionFacade lookupDirectionFacadeBean() {
        try {
            Context c = new InitialContext();
            return (DirectionFacade) c.lookup("java:global/Supermarket/Supermarket-ejb/DirectionFacade!StatelessFacade.DirectionFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private CreditCardFacade lookupCreditCardFacadeBean() {
        try {
            Context c = new InitialContext();
            return (CreditCardFacade) c.lookup("java:global/Supermarket/Supermarket-ejb/CreditCardFacade!StatelessFacade.CreditCardFacade");
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