<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <!-- Header -->
        <header class="SignIn-Login">
            <ul>
                <li><a class="title" href="index.jsp">Supermercado Torres</a></li>
                <li>
                    <form>
                        <input type="text" name="search" placeholder="Buscar producto" required="">
                        <button type="submit">Buscar</button>
                    </form>
                </li>
                <li><a href="FrontServlet?command=SignIn">Registrarse</a></li>
                <li><a href="FrontServlet?command=Login">Login</a></li>
                <li><a href="FrontServlet?command=ShoppingCart"><span class="glyphicon glyphicon-shopping-cart"></span> Cesta</a></li>
            </ul>
        </header>
        
        <!-- Registro -->
        <form class="Register" method="post" action="">
            <fieldset>
                <legend>Registro</legend>
                <label for="nombre">Nombre</label>
                <input class="nombre" type="text" name="nombre" value=""><br>
                <label for="apellido1">Apellidos</label>
                <input class="appellidos" type="text" name="apellidos" value=""><br>
                <label for="usuario">Fecha de Nacimiento</label>
                <input class="date" type="date" name="date" value=""><br>
                <label for="usuario">Usuario</label>
                <input class="user" type="text" name="user" value=""><br>
                <label for="correo">Correo Electrónico</label>
                <input class="correo" type="email" name="email" value=""><br>
                <label for="password">Contraseña</label>
                <input class="password" type="password" name="password" value=""><br>
                <label for="password">Repetir Contraseña</label>
                <input class="password" type="text" name="password" value=""><br>
                <input class="register" type="submit" value="Registrarse">
            </fieldset>
        </form>
    </body>
</html>