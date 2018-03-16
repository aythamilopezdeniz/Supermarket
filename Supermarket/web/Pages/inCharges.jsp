<%@page import="Model.User"%>
<%@page import="Model.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Pedidos</title>
        <%@include file="/PageStyle/head.jsp"%>
    </head>
    <body>
        <%
            if (session.getAttribute("user") != null && session.getAttribute("password") != null) {
        %>
            <%@include file="/PageStyle/sessionActive.jsp"%>
        <% } else
                response.sendRedirect("FrontServlet?command=Unknown");%>
            <table class="table table-dark">
                <thead>
                    <tr>
                        <th scope="col">Pedido</th>
                        <th scope="col">Día</th>
                        <th scope="col">Hora</th>
                        <th scope="col">Pvp</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    User client = (User)session.getAttribute("client");
                    for (Pedido pedido : client.getPedido()) {
                        if(pedido.getState().equals("cola")) {%>
                            <tr>
                                <td><%=pedido.getShoppingCart().getCart() %></td>
                                <td><%=pedido.getDia()%></td>
                                <td><%=pedido.getHora()%></td>
                                <td><%=pedido.getPvp()%></td>
                                <td></td>
                            </tr>
                        <%}
                    }%>
                </tbody>
            </table>
    </body>
</html>