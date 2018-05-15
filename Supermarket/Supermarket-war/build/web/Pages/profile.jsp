<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entities.Users"%>
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
                Users client = (Users) session.getAttribute("client");
        %>
            <%@include file="/PageStyle/sessionActive.jsp"%>

            <!-- Registro -->
            <form class="Register" method="post" action="FrontServlet">
                <fieldset>
                    <legend>Editar Perfil de Usuario</legend>
                    <label for="nombre">Nombre</label>
                    <input class="nombre" type="text" name="nombre" value="<%=client.getNombre()%>" required=""><br>
                    <label for="apellido1">Apellidos</label>
                    <input class="appellidos" type="text" name="apellidos" value="<%=client.getApellidos()%>" required=""><br>
                    <label for="usuario">Fecha de Nacimiento</label>
                    <input class="date" type="date" name="date" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(client.getFecha())%>" m required=""><br>
                    <label for="usuario">Usuario</label>
                    <input class="user" type="text" name="user" value="<%=client.getUsuario()%>" required=""><br>
                    <label for="correo">Correo Electrónico</label>
                    <input class="correo" type="email" name="email" value="<%=client.getEmail()%>" required=""><br>
                    <label for="password">Contraseña</label>
                    <input class="password" type="password" name="password" value="" required=""><br>
                    <label for="password">Repetir Contraseña</label>
                    <input class="password" type="password" name="password" value="" required=""><br>
                    <input type="hidden" name="window" value="/index.jsp">
                    <input type="hidden" name="command" value="EditProfile">
                    <button type="submit" name="cancel" class="btn btn-primary">Eliminar cuenta</button>
                    <button id="editProfile" type="submit" name="save" class="btn btn-primary">Guardar</button>
                </fieldset>
            </form>

            <!-- Footer -->
            <%@include file="/PageStyle/footer.jsp"%>

        <% } else
                response.sendRedirect("FrontServlet?command=Unknown");
        %>
    </body>
</html>