<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Editar Perfil</title>
        <%@include file="/PageStyle/head.jsp"%>
    </head>
    <body>
        <%
            if (session.getAttribute("user") != null && session.getAttribute("password") != null) {
        %>
            <%@include file="/PageStyle/sessionActive.jsp"%>

            <!-- Registro -->
            <form class="Register" method="post" action="FrontServlet">
                <fieldset>
                    <legend>Editar Perfil de Usuario</legend>
                    <label for="nombre">Nombre</label>
                    <input class="nombre" type="text" name="nombre" value="" required=""><br>
                    <label for="apellido1">Apellidos</label>
                    <input class="appellidos" type="text" name="apellidos" value="" required=""><br>
                    <label for="usuario">Fecha de Nacimiento</label>
                    <input class="date" type="date" name="date" value="" required=""><br>
                    <label for="usuario">Usuario</label>
                    <input class="user" type="text" name="user" value="" required=""><br>
                    <label for="correo">Correo Electrónico</label>
                    <input class="correo" type="email" name="email" value="" required=""><br>
                    <label for="password">Contraseña</label>
                    <input class="password" type="password" name="password" value="" required=""><br>
                    <label for="password">Repetir Contraseña</label>
                    <input class="password" type="text" name="password" value="" required=""><br>
                    <input type="hidden" name="window" value="/Pages/profile.jsp">
                    <input type="hidden" name="command" value="SignIn">
                    <!--<input class="register" type="submit" value="Registrarse">-->
                    <button id="cancel" type="submit" name="cancel" class="btn btn-primary">Cancelar</button>
                    <button id="register" type="submit" class="btn btn-primary">Guardar</button>
                </fieldset>
            </form>

            <!-- Footer -->
            <%@include file="/PageStyle/footer.jsp"%>

        <% } else
                response.sendRedirect("FrontServlet?command=Unknown");
        %>
    </body>
</html>