<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registrar Entrega</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link type="text/css" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            if(session.getAttribute("user")!=null && session.getAttribute("password") != null) {
        %>
        <header class="SignIn-Login">
            <ul>
                <li><a class="title" href="index.jsp">Supermercado Torres</a></li>
                <li>
                    <form>
                        <input type="text" name="search" placeholder="Buscar producto" required="">
                        <button type="submit">Buscar</button>
                    </form>
                </li>
                <li><p><%=session.getAttribute("user")%></p></li>
                <li><a href="FrontServlet?command=Logout">Cerrar Sesión</a></li>
                <li><a href="FrontServlet?command=ShoppingCart"><span class="glyphicon glyphicon-shopping-cart"></span> Cesta</a></li>
            </ul>
        </header>
        <% } else response.sendRedirect("FrontServlet?command=Unknown");%>
        <div class="col-lg-offset-4">
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
        </form>
        
        <!-- Formulario Modal Pedido -->
        <!--<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button>

        <div id="id01" class="local">

            <form class="modal-content animate" action="/action_page.php">
                <div class="imgcontainer">
                    <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
                    <img src="img_avatar2.png" alt="Avatar" class="avatar">
                </div>

                <div class="container">
                    <label for="uname"><b>Username</b></label>
                    <input type="text" placeholder="Enter Username" name="uname" required>

                    <label for="psw"><b>Password</b></label>
                    <input type="password" placeholder="Enter Password" name="psw" required>

                    <button type="submit">Login</button>
                    <label>
                        <input type="checkbox" checked="checked" name="remember"> Remember me
                    </label>
                </div>

                <div class="container" style="background-color:#f1f1f1">
                    <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
                    <span class="psw">Forgot <a href="#">password?</a></span>
                </div>
            </form>
        </div>

        <script>
        // Get the modal
        var modal = document.getElementById('id01');
        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal)
                modal.style.display = "none";
        }
        </script>-->
        <script>
            $(document).ready(function (e) {
                $(".btn-form").click(function(){
                    $(this).addClass("btn-info");
                    var form = $(this).data("target");
                    $(form).show(300);
                });
            });
        </script>
    </body>
</html>