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
        <!--<div class="col-lg-offset-4">
            <button class="btn  btn-form" data-target="#local">Recoger en tienda</button>
            <button class="btn  btn-form" data-target="#home">A domicilio</button>
        </div>
        <form id="local" method="post" action="FrontServlet">
            <fieldset>
                <legend>Recogida en Tienda</legend>
                <label for="nombre">Nombre</label>
                <input type="text" name="nombreCliente" size="20">
                <label for="nombre">Apellidos</label>
                <input type="text" name="apellidosCliente" size="20">
                <label for="nombre">C. P</label>
                <input type="text" name="codigoPostal" size="5">
                <label for="nombre">c/</label>
                <input type="text" name="dirección" size="30">
                <input type="text" name="window" value="/product.jsp">
                <input type="text" name="command" value="Product">
                <input type="submit" value="Registar Pedido">
            </fieldset>
        </form>
        <form id="home" method="post" action="FrontServlet" hidden="">
            <fieldset>
                <legend>A domicilio</legend>
                <label for="nombre">Nombre</label>
                <input type="text" name="nombreCliente" size="20">
                <label for="nombre">Apellidos</label>
                <input type="text" name="apellidosCliente" size="20">
                <label for="nombre">C. P</label>
                <input type="text" name="codigoPostal" size="5">
                <label for="nombre">c/</label>
                <input type="text" name="dirección" size="30">
                <input type="text" name="window" value="/product.jsp">
                <input type="text" name="command" value="Product">
                <input type="submit" value="Registar Pedido">
            </fieldset>
        </form>-->
        <!--<script>
            $(document).ready(function (e) {
                $(".btn-form").click(function(){
                    $(this).addClass("btn-info");
                    var form = $(this).data("target");
                    $(form).show(300);
                });
            });
        </script>-->

        <!-- Formulario Modal Pedido -->
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
                        <span class="close">&times;</span>
                        <form method="post" action="FrontServlet">
                            <fieldset>
                                <legend>Recogida</legend>
                                <label for="nombre">Nombre</label>
                                <input type="text" name="nombreCliente" size="20">
                                <label for="nombre">Apellidos</label>
                                <input type="text" name="apellidosCliente" size="20"><br>
                            </fieldset>
                        </form>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Continuar</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="home" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <!--<div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Recogida</h4>
                        </div>-->
                        <span class="close">&times;</span>
                        <form method="post" action="FrontServlet">
                            <fieldset>
                                <legend>A domicilio</legend>
                                <label for="nombre">Nombre</label>
                                <input type="text" name="nombreCliente" size="20">
                                <label for="nombre">Apellidos</label>
                                <input type="text" name="apellidosCliente" size="20"><br>
                                <label for="nombre">C. P</label>
                                <input type="text" name="codigoPostal" size="5">
                                <label for="nombre">c/</label>
                                <input type="text" name="dirección" size="30">
                                <input type="hidden" name="window" value="/product.jsp">
                                <input type="hidden" name="command" value="Product">
                            </fieldset>
                        </form>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Continuar</button>
                        </div>
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
                        <td colspan="10" class="hidden-xs"></td>
                        <td colspan="10" class="hidden-xs"></td>
                        <!--<td class="hidden-xs text-center"><strong>Total </strong></td>-->
                        <td><a href="index.jsp" class="btn btn-success btn-block">Continuar Pedido <i class="fa fa-angle-right"></i>Continuar</a></td>
                    </tr>
                </tfoot>
            </table>
        </div>

        <!--<a href="FrontServlet?command=Redirect&window=/Pages/shoppingCart.jsp" class="btn btn-warning"><i class="fa fa-angle-left"></i> Atrás</a>
        <a href="index.jsp" class="btn btn-warning"><i class="fa fa-angle-right"></i> Continuar</a>-->


        <!--<button  onclick="goBack()" id="goBack" type="button" class="btn btn-default" data-dismiss="modal">Atrás</button>
        <button onclick="continuar()" id="continue" type="button" class="btn btn-default" data-dismiss="modal">Continuar</button>-->

        <!-- Trigger/Open The Modal -->
        <!--<div>
            <!--<button id="modalLocal">En establecimiento</button>-->
            <!--<button id="modalHome">A domicilio</button>
        </div>-->

        <!-- The Modal -->
        <!--<div id="home" class="modal">
            <!-- Modal content -->
            <!--<div class="modal-content">
                <span class="close">&times;</span>
                <form method="post" action="FrontServlet">
                    <fieldset>
                        <legend>Recogida</legend>
                        <label for="nombre">Nombre</label>
                        <input type="text" name="nombreCliente" size="20">
                        <label for="nombre">Apellidos</label>
                        <input type="text" name="apellidosCliente" size="20"><br>
                        <label for="nombre">C. P</label>
                        <input type="text" name="codigoPostal" size="10">
                        <label for="nombre">c/</label>
                        <input type="text" name="dirección" size="40"><br>
                        <input type="hidden" name="window" value="/product.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Registar Pedido">
                    </fieldset>
                </form>
                <form>
                    <fieldset>
                        <legend>A domicilio</legend>
                    </fieldset>
                </form>
                <!--<p>Some text in the Modal..</p>-->
            <!--</div>
        </div>-->

        <!--<script>
            // Get the modal
            var home = document.getElementById('home');
            var local = document.getElementById('local');

            // Get the button that opens the modal
            var modalHome = document.getElementById("modalHome");
            var modalLocal = document.getElementById("modalLocal");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];

            // When the user clicks the button, open the modal 
            modalHome.onclick = function () {
                home.style.display = "block";
            }

            modalLocal.onclick = function () {
                home.style.display = "block";
            }
            
            // When the user clicks on <span> (x), close the modal
            span.onclick = function () {
                home.style.display = "none";
            }

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == home) {
                    home.style.display = "none";
                }
            }
        </script>
        
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 25%;
}

/* The Close Button */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

#home input[type="text"] {
    color: black;
}        
        -->
    </body>
</html>