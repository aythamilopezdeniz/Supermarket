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
        <%if (session.getAttribute("user") != null && session.getAttribute("password") != null) {%>
                            <form class="product" method="post" action="FrontServlet">
                                <input type="hidden" name="nameArticle" value="<%=article.get(0)%>">
                                <input type="hidden" name="imageArticle" value="<%=article.get(1)%>">
                                <input type="hidden" name="pvpArticle" value="<%=article.get(2)%>"><br>
                                <input type="hidden" name="descriptionArticle" value="<%=article.get(3)%>"><br>
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
