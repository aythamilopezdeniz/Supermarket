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
                response.sendRedirect("FrontServlet?command=Unknown");%>

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
                            <!--<div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Recogida</h4>
                            </div>-->
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <!--<span class="close">&times;</span>-->
                            <form method="post" action="FrontServlet">
                                <fieldset>
                                    <legend>Recogida</legend>
                                    <label for="nombre">Nombre</label>
                                    <input type="text" name="nombreCliente" size="20">
                                    <label for="nombre">Apellidos</label>
                                    <input type="text" name="apellidosCliente" size="20">
                                </fieldset>
                                <fieldset>
                                    <legend id="establecimiento">Establecimiento</legend>
                                    <input type="radio" name="local" value="1" checked>Telde<br>
                                    <input type="radio" name="local" value="2">Vecindario<br>
                                    <input id="local3" type="radio" name="local" value="3">Las Palmas de Gran Canaria<br>
                                </fieldset>
                                <input type="hidden" name="command" value="Redirect">
                                <input type="hidden" name="window" value="">
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
                                    <button type="submit" class="btn btn-primary" data-dismiss="modal">Continuar</button>
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
                                    <input type="text" name="nombreCliente" size="20">
                                    <label class="formPedido" for="apellidos">Apellidos</label>
                                    <input id="formPedido" type="text" name="apellidosCliente" size="20"><br>
                                    <label for="codigoPostal">C. P</label>
                                    <input type="text" name="codigoPostal" size="5">
                                    <label class="formPedido" for="direccion">c/</label>
                                    <input id="formPedido" type="text" name="dirección" size="30">
                                    <input type="hidden" name="window" value="/product.jsp">
                                    <input type="hidden" name="command" value="Product">
                                </fieldset>
                                <input type="hidden" name="command" value="Redirect">
                                <input type="hidden" name="window" value="">
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
                                    <button type="submit" class="btn btn-primary" data-dismiss="modal">Continuar</button>
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
                            <!--<td colspan="10" class="hidden-xs"></td>
                            <td colspan="10" class="hidden-xs"></td>
                            <td class="hidden-xs text-center"><strong>Total </strong></td>-->
                            <!--<td><a href="index.jsp" class="btn btn-success btn-block">Continuar Pedido <i class="fa fa-angle-right"></i>Continuar</a></td>-->
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>

        <!-- Footer -->
        <%@include file="/PageStyle/footer.jsp"%>
    </body>
</html>