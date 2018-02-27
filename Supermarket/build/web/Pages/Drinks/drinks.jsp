<%@page import="Model.Article"%>
<%@page import="Model.Cart"%>
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
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Colimoro Montepulciano</div>
                <img src="images/articulos/vinos/Colimoro-Montepulciano-escalar.jpg" alt="Colimoro Montepulciano">
                <h6>2.60 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Colimoro Montepulciano">
                        <input type="hidden" name="imageArticle" value="images/articulos/vinos/Colimoro-Montepulciano-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.60">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto2">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Colimoro Montepulciano">
                        <input type="hidden" name="imageArticle" value="images/articulos/vinos/Colimoro-Montepulciano-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.60">
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Romaneira</div>
                <img src="images/articulos/vinos/Romaneira-escalar.jpg" alt="Romaneira">
                <h6>3.60 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Romaneira">
                        <input type="hidden" name="imageArticle" value="images/articulos/vinos/Romaneira-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.60">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto4">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Romaneira">
                        <input type="hidden" name="imageArticle" value="images/articulos/vinos/Romaneira-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.60">
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Fernando Castilla</div>
                <img src="images/articulos/vinos/Fernando-castilla-escalar.jpg" alt="Fernando Castilla">
                <h6>2.89 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Fernando Castilla">
                        <input type="hidden" name="imageArticle" value="images/articulos/vinos/Fernando-castilla-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.44">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto6">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Fernando Castilla">
                        <input type="hidden" name="imageArticle" value="images/articulos/vinos/Fernando-castilla-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.89">
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Joel Gott</div>
                <img src="images/articulos/vinos/Joel-Gott-escalar.jpg" alt="Joel Gott">
                <h6>3.10 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Joel Gott">
                        <input type="hidden" name="imageArticle" value="images/articulos/vinos/Joel-Gott-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.10">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto8">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Joel Gott">
                        <input type="hidden" name="imageArticle" value="images/articulos/vinos/Joel-Gott-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.10">
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Pago de los Capellanes</div>
                <img src="images/articulos/vinos/Pago-de-los-Capellanes-escalar.jpg" alt="Pago de los Capellanes">
                <h6>2.90 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Pago de los Capellanes">
                        <input type="hidden" name="imageArticle" value="images/articulos/vinos/Pago-de-los-Capellanes-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.90">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto9">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Pago de los Capellanes">
                        <input type="hidden" name="imageArticle" value="images/articulos/vinos/Pago-de-los-Capellanes-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.90">
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Pepsi 2L</div>
                <img src="images/articulos/refrescos/sabores/Pepsi-2L-escalar.png" alt="Pepsi 2L">
                <h6>1.90 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Pepsi 2L">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/sabores/Pepsi-2L-escalar.png">
                        <input type="hidden" name="pvpArticle" value="1.90">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto10">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Pepsi 2L">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/sabores/Pepsi-2L-escalar.png">
                        <input type="hidden" name="pvpArticle" value="1.90">
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Coca cola</div>
                <img src="images/articulos/refrescos/sabores/coca-cola-lata-escalar.jpg" alt="Coca cola">
                <h6>1.20 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Coca cola">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/sabores/coca-cola-lata-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.20">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto11">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Coca cola">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/sabores/coca-cola-lata-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.20">
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Fanta</div>
                <img src="images/articulos/refrescos/sabores/fanta-lata-escalar.jpg" alt="Fanta">
                <h6>1.15 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Fanta">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/sabores/fanta-lata-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.15">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto12">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Fanta">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/sabores/fanta-lata-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.15">
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Pepsi Lata</div>
                <img src="images/articulos/refrescos/sabores/pepsi-lata-escalar.jpg" alt="Pepsi Lata">
                <h6>1.35 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Pepsi Lata">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/sabores/pepsi-lata-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.35">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto13">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Pepsi Lata">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/sabores/pepsi-lata-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.35">
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Sprite 1.5L</div>
                <img src="images/articulos/refrescos/sabores/sprite-1.5L-escalar.jpg" alt="Sprite 1.5L">
                <h6>1.75 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Sprite 1.5L">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/sabores/sprite-1.5L-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.75">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto14">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Sprite 1.5L">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/sabores/sprite-1.5L-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.75">
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Sprite Lata</div>
                <img src="images/articulos/refrescos/sabores/sprite-lata-escalar.jpg" alt="Sprite Lata">
                <h6>1.20 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Sprite Lata">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/sabores/sprite-lata-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.20">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto15">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Sprite Lata">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/sabores/sprite-lata-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.20">
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Coca Cola Light</div>
                <img src="images/articulos/refrescos/light/coca-cola-light-escalar.jpg" alt="Coca Cola Light">
                <h6>1.20 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Coca cola Light">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/light/coca-cola-light-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.20">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto16">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Coca cola Light">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/light/coca-cola-light-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.20">
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Fanta Light</div>
                <img src="images/articulos/refrescos/light/fanta-light-escalar.jpg" alt="Fanta Light">
                <h6>1.15 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Fanta Light">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/light/fanta-light-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.15">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto17">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Fanta Light">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/light/fanta-light-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.15">
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Pepsi Light</div>
                <img src="images/articulos/refrescos/light/pepsi-Light-escalar.jpg" alt="Pepsi Light">
                <h6>1.35 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Pepsi Light">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/light/pepsi-Light-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.35">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto18">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Pepsi Light">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/light/pepsi-Light-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.35">
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Sprite Light</div>
                <img src="images/articulos/refrescos/light/sprite-light-escalar.jpg" alt="Sprite Light">
                <h6>1.20 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Sprite Light">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/light/sprite-light-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.20">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto19">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Sprite Light">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/light/sprite-light-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.20">
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Bezolla 1.5L</div>
                <img src="images/articulos/agua/bezolla-1.5L-escalar.jpg" alt="Bezolla 1.5L">
                <h6>0.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Bezolla 1.5L">
                        <input type="hidden" name="imageArticle" value="images/articulos/agua/bezolla-1.5L-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="0.95">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto20">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Bezolla 1.5L">
                        <input type="hidden" name="imageArticle" value="images/articulos/agua/bezolla-1.5L-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="0.95">
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Firgas 1.5L</div>
                <img src="images/articulos/agua/firgas-1.5L-escalar.jpg" alt="Firgas 1.5L">
                <h6>1.05 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Figas 1.5L">
                        <input type="hidden" name="imageArticle" value="images/articulos/agua/firgas-1.5L-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.05">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto21">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Figas 1.5L">
                        <input type="hidden" name="imageArticle" value="images/articulos/agua/firgas-1.5L-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.05">
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Font Vella 1.5L</div>
                <img src="images/articulos/agua/font-vella-1.5L-escalar.jpg" alt="Font Vella 1.5L">
                <h6>1.15 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Font Vella">
                        <input type="hidden" name="imageArticle" value="images/articulos/agua/font-vella-1.5L-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.15">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto22">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Font Vella">
                        <input type="hidden" name="imageArticle" value="images/articulos/agua/font-vella-1.5L-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.15">
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Teror Sin Gas</div>
                <img src="images/articulos/agua/teror-sin-gas-1.5L-escalar.jpg" alt="Teror Sin Gas">
                <h6>1.10 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Terror Sin Gas">
                        <input type="hidden" name="imageArticle" value="images/articulos/agua/teror-sin-gas-1.5L-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.10">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto23">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Terror Sin Gas">
                        <input type="hidden" name="imageArticle" value="images/articulos/agua/teror-sin-gas-1.5L-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.10">
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>