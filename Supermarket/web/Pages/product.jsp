<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Características</title>
        <%@include file="/PageStyle/head.jsp"%>
    </head>
    <body>
        <%
            if(session.getAttribute("user")==null) {
        %>
            <%@include file="/PageStyle/nonActiveSession.jsp"%>
        <% } else {%>
            <%@include file="/PageStyle/sessionActive.jsp"%>
        <% }
            ArrayList<String> article = (ArrayList<String>) session.getAttribute(request.getParameter("idProducto"));
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
                                <img class="mr-3" src="<%=article.get(1)%>" alt="">
                                <div class="media-body">
                                    <h5 class="mt-0"><%=article.get(0)%></h5>
                                    <%=article.get(3)%>
                                </div>
                            </div>
                        </th>
                        <th id="price"><%=article.get(2) + " €"%></th>
                        <th>
                            <form class="product" method="post" action="FrontServlet">
                                <input type="hidden" name="nameArticle" value="<%=article.get(0)%>">
                                <input type="hidden" name="imageArticle" value="<%=article.get(1)%>">
                                <input type="hidden" name="pvpArticle" value="<%=article.get(2)%>"><br>
                                <input type="hidden" name="descriptionArticle" value="<%=article.get(3)%>"><br>
                                <input type="hidden" name="window" value="<%=request.getParameter("window")%>">
                                <input type="hidden" name="idProducto" value="<%=request.getParameter("idProducto")%>">
                                <input type="hidden" name="command" value="Product">
                                <button type="submit" value=""><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></button>
                            </form>
                        </th>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Footer -->
        <%@include file="/PageStyle/footer.jsp"%>

        <!--<div>
            <h5><%=article.get(0)%></h5>
            <div><img src="<%=article.get(1)%>"></div>
            <div>Precio <%=article.get(2) + " €"%>
                <form method="post" action="FrontServlet">
                    <!--<input type="hidden" name="nameArticle" value="Don Simon Naranja">-->
                    <!--<input type="text" name="nameArticle" value="<%=article.get(0)%>">
                    <!--<input type="hidden" name="imageArticle" value="images/articulos/zumos/don-simon-naranja-escalar.jpg">-->
                    <!--<input type="text" name="imageArticle" value="<%=article.get(1)%>">
                    <!--<input type="hidden" name="pvpArticle" value="1.43">-->
                    <!--<input type="text" name="pvpArticle" value="<%=article.get(2)%>"><br>
                    <input type="text" name="descriptionArticle" value="<%=article.get(3)%>"><br>
                    <input type="text" name="window" value="<%=request.getParameter("window")%>">
                    <input type="text" name="idProducto" value="<%=request.getParameter("idProducto")%>">
                    <input type="text" name="command" value="Product">
                    <input type="submit" value="Añadir al Carro">
                </form>
            </div>
        </div>-->
    </body>
</html>
