<%@page import="Model.Article"%>
<%@page import="Model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Lácteos</title>
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
                <div class="desc">Huevos Dagu 12 Unidades</div>
                <img src="images/articulos/lacteos/huevos/dagu-12u-escalar.jpg" alt="Huevos Dagu 12 Unidades">
                <h6>5.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Huevos Dagu 12 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/huevos/dagu-12u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="5.95">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto67">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Huevos Dagu 12 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/huevos/dagu-12u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="5.95">
                        <input type="hidden" name="window" value="/Pages/Food/diaryProducts.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Huevos Los Rancheros 6 Unidades</div>
                <img src="images/articulos/lacteos/huevos/los-rancheros-6u-escalar.jpg" alt="Huevos Los Rancheros 6 Unidades">
                <h6>4.55 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Huevos Los Rancheros 6 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/huevos/los-rancheros-6u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="4.55">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto68">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Huevos Los Rancheros 6 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/huevos/los-rancheros-6u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="4.55">
                        <input type="hidden" name="window" value="/Pages/Food/diaryProducts.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Huevos Pazo de Vilane 6 Unidades</div>
                <img src="images/articulos/lacteos/huevos/pazo-de-vilane-6u-escalar.jpg" alt="Huevos Pazo de Villane 6 Unidades">
                <h6>4.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Huevos Pazo de Vilane 6 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/huevos/pazo-de-vilane-6u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="4.95">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto69">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Huevos Pazo de Vilane 6 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/huevos/pazo-de-vilane-6u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="4.95">
                        <input type="hidden" name="window" value="/Pages/Food/diaryProducts.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Huevos Pitas 12 Unidades</div>
                <img src="images/articulos/lacteos/huevos/pitas-12u-escalar.jpg" alt="Huevos Pitas 12 Unidades">
                <h6>6.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Huevos Pitas 12 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/huevos/pitas-12u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="6.95">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto70">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Huevos Pitas 12 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/huevos/pitas-12u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="6.95">
                        <input type="hidden" name="window" value="/Pages/Food/diaryProducts.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Yogur Activia Limón 4 Unidades</div>
                <img src="images/articulos/lacteos/yogur/activia-limon-4u-escalar.jpg" alt="Yogur Activia Limón 4 Unidades">
                <h6>2.45 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Yogur Activia Limón 4 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/yogur/activia-limon-4u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.95">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto71">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Yogur Activia Limón 4 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/yogur/activia-limon-4u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.95">
                        <input type="hidden" name="window" value="/Pages/Food/diaryProducts.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Yogur Danone 4 Unidades</div>
                <img src="images/articulos/lacteos/yogur/danone-4u-escalar.jpg" alt="Yogur Danone 4 Unidades">
                <h6>2.35 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Yogur Danone 4 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/yogur/danone-4u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.35">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto72">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Yogur Danone 4 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/yogur/danone-4u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.35">
                        <input type="hidden" name="window" value="/Pages/Food/diaryProducts.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Yogur Danone Limón 4 Unidades</div>
                <img src="images/articulos/lacteos/yogur/danone-limon-4u-escalar.jpg" alt="Yogur Danone Limón 4 Unidades">
                <h6>2.25 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Yogur Danone Limon 4 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/yogur/danone-limon-4u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.25">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto73">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Yogur Danone Limon 4 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/yogur/danone-limon-4u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.25">
                        <input type="hidden" name="window" value="/Pages/Food/diaryProducts.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Natillas Danone 4 Unidades</div>
                <img src="images/articulos/lacteos/yogur/danone-natillas-4u-escalar.jpg" alt="Natillas Danone 4 Unidades">
                <h6>2.65 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Natillas Danone 4 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/yogur/danone-natillas-4u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.65">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto74">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Natillas Danone 4 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/yogur/danone-natillas-4u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.65">
                        <input type="hidden" name="window" value="/Pages/Food/diaryProducts.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Yogur Kalise Variado 8 Unidades</div>
                    <img src="images/articulos/lacteos/yogur/kalise-variado-8u-escalar.jpg" alt="Yogur Kalise Variado 8 Unidades">
                <h6>3.45 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Yogur Kalise Variado 8 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/yogur/kalise-variado-8u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.45">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto75">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Yogur Kalise Variado 8 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/yogur/kalise-variado-8u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.45">
                        <input type="hidden" name="window" value="/Pages/Food/diaryProducts.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Leche Asturiana Desnatada</div>
                    <img src="images/articulos/lacteos/leche/asturiana-desnatada-escalar.jpg" alt="Leche Asturiana Desnatada">
                <h6>2.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Leche Asturiana Desnatada">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/asturiana-desnatada-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.95">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto76">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Leche Asturiana Desnatada">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/asturiana-desnatada-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.95">
                        <input type="hidden" name="window" value="/Pages/Food/diaryProducts.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Leche Asturiana Entera</div>
                    <img src="images/articulos/lacteos/leche/asturiana-entera-escalar.jpg" alt="Leche Asturiana Entera">
                <h6>2.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Leche Asturiana Entera">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/asturiana-entera-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.95">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto77">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Leche Asturiana Entera">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/asturiana-entera-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.95">
                        <input type="hidden" name="window" value="/Pages/Food/diaryProducts.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Leche Calo Entera</div>
                    <img src="images/articulos/lacteos/leche/calo-entera-escalar.jpg" alt="Leche Calo Entera">
                <h6>2.75 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Leche Calo Entera">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/calo-entera-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.75">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto78">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Leche Calo Entera">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/calo-entera-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.75">
                        <input type="hidden" name="window" value="/Pages/Food/diaryProducts.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Leche Celgan Desnatada</div>
                    <img src="images/articulos/lacteos/leche/celgan-desnatada-escalar.jpg" alt="Leche Celgan Desnatada">
                <h6>3.10 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Leche Celgan Desnatada">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/celgan-desnatada-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.10">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto79">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Leche Celgan Desnatada">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/celgan-desnatada-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.10">
                        <input type="hidden" name="window" value="/Pages/Food/diaryProducts.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Leche Celta Entera</div>
                    <img src="images/articulos/lacteos/leche/celta-entera-escalar.jpg" alt="Leche Celta Entera">
                <h6>2.85 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Leche Celta Entera">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/celta-entera-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.85">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto80">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Leche Celta Entera">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/celta-entera-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.85">
                        <input type="hidden" name="window" value="/Pages/Food/diaryProducts.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Leche Pascual Desnatada</div>
                    <img src="images/articulos/lacteos/leche/pascual-desnatada-escalar.jpg" alt="Leche Pascual Desnatada">
                <h6>3.25 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Leche Pascual Desnatada">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/pascual-desnatada-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.25">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto81">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Leche Pascual Desnatada">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/pascual-desnatada-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.25">
                        <input type="hidden" name="window" value="/Pages/Food/diaryProducts.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Leche Pascual Entera</div>
                    <img src="images/articulos/lacteos/leche/pascual-entera-escalar.jpg" alt="Leche Pascual Entera">
                <h6>3.15 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Leche Pascual Entera">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/pascual-entera-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.15">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto82">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Leche Pascual Entera">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/pascual-entera-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.15">
                        <input type="hidden" name="window" value="/Pages/Food/diaryProducts.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Leche Puleva Desnatada</div>
                    <img src="images/articulos/lacteos/leche/puleva-desnatada-escalar.jpg" alt="Leche Puleva Desnatada">
                <h6>3.45 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Leche Puleva Desnatada">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/puleva-desnatada-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.45">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto83">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Leche Puleva Desnatada">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/puleva-desnatada-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.45">
                        <input type="hidden" name="window" value="/Pages/Food/diaryProducts.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Leche Puleva Entera</div>
                    <img src="images/articulos/lacteos/leche/puleva-entera-escalar.jpg" alt="Leche Puleva Entera">
                <h6>3.45 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Leche Puleva Entera">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/puleva-entera-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.45">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto84">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Leche Puleva Entera">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/puleva-entera-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.45">
                        <input type="hidden" name="window" value="/Pages/Food/diaryProducts.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>