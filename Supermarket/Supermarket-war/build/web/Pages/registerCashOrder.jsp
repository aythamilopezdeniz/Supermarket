<%@page import="java.text.SimpleDateFormat"%>
<%@page import="NoEntities.Discount"%>
<%@page import="Entities.CreditCard"%>
<%@page import="Entities.Cart"%>
<%@page import="StatelessFacade.CartFacade"%>
<%@page import="Entities.Users"%>
<%@page import="java.util.List"%>
<%@page import="StatelessFacade.CreditCardFacade"%>
<%@page import="java.util.ArrayList"%>
<%@page import="StatefulBeans.StatefulDiscount"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registrar Entrega</title>
        <%@include file="/PageStyle/head.jsp"%>
    </head>
    <body>
        <%
            if (session.getAttribute("user") != null && session.getAttribute("password") != null) {
        %>
            <%@include file="/PageStyle/sessionActive.jsp"%>
        <% } else
                response.sendRedirect("FrontServlet?command=Unknown");
            Users client = (Users) session.getAttribute("client");
            CartFacade cartFacade = (CartFacade) session.getAttribute("cartFacade");
            Cart cartClientOpen = cartFacade.findOpenCart(client.getId());
            StatefulDiscount discount = (StatefulDiscount) session.getAttribute("statefulDiscount");
            CreditCardFacade creditCardFacade = (CreditCardFacade) session.getAttribute("creditCardFacade");
            if(discount == null) {
                StatefulDiscount statefulDiscount = (StatefulDiscount) new InitialContext().lookup("java:global/Supermarket/Supermarket-ejb/StatefulDiscount!StatefulBeans.StatefulDiscount");
                session.setAttribute("statefulDiscount", statefulDiscount);
            }
            if(creditCardFacade == null) {
                creditCardFacade = (CreditCardFacade) new InitialContext().lookup("java:global/Supermarket/Supermarket-ejb/CreditCardFacade!StatelessFacade.CreditCardFacade");
                session.setAttribute("creditCardFacade", creditCardFacade);
            }
            List<CreditCard> creditCard = creditCardFacade.findCreditId(client.getId());
        %>

        <!-- Formulario Modal Pedido -->
        <div class="pedido">
            <div class="container">
                <h2>Forma de Entrega</h2>
                <!-- Trigger the modal with a button -->
                <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#local">En tienda</button>
                <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#home">A domicilio</button>
                <div class="modal fade" id="local" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <form method="post" action="FrontServlet">
                                <fieldset>
                                    <legend>Recogida</legend>
                                    <label for="nombre">Nombre</label>
                                    <input type="text" name="nombreCliente" size="20" required="">
                                    <label for="apellidos">Apellidos</label>
                                    <input type="text" name="apellidosCliente" size="20" required=""><br>
                                    <%if(discount != null){
                                        if(discount.getList().size() > 0) {%>
                                        <label id="Descuento" for="descuento">Descuento</label>
                                        <select id="tickets" name="tickets">
                                                <option label="Ninguno" value="Ninguno"></option>
                                                <%  for (Discount tickets : discount.getList()) {%>
                                                        <option label="<%=tickets.getTicket()%>" value="<%=tickets.getTicket()%>"></option>
                                                <%  }%>
                                            </select>
                                        <%}
                                    }%>
                                </fieldset>
                                <fieldset>
                                    <legend id="establecimiento">Establecimiento</legend>
                                    <input type="radio" name="local" value="Telde" checked>Telde<br>
                                    <input type="radio" name="local" value="Vecindario">Vecindario<br>
                                    <input id="local3" type="radio" name="local" value="Las Palmas de Gran Canaria">Las Palmas de Gran Canaria<br>
                                </fieldset>
                                <input type="hidden" name="pvpCart" value="<%=cartClientOpen.getPvp()%>">
                                <input type="hidden" name="tienda" value="local">
                                <input type="hidden" name="estado" value="id">
                                <input type="hidden" name="command" value="PurchaseOrder">
                                <input type="hidden" name="window" value="/Pages/inCharges.jsp">
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
                                    <button type="submit" class="btn btn-primary">Realizar Pedido</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="home" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <form method="post" action="FrontServlet">
                                <fieldset>
                                    <legend id="domicilio">A domicilio</legend>
                                    <label for="nombre">Nombre</label>
                                    <input type="text" name="nombreCliente" size="20" required="">
                                    <label class="formPedido" for="apellidos">Apellidos</label>
                                    <input id="formPedido" type="text" name="apellidosCliente" size="20" required=""><br>
                                    <label for="codigoPostal">C. P</label>
                                    <input type="text" name="codigoPostal" size="5" required="">
                                    <label class="formPedido" for="direccion">c/</label>
                                    <input id="formPedido" type="text" name="direccion" size="30" required=""><br>
                                    <%if(creditCard.isEmpty()) {%>
                                        <label for="tarjeta">Nº Tarjeta</label>
                                        <input type="text" name="tarjeta" size="30" required="">
                                        <label class="formPedido" for="fecha">Fecha Caducidad</label>
                                        <input id="formPedido" type="date" name="caducidad" size="20" required=""><br>
                                    <%} else {%>
                                        <label for="tarjeta">Nº Tarjeta</label>
                                        <input type="text" name="tarjeta" value="<%=creditCard.get(0).getNumber()%>" size="30" required="">
                                        <label class="formPedido" for="fecha">Fecha Caducidad</label>
                                        <input id="formPedido" type="date" name="caducidad" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(creditCard.get(0).getFechaCaducidad())%>" size="20" required=""><br>
                                    <%}%>
                                    <%if(discount != null){
                                        if(discount.getList().size() > 0) {%>
                                        <label id="Descuento" for="descuento">Descuento</label>
                                        <select id="tickets" name="tickets">
                                                <option label="Ninguno" value="Ninguno"></option>
                                                <%  for (Discount tickets : discount.getList()) {%>
                                                        <option label="<%=tickets.getTicket()%>" value="<%=tickets.getTicket()%>"></option>
                                                <%  }%>
                                            </select>
                                        <%}
                                    }%>
                                </fieldset>
                                <input type="hidden" name="pvpCart" value="<%=cartClientOpen.getPvp()%>">
                                <input type="hidden" name="tienda" value="domicilio">
                                <input type="hidden" name="estado" value="id">
                                <input type="hidden" name="command" value="PurchaseOrder">
                                <input type="hidden" name="window" value="/Pages/inCharges.jsp">
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
                                    <button type="submit" class="btn btn-primary">Pagar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <table id="cart" class="table table-hover table-condensed">
                    <tfoot>
                        <tr class="visible-xs">
                            <td class="text-center"><strong>Total </strong></td>
                        </tr>
                        <tr>
                            <td><a href="FrontServlet?command=Redirect&window=/Pages/shoppingCart.jsp" class="btn btn-warning"><i class="fa fa-angle-left"></i> Atrás</a></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>

        <!-- Footer -->
        <%@include file="/PageStyle/footer.jsp"%>
    </body>
</html>