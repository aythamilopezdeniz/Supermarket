<%@page import="Entities.Article"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Características</title>
        <%@include file="/PageStyle/head.jsp"%>
    </head>
    <body>
        <!-- Header -->
        <%@include file="/PageStyle/navbar.jsp"%>
        <%
            List<Article> article = (List<Article>) session.getAttribute(request.getParameter("idProducto"));
        %>
        <div class="producto">
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Producto</th>
                        <th scope="col">Precio</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>
                            <div class="media">
                                <img class="mr-3" src="<%=article.get(0).getImagen() %>" alt="">
                                <div class="media-body">
                                    <h5 class="mt-0"><%=article.get(0).getNombre() %></h5>
                                    <%=article.get(0).getDescription() %>
                                </div>
                            </div>
                        </th>
                        <th id="price"><%=article.get(0).getPvp() + " €"%></th>
                        <th>
                        <%if (session.getAttribute("user") != null && session.getAttribute("password") != null) {%>
                            <form class="product" method="post" action="FrontServlet">
                                <input type="hidden" name="nameArticle" value="<%=article.get(0).getNombre()%>">
                                <input type="hidden" name="imageArticle" value="<%=article.get(0).getImagen()%>">
                                <input type="hidden" name="pvpArticle" value="<%=article.get(0).getPvp()%>"><br>
                                <input type="hidden" name="descriptionArticle" value="<%=article.get(0).getDescription()%>"><br>
                                <input type="hidden" name="window" value="<%=request.getParameter("window")%>">
                                <input type="hidden" name="idProducto" value="<%=request.getParameter("idProducto")%>">
                                <input type="hidden" name="command" value="AddProduct">
                                <button type="submit"  class="btn btn-primary" value=""><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></button>
                            </form>
                        <%}%>
                        </th>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Footer -->
        <%@include file="/PageStyle/footer.jsp"%>
    </body>
</html>