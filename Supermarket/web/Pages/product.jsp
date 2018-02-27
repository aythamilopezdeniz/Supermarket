<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Características</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link type="text/css" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            if(session.getAttribute("user")==null) {
        %>
        <header class="SignIn-Login">
            <ul>
                <li><a class="title" href="index.jsp">Supermercado Torres</a></li>
                <li>
                    <form>
                        <input type="text" name="search" placeholder="Buscar producto" required="">
                        <button type="submit">Buscar</button>
                    </form>
                </li>
                <li><a href="FrontServlet?command=SignIn">Registrarse</a></li>
                <li><a href="Pages/login.jsp">Login</a></li>
                <li><a href="FrontServlet?command=ShoppingCart"><span class="glyphicon glyphicon-shopping-cart"></span> Cesta</a></li>
            </ul>
        </header>
        <% } else {%>
        <header class="SignIn-Login">
            <ul>
                <li><a class="title" href="index.jsp">Supermercado Torres</a></li>
                <li>
                    <form>
                        <input type="text" name="search" placeholder="Buscar producto" required="">
                        <button type="submit">Buscar</button>
                    </form>
                </li>
                <li><p><%=session.getAttribute("user")%></p></li>
                <li><a href="FrontServlet?command=Logout">Cerrar Sesión</a></li>
                <li><a href="FrontServlet?command=ShoppingCart"><span class="glyphicon glyphicon-shopping-cart"></span> Cesta</a></li>
            </ul>
        </header>
        <% } 
            ArrayList<String> article = (ArrayList<String>) session.getAttribute(request.getParameter("idProducto"));
        %>
        <div>
            <h5><%=article.get(0)%></h5>
            <div><img src="<%=article.get(1)%>"></div>
            <div>Precio <%=article.get(2) + " €"%>
                <form method="post" action="FrontServlet">
                    <!--<input type="hidden" name="nameArticle" value="Don Simon Naranja">-->
                    <input type="text" name="nameArticle" value="<%=article.get(0)%>">
                    <!--<input type="hidden" name="imageArticle" value="images/articulos/zumos/don-simon-naranja-escalar.jpg">-->
                    <input type="text" name="imageArticle" value="<%=article.get(1)%>">
                    <!--<input type="hidden" name="pvpArticle" value="1.43">-->
                    <input type="text" name="pvpArticle" value="<%=article.get(2)%>">
                    <input type="text" name="window" value="<%=request.getParameter("window")%>">
                    <input type="text" name="idProducto" value="<%=request.getParameter("idProducto")%>">
                    <input type="text" name="command" value="Product">
                    <input type="submit" value="Añadir al Carro">
                </form>
            </div>
        </div>
    </body>
</html>
