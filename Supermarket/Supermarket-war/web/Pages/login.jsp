<%@page import="SingletonBeans.SingletonEstadisticasBean"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
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
        <form class="login" method="post" action="FrontServlet">
            <fieldset>
                <legend>Identificarse</legend>
                <label for="usuario">Usuario</label>
                <input class="user" type="text" name="name"><br>
                <label for="usuario">Contraseña</label>
                <input class="password" type="password" name="password"><br>
                <input  type="hidden" name="command" value="Login">
                <button id="session" type="submit" class="btn btn-primary">Iniciar Sesión</button>
            </fieldset>
        </form>

        <!-- Footer -->
        <%@include file="/PageStyle/footer.jsp"%>

        <%} else response.sendRedirect("FrontServlet?command=Unknown");%>
    </body>
</html>