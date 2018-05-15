<%@page import="Entities.Pedido"%>
<%@page import="java.util.List"%>
<%@page import="StatelessFacade.PedidoFacade"%>
<%@page import="Entities.Article"%>
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
        <%  } else
                response.sendRedirect("FrontServlet?command=Unknown");%>
            <table class="table table-dark">
                <thead>
                    <tr>
                        <th scope="col">Pedido</th>
                        <th scope="col">Día</th>
                        <th scope="col">Hora</th>
                        <th scope="col">Pvp</th>
                        <th scope="col" class="busquedaPedido">
                            <form action="FrontServlet" method="POST">
                                <input type="text" name="estado" placeholder="Search.." />
                                <input type="hidden" name="command" value="InCharges" />
                                <input type="hidden" name="window" value="/Pages/inCharges.jsp" />
                            </form>
                        </th>
                    </tr>
                </thead>
                <tbody>
                <%
                    List<Pedido> pedidosCliente = (List<Pedido>) session.getAttribute("pedidosCliente");
                    if(!pedidosCliente.isEmpty()) {
                        for (Pedido pedido : pedidosCliente) {
                            if(pedido.getEstado().equals("cola")) {%>
                                <tr>
                                    <td><%=pedido.getId()%></td>
                                    <td><%=pedido.getDia()%></td>
                                    <td><%=pedido.getHora()%></td>
                                    <td><%=pedido.getPvp() + " €"%></td>
                                    <td></td>
                                </tr>
                            <%}
                        }
                    }%>
                </tbody>
            </table>
    </body>
</html>