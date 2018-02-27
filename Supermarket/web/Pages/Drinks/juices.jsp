<%@page import="Model.Article"%>
<%@page import="Model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Zumos</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <% } %>
        
        <!-- Navegación -->
        <nav>
            <ul class="menu">
                <li><a href="FrontServlet?command=Categoria&window=/Pages/Drinks/drinks.jsp">Bebidas</a>
                    <ul>
                        <li><a href="FrontServlet?command=Categoria&window=/Pages/Drinks/refreshments.jsp">Refresco</a>
                            <ul>
                                <li><a href="FrontServlet?command=Categoria&window=/Pages/Drinks/Refreshments/flavor.jsp">De Sabores</a></li>
                                <li><a href="FrontServlet?command=Categoria&window=/Pages/Drinks/Refreshments/light.jsp">Deportivos</a></li>
                            </ul>
                        </li>
                        <li><a href="FrontServlet?command=Categoria&window=/Pages/Drinks/wine.jsp">Vino</a></li>
                        <li><a href="FrontServlet?command=Categoria&window=/Pages/Drinks/water.jsp">Agua</a></li>
                        <li><a href="FrontServlet?command=Categoria&window=/Pages/Drinks/juices.jsp">Zumos</a></li>
                    </ul>
                </li>
                <li><a href="FrontServlet?command=Categoria&window=/Pages/Food/food.jsp">Alimentación</a>
                    <ul>
                        <li><a href="FrontServlet?command=Categoria&window=/Pages/Food/diaryProducts.jsp">Lácteos</a></li>
                        <li><a href="FrontServlet?command=Categoria&window=/Pages/Food/pasta.jsp">Pastas</a></li>
                        <li><a href="FrontServlet?command=Categoria&window=/Pages/Food/preparations.jsp">Preparados</a></li>
                        <li><a href="FrontServlet?command=Categoria&window=/Pages/Food/frozen.jsp">Congelados</a></li>
                    </ul>
                </li>
                <li><a href="FrontServlet?command=Categoria&window=/Pages/Drugstore/drugstore.jsp">Droguería</a></li>
                <li><a href="FrontServlet?command=Categoria&window=/Pages/StationerShop/stationerShop.jsp">Papelería</a></li>
                <li><a href="FrontServlet?command=Categoria&window=/Pages/Car/car.jsp">Automóvil</a>
                    <ul>
                        <li><a href="FrontServlet?command=Categoria&window=/Pages/Car/accessories.jsp">Accesorios</a></li>
                        <li><a href="FrontServlet?command=Categoria&window=/Pages/Car/cleaning.jsp">Limpieza</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        
        <!-- Artículos -->
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Don Simón Naranja</div>
                <img src="images/articulos/zumos/don-simon-naranja-escalar.jpg" alt="Don Simon">
                <h6>1.43 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Don Simon Naranja">
                        <input type="hidden" name="imageArticle" value="images/articulos/zumos/don-simon-naranja-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.43">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto1">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Don Simon Naranja">
                        <input type="hidden" name="imageArticle" value="images/articulos/zumos/don-simon-naranja-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.43">
                        <input type="hidden" name="window" value="/Pages/Drinks/juices.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Juver Melocotón</div>
                <img src="images/articulos/zumos/juver-melocoton-escalar.jpg" alt="Juver Melocotón">
                <h6>1.34 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Juver Melocoton">
                        <input type="hidden" name="imageArticle" value="images/articulos/zumos/juver-melocoton-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.34">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto3">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Juver Melocoton">
                        <input type="hidden" name="imageArticle" value="images/articulos/zumos/juver-melocoton-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.34">
                        <input type="hidden" name="window" value="/Pages/Drinks/juices.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Juver Piña</div>
                <img src="images/articulos/zumos/juver-pina-escalar.jpg" alt="Juver Piña">
                <h6>1.44 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Juver Pina">
                        <input type="hidden" name="imageArticle" value="images/articulos/zumos/juver-pina-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.44">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto5">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Juver Pina">
                        <input type="hidden" name="imageArticle" value="images/articulos/zumos/juver-pina-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.44">
                        <input type="hidden" name="window" value="/Pages/Drinks/juices.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Libby's Naranja</div>
                <img src="images/articulos/zumos/libby's-naranja-1L-escalar.jpg" alt="Libby's Naranja">
                <h6>1.60 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Libby's Naranja">
                        <input type="hidden" name="imageArticle" value="images/articulos/zumos/libby's-naranja-1L-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.60">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto7">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Libby's Naranja">
                        <input type="hidden" name="imageArticle" value="images/articulos/zumos/libby's-naranja-1L-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.60">
                        <input type="hidden" name="window" value="/Pages/Drinks/juices.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>