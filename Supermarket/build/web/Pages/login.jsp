<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <%@include file="/PageStyle/head.jsp"%>
    </head>
    <body>
        <%
            if(session.getAttribute("user") == null) {%>
        <!-- Header -->
            <%@include file="/PageStyle/nonActiveSession.jsp"%>

        <!-- Login -->
        <form class="login" method="get" action="FrontServlet">
            <fieldset>
                <legend>Identificarse</legend>
                <label for="usuario">Usuario</label>
                <input class="user" type="text" name="user"><br>
                <label for="usuario">Contraseña</label>
                <input class="password" type="password" name="password"><br>
                <input  type="hidden" name="command" value="Login">
                <input class="session" type="submit" value="Iniciar Sesión">
            </fieldset>
        </form>
        <%} else response.sendRedirect("FrontServlet?command=Unknown");%>
    </body>
</html>