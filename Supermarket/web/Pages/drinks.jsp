<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Bebidas</title>
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
                <li><a href="FrontServlet?command=Login">Login</a></li>
                <li><a href="FrontServlet?command=ShoppingCart"><span class="glyphicon glyphicon-shopping-cart"></span> Cesta</a></li>
            </ul>
        </header>
        <% } else { %>
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
        <% } %>
        
        <!-- Navegación -->
        <nav>
            <ul class="menu">
                <li><a href="FrontServlet?command=Categoria&window=drinks">Bebidas</a>
                    <ul>
                        <li><a href="FrontServlet?command=Categoria&window=refreshments">Refresco</a>
                            <ul>
                                <li><a href="FrontServlet?command=Categoria&window=flavor">De Sabores</a></li>
                                <li><a href="FrontServlet?command=Categoria&window=light">Deportivos</a></li>
                            </ul>
                        </li>
                        <li><a href="FrontServlet?command=Categoria&window=wine">Vino</a></li>
                        <li><a href="FrontServlet?command=Categoria&window=water">Agua</a></li>
                        <li><a href="FrontServlet?command=Categoria&window=juices">Zumos</a></li>
                    </ul>
                </li>
                <li><a href="FrontServlet?command=Categoria&window=food">Alimentación</a>
                    <ul>
                        <li><a href="FrontServlet?command=Categoria&window=diaryProducts">Lácteos</a></li>
                        <li><a href="FrontServlet?command=Categoria&window=pasta">Pastas</a></li>
                        <li><a href="FrontServlet?command=Categoria&window=preparations">Preparados</a></li>
                        <li><a href="FrontServlet?command=Categoria&window=frozen">Congelados</a></li>
                    </ul>
                </li>
                <li><a href="FrontServlet?command=Categoria&window=drugstore">Droguería</a></li>
                <li><a href="FrontServlet?command=Categoria&window=stationerShop">Papelería</a></li>
                <li><a href="FrontServlet?command=Categoria&window=car">Automóvil</a>
                    <ul>
                        <li><a href="FrontServlet?command=Categoria&window=accessories">Accesorios</a></li>
                        <li><a href="FrontServlet?command=Categoria&window=cleaning">Limpieza</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </body>
</html>
