<%@page import="Model.Article"%>
<%@page import="Model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Congelados</title>
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
        <%}%>
        
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
                <div class="desc">Abadan Alas de Pollo</div>
                <img src="images/articulos/congelados/carne/abadan-alas-de-pollo-escalar.jpg" alt="Abadan Alas de Pollo">
                <h6>14.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Abadan Alas de Pollo">
                        <input type="hidden" name="imageArticle" value="images/articulos/congelados/carne/abadan-alas-de-pollo-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="14.95">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto60">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Abadan Alas de Pollo">
                        <input type="hidden" name="imageArticle" value="images/articulos/congelados/carne/abadan-alas-de-pollo-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="14.95">
                        <input type="hidden" name="window" value="/Pages/Food/frozen.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Meet Beef Albóndigas</div>
                <img src="images/articulos/congelados/carne/meet-beef-albondigas-escalar.jpg" alt="Meet Beef Albóndigas">
                <h6>15.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Meet Beef Albondigas">
                        <input type="hidden" name="imageArticle" value="images/articulos/congelados/carne/meet-beef-albondigas-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="15.95">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto61">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Meet Beef Albondigas">
                        <input type="hidden" name="imageArticle" value="images/articulos/congelados/carne/meet-beef-albondigas-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="15.95">
                        <input type="hidden" name="window" value="/Pages/Food/frozen.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Meet Chicken Solomillo de Pollo</div>
                <img src="images/articulos/congelados/carne/meet-chicken-solimillo-de-pollo-escalar.jpg" alt="Meet Chicken Solomillo de Pollo">
                <h6>18.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Meet Chicken Solomillo de Pollo">
                        <input type="hidden" name="imageArticle" value="images/articulos/congelados/carne/meet-chicken-solomillo-de-pollo-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="18.95">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto62">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Meet Chicken Solomillo de Pollo">
                        <input type="hidden" name="imageArticle" value="images/articulos/congelados/carne/meet-chicken-solomillo-de-pollo-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="18.95">
                        <input type="hidden" name="window" value="/Pages/Food/frozen.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Campos Bocados de Atún</div>
                <img src="images/articulos/congelados/pescado/campos-bocados-de-atun-escalar.jpg" alt="Campos Bocados de Atún">
                <h6>14.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Campos Bocados de Atun">
                        <input type="hidden" name="imageArticle" value="images/articulos/congelados/pescado/campos-bocados-de-atun-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="14.95">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto63">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Campos Bocados de Atun">
                        <input type="hidden" name="imageArticle" value="images/articulos/congelados/pescado/campos-bocados-de-atun-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="14.95">
                        <input type="hidden" name="window" value="/Pages/Food/frozen.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Campos Filetes de Atún</div>
                <img src="images/articulos/congelados/pescado/campos-filetes-de-atun-escalar.jpg" alt="Campos Filetes de Atún">
                <h6>16.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Campos Filetes de Atun">
                        <input type="hidden" name="imageArticle" value="images/articulos/congelados/pescado/campos-filetes-de-atun-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="16.95">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto64">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Campos Filetes de Atun">
                        <input type="hidden" name="imageArticle" value="images/articulos/congelados/pescado/campos-filetes-de-atun-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="16.95">
                        <input type="hidden" name="window" value="/Pages/Food/frozen.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Findus Bacalado Rebosado</div>
                <img src="images/articulos/congelados/pescado/findus-bacalado-rebosado-escalar.jpg" alt="Findus Bacalado Rebosado">
                <h6>15.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Findus Bacalado Rebosado">
                        <input type="hidden" name="imageArticle" value="images/articulos/congelados/pescado/findus-bacalado-rebosado-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="15.95">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto65">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Findus Bacalado Rebosado">
                        <input type="hidden" name="imageArticle" value="images/articulos/congelados/pescado/findus-bacalado-rebosado-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="15.95">
                        <input type="hidden" name="window" value="/Pages/Food/frozen.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Pescanova Anillos a la Romana</div>
                <img src="images/articulos/congelados/pescado/pescanova-anillos-a-la-romana-escalar.jpg" alt="Pescanova Anillos a la Romana">
                <h6>15.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Pescanova Anillos a la Romana">
                        <input type="hidden" name="imageArticle" value="images/articulos/congelados/pescado/pescanova-anillos-a-la-romana-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="15.95">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto66">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Pescanova Anillos a la Romana">
                        <input type="hidden" name="imageArticle" value="images/articulos/congelados/pescado/pescanova-anillos-a-la-romana-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="15.95">
                        <input type="hidden" name="window" value="/Pages/Food/frozen.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>