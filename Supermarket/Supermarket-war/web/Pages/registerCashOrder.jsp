<%@page import="StatefulBeans.StatefulCart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="StatefulBeans.StatefulDiscount"%>
<%@page import="Entities.Discount"%>
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
            StatefulCart shoppingCart = (StatefulCart) session.getAttribute("shoppingCart");
            StatefulDiscount discount = (StatefulDiscount) session.getAttribute("statefulDiscount");
            if(discount == null) {
                StatefulDiscount statefulDiscount = (StatefulDiscount) new InitialContext().lookup("java:global/Supermarket/Supermarket-ejb/StatefulDiscount!StatefulBeans.StatefulDiscount");
                session.setAttribute("statefulDiscount", statefulDiscount);
            }
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
                                    <input type="radio" name="local" value="1" checked>Telde<br>
                                    <input type="radio" name="local" value="2">Vecindario<br>
                                    <input id="local3" type="radio" name="local" value="3">Las Palmas de Gran Canaria<br>
                                </fieldset>
                                <input type="hidden" name="pvpCart" value="<%=shoppingCart.getPriceCart()%>">
                                <input type="hidden" name="tienda" value="local">
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
                                    <label for="tarjeta">Nº Tarjeta</label>
                                    <input type="text" name="tarjeta" size="30" required="">
                                    <label class="formPedido" for="fecha">Fecha Caducidad</label>
                                    <input id="formPedido" type="text" name="caducidad" size="20" required=""><br>
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
                                <input type="hidden" name="pvpCart" value="<%=shoppingCart.getPriceCart()%>">
                                <input type="hidden" name="tienda" value="domicilio">
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