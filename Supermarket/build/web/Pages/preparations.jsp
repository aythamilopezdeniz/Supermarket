<%@page import="Model.Article"%>
<%@page import="Model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Alimentos preparados</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link type="text/css" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
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
        <% } else { 
            if(request.getParameter("command")!=null){
                Cart shoppingCart = (Cart) session.getAttribute("shoppingCart");
                shoppingCart.addArticle(new Article(request.getParameter("nameArticle"), 
                        request.getParameter("imageArticle"), 
                        request.getParameter("pvpArticle")));
            }
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
                <li><p><%=session.getAttribute("user")%></p></li>
                <li><a href="FrontServlet?command=Logout">Cerrar Sesión</a></li>
                <li><a href="FrontServlet?command=ShoppingCart"><span class="glyphicon glyphicon-shopping-cart"></span> Cesta</a></li>
            </ul>
        </header>
        <% } %>
        
        <!-- Navegación -->
        <nav>
            <ul class="menu">
                <li><a href="FrontServlet?command=Categoria&window=/Pages/drinks.jsp">Bebidas</a>
                    <ul>
                        <li><a href="FrontServlet?command=Categoria&window=/Pages/refreshments.jsp">Refresco</a>
                            <ul>
                                <li><a href="FrontServlet?command=Categoria&window=/Pages/flavor.jsp">De Sabores</a></li>
                                <li><a href="FrontServlet?command=Categoria&window=/Pages/light.jsp">Deportivos</a></li>
                            </ul>
                        </li>
                        <li><a href="FrontServlet?command=Categoria&window=/Pages/wine.jsp">Vino</a></li>
                        <li><a href="FrontServlet?command=Categoria&window=/Pages/water.jsp">Agua</a></li>
                        <li><a href="FrontServlet?command=Categoria&window=/Pages/juices.jsp">Zumos</a></li>
                    </ul>
                </li>
                <li><a href="FrontServlet?command=Categoria&window=/Pages/food.jsp">Alimentación</a>
                    <ul>
                        <li><a href="FrontServlet?command=Categoria&window=/Pages/diaryProducts.jsp">Lácteos</a></li>
                        <li><a href="FrontServlet?command=Categoria&window=/Pages/pasta.jsp">Pastas</a></li>
                        <li><a href="FrontServlet?command=Categoria&window=/Pages/preparations.jsp">Preparados</a></li>
                        <li><a href="FrontServlet?command=Categoria&window=/Pages/frozen.jsp">Congelados</a></li>
                    </ul>
                </li>
                <li><a href="FrontServlet?command=Categoria&window=/Pages/drugstore.jsp">Droguería</a></li>
                <li><a href="FrontServlet?command=Categoria&window=/Pages/stationerShop.jsp">Papelería</a></li>
                <li><a href="FrontServlet?command=Categoria&window=/Pages/car.jsp">Automóvil</a>
                    <ul>
                        <li><a href="FrontServlet?command=Categoria&window=/Pages/accessories.jsp">Accesorios</a></li>
                        <li><a href="FrontServlet?command=Categoria&window=/Pages/cleaning.jsp">Limpieza</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        
        <!-- Artículos -->
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Carretilla Alubias</div>
                <a target="_blank" href="images/articulos/preparados/Carretilla-alubias-escalar.jpg">
                    <img src="images/articulos/preparados/Carretilla-alubias-escalar.jpg" alt="Carretilla Alubias">
                </a>
                <h6>6.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Carretilla Alubias">
                        <input type="hidden" name="imageArticle" value="images/articulos/preparados/Carretilla-alubias-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="6.95">
                        <input type="hidden" name="window" value="/Pages/preparations.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Carretilla Arroz con pollo al Curry</div>
                <a target="_blank" href="images/articulos/preparados/Carretilla-arroz-con-pollo-al-curry-escalar.jpg">
                    <img src="images/articulos/preparados/Carretilla-arroz-con-pollo-al-curry-escalar.jpg" alt="Carretilla Arroz con Pollo al Curry">
                </a>
                <h6>7.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Carretilla Arroz con pollo al Curry">
                        <input type="hidden" name="imageArticle" value="images/articulos/preparados/Carretilla-arroz-con-pollo-al-curry-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="7.95">
                        <input type="hidden" name="window" value="/Pages/preparations.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Isabel Albóndigas con Atún</div>
                <a target="_blank" href="images/articulos/preparados/Isabel-albondigas-con-atun-escalar.jpg">
                    <img src="images/articulos/preparados/Isabel-albondigas-con-atun-escalar.jpg" alt="Isable Albóndigas con Atún">
                </a>
                <h6>5.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Isabel Albondigas con Atun">
                        <input type="hidden" name="imageArticle" value="images/articulos/preparados/Isabel-albondigas-con-atun-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="5.95">
                        <input type="hidden" name="window" value="/Pages/preparations.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Louriño Albóndigas con Guisantes</div>
                <a target="_blank" href="images/articulos/preparados/Lourino-albondigas-con-guisantes-escalar.jpg">
                    <img src="images/articulos/preparados/Lourino-albondigas-con-guisantes-escalar.jpg" alt="Louriño Algóndigas con Guisantes">
                </a>
                <h6>6.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Lourino Albondigas con Guisantes">
                        <input type="hidden" name="imageArticle" value="images/articulos/preparados/Lourino-albondigas-con-guisantes-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="6.95">
                        <input type="hidden" name="window" value="/Pages/preparations.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Yatekomo Arroz 3 Delicias</div>
                <a target="_blank" href="images/articulos/preparados/Yatekomo-arroz-3-delicias-escalar.jpg">
                    <img src="images/articulos/preparados/Yatekomo-arroz-3-delicias-escalar.jpg" alt="Yatekomo Arroz 3 Delicias">
                </a>
                <h6>5.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Yatekomo Arroz 3 Delicias">
                        <input type="hidden" name="imageArticle" value="images/articulos/preparados/Yatekomo-arroz-3-delicias-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="5.95">
                        <input type="hidden" name="window" value="/Pages/preparations.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>