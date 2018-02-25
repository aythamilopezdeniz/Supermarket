<%@page import="Model.Article"%>
<%@page import="Model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Papelería</title>
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
                <div class="desc">Airport Mochila Azul</div>
                <a target="_blank" href="images/articulos/papeleria/airport-mochila-azul-escalar.jpg">
                    <img src="images/articulos/papeleria/airport-mochila-azul-escalar.jpg" alt="Airport Mochila Azul">
                </a>
                <h6>10.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Airport Mochila Azul">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/airport-mochila-azul-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="10.95">
                        <input type="hidden" name="window" value="/Pages/stationerShop.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Airport Mochila Vintage</div>
                <a target="_blank" href="images/articulos/papeleria/airport-mochila-vintage-escalar.jpg">
                    <img src="images/articulos/papeleria/airport-mochila-vintage-escalar.jpg" alt="Airport Mochila Vintage">
                </a>
                <h6>15.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Airport Mochila Vintage">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/airport-mochila-vintage-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="15.95">
                        <input type="hidden" name="window" value="/Pages/stationerShop.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Bic Cristal Soft Azul</div>
                <a target="_blank" href="images/articulos/papeleria/bic-cristal-soft-azul-escalar.jpg">
                    <img src="images/articulos/papeleria/bic-cristal-soft-azul-escalar.jpg" alt="Bic Cristal Soft Azul">
                </a>
                <h6>9.10 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Bic Cristal Soft Azul">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/bic-cristal-soft-azul-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="9.10">
                        <input type="hidden" name="window" value="/Pages/stationerShop.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Oxford Cuaderno</div>
                <a target="_blank" href="images/articulos/papeleria/oxford-cuaderno-escalar.jpg">
                    <img src="images/articulos/papeleria/oxford-cuaderno-escalar.jpg" alt="Oxford Cuaderno">
                </a>
                <h6>3.30 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Oxford Cuaderno">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/oxford-cuaderno-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.30">
                        <input type="hidden" name="window" value="/Pages/stationerShop.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Pacsa Cuaderno 3x3</div>
                <a target="_blank" href="images/articulos/papeleria/pacsa-cuaderno-3x3-escalar.jpg">
                    <img src="images/articulos/papeleria/pacsa-cuaderno-3x3-escalar.jpg" alt="Pacsa Cuaderno 3x3">
                </a>
                <h6>1.50 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Pacsa Cuaderno 3x3">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/pacsa-cuaderno-3x3-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.50">
                        <input type="hidden" name="window" value="/Pages/stationerShop.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Pacsa Cuaderno 4x4</div>
                <a target="_blank" href="images/articulos/papeleria/pacsa-cuaderno-4x4-escalar.jpg">
                    <img src="images/articulos/papeleria/pacsa-cuaderno-4x4-escalar.jpg" alt="Pacsa Cuaderno 4x4">
                </a>
                <h6>3.10 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Pacsa Cuaderno 4x4">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/pacsa-cuaderno-4x4-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.10">
                        <input type="hidden" name="window" value="/Pages/stationerShop.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Estuche Patrulla Canina</div>
                <a target="_blank" href="images/articulos/papeleria/patrulla-canina-estuche-escalar.jpg">
                    <img src="images/articulos/papeleria/patrulla-canina-estuche-escalar.jpg" alt="Estuche Patrulla Canina">
                </a>
                <h6>5.10 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Estuche Patrulla Canina">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/patrulla-canina-estuche-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="5.10">
                        <input type="hidden" name="window" value="/Pages/stationerShop.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Pilot Super Grip Azul</div>
                <a target="_blank" href="images/articulos/papeleria/pilot-super-grip-azul-escalar.jpg">
                    <img src="images/articulos/papeleria/pilot-super-grip-azul-escalar.jpg" alt="Pilot Super Grip Azul">
                </a>
                <h6>3.10 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Pilot Super Grip Azul">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/pilot-super-grip-azul-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.10">
                        <input type="hidden" name="window" value="/Pages/stationerShop.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">UniBall Eye Ub-150</div>
                <a target="_blank" href="images/articulos/papeleria/uni-ball-eye-ub-150-escalar.jpg">
                    <img src="images/articulos/papeleria/uni-ball-eye-ub-150-escalar.jpg" alt="UniBall Eye Ub-150">
                </a>
                <h6>2.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="UniBall Eye Ub-150">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/uni-ball-eye-ub-150-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.95">
                        <input type="hidden" name="window" value="/Pages/stationerShop.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
