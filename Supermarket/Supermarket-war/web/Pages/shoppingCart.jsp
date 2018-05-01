<%@page import="StatefulBeans.StatefulCart"%>
<%@page import="Entities.Article"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Shopping Cart</title>
        <%@include file="/PageStyle/head.jsp"%>
    </head>
    <body>
        <!-- Header -->
        <%@include file="/PageStyle/navbar.jsp"%>
        
        <!-- Carrito -->
        <div class="pedido">
            <div class="container">
                <table id="cart" class="table table-hover table-condensed">
                    <thead>
                        <tr>
                            <th style="width:50%">Producto</th>
                            <th style="width:10%">Precio</th>
                            <th style="width:8%">Cantidad</th>
                            <th style="width:22%" class="text-center">Subtotal</th>
                            <th style="width:10%"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (!session.isNew()) {
                                StatefulCart shoppingCart = (StatefulCart) session.getAttribute("shoppingCart");
                                if (shoppingCart != null) {
                                    if (!shoppingCart.isEmpty()) {
                        %>
                        <tr><%
                            for (Article article : shoppingCart.getCart()) {%>
                            <td data-th="Product">
                                <div class="row">
                                    <div class="col-sm-2 hidden-xs"><img src="<%=article.getImagen()%>" alt="..." class="img-responsive"/></div>
                                    <div class="col-sm-10">
                                        <h4 class="nomargin"><%=article.getNombre()%></h4>
                                        <p><%=article.getDescription()%></p>
                                    </div>
                                </div>
                            </td>
                            <td data-th="Price">
                                <%=article.getPvp() + " €"%></td>
                            <td data-th="Quantity"><%=article.getCantidad()%>
                            </td>
                            <td data-th="Subtotal" class="text-center"><%=(article.calculatePrice(article.getPvp(), article.getCantidad()))%></td>
                            <td class="actions" data-th="">
                                <form method="post" action="FrontServlet">
                                    <input type="hidden" name="idArticle" value="<%=article.getId()%>">
                                    <input type="hidden" name="nameArticle" value="<%=article.getNombre()%>">
                                    <input type="hidden" name="imageArticle" value="<%=article.getImagen()%>">
                                    <input type="hidden" name="pvpArticle" value="<%=article.getPvp()%>"><br>
                                    <input type="hidden" name="window" value="/Pages/shoppingCart.jsp">
                                    <input type="hidden" name="command" value="RemoveProduct">
                                    <button class="btn btn-danger btn-sm" type="submit"><i class="fa fa-trash-o"></i></button>
                                </form>
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                    <tfoot>
                        <tr class="visible-xs">
                            <td class="text-center"><strong>Total </strong></td>
                        </tr>
                        <tr>
                            <td><a href="index.jsp" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue comprando</a></td>
                            <td colspan="2" class="hidden-xs"></td>
                            <td class="hidden-xs text-center"><strong>Total </strong><%=shoppingCart.calculatePriceCart() + " €"%></td>
                            <td><a href="FrontServlet?command=Redirect&window=/Pages/registerCashOrder.jsp" class="btn btn-success btn-block">Continuar Pedido <i class="fa fa-angle-right"></i></a></td>
                        </tr>
                    </tfoot><%
                                }
                            }
                        }
                    %>
                </table>
            </div>
        </div>

        <!-- Footer -->
        <%@include file="/PageStyle/footer.jsp"%>
    </body>
</html>