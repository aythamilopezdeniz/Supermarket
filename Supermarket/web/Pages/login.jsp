<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link type="text/css" rel="stylesheet" href="../css/style.css"/>
        <link type="text/css" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            if(session.getAttribute("user") == null) {%>
        <!-- Header -->
        <header class="SignIn-Login">
            <ul>
                <li><a class="title" href="/Supermarket/index.jsp">Supermercado Torres</a></li>
                <li>
                    <form>
                        <input type="text" name="search" placeholder="Buscar producto" required="">
                        <button type="submit">Buscar</button>
                    </form>
                </li>
                <li><a href="/Supermarket/FrontServlet?command=SignIn">Registrarse</a></li>
                <li><a href="/Supermarket/Pages/login.jsp">Login</a></li>
                <li><a href="FrontServlet?command=ShoppingCart"><span class="glyphicon glyphicon-shopping-cart"></span> Cesta</a></li>
            </ul>
        </header>

        <!-- Login -->
        <form class="login" method="get" action="/Supermarket/FrontServlet">
            <fieldset>
                <legend>Identificarse</legend>
                <label for="usuario">Usuario</label>
                <input class="user" type="text" name="user"><br>
                <label for="usuario">Contraseña</label>
                <input class="password" type="password" name="password"><br>
                <input  type="hidden" name="command" value="Login"><br>
                <input class="session" type="submit" value="Iniciar Sesión">
            </fieldset>
        </form>
        <%} else response.sendRedirect("FrontServlet?command=Unknown");%>
    </body>
</html>