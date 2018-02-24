<%@page import="Model.Article"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Commands.ShoppingCart"%>
<%@page import="Model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Supermercado Torres: Compra alimentación, ocio, hogar, moda.</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link type="text/css" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <!-- Header -->
        <%  if(request.getParameter("user")!=null && request.getParameter("password")!=null) {
                session.setAttribute("user", request.getParameter("user"));
                session.setAttribute("password", request.getParameter("password"));
            }
            if(session.isNew()) {
                Cart shoppingCart = new Cart();
                session.setAttribute("shoppingCart", shoppingCart);
            }
            if(request.getParameter("command")!=null){
                Cart shoppingCart = (Cart) session.getAttribute("shoppingCart");
                shoppingCart.addArticle(new Article(request.getParameter("nameArticle"), 
                        request.getParameter("imageArticle"), 
                        request.getParameter("pvpArticle")));
            }
            
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

        <!-- Imágenes -->
        <div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <style> img {max-height: 300px;}</style>
                    <img src="images/indexView/imagen1.jpg" alt="imagen1.jpg" width="1920" height="500">
                </div>
                <div class="item">
                    <img src="images/indexView/imagen2.jpg" alt="imagen2.jpg" width="1920" height="500">
                </div>
                <div class="item">
                    <img src="images/indexView/imagen3.jpg" alt="imagen3.jpg" width="1920" height="500">
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

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

        <!-- Artículos -->
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Don Simón Naranja</div>
                <a target="_blank" href="images/articulos/zumos/don-simon-naranja-escalar.jpg">
                    <img src="images/articulos/zumos/don-simon-naranja-escalar.jpg" alt="Don Simon">
                </a>
                <h6>1.43 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Don Simon Naranja">
                        <input type="hidden" name="imageArticle" value="images/articulos/zumos/don-simon-naranja-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.43">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                    <%
                    //Cart shoppingCart = (Cart) session.getAttribute("shoppingCart");
                    //shoppingCart.addArticle(new Article("Don Simón Naranja", "images/articulos/zumos/don-simon-naranja-escalar.jpg", "1.43"));
                    //out.println(shoppingCart.getArticle("Don Simón Naranja"));
                    //shoppingCart.addArticle("Don Simón Naranja", "", "1.43");
                    //shoppingCart.addArticle("Don Simón Naranja", "images/articulos/zumos/don-simon-naranja-escalar.jpg", "1.43");
                    //shoppingCart.setCart("Don Simón Naranja");
                    //shoppingCart.setCart("images/articulos/zumos/don-simon-naranja-escalar.jpg");
                    //shoppingCart.setCart("1.43");
                    %>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Colimoro Montepulciano</div>
                <a target="_blank" href="images/articulos/vinos/Colimoro-Montepulciano-escalar.jpg">
                    <img src="images/articulos/vinos/Colimoro-Montepulciano-escalar.jpg" alt="Colimoro Montepulciano">
                </a>
                <h6>2.60 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Colimoro Montepulciano">
                        <input type="hidden" name="imageArticle" value="images/articulos/vinos/Colimoro-Montepulciano-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.60">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Juver Melocotón</div>
                <a target="_blank" href="images/articulos/zumos/juver-melocoton-escalar.jpg">
                    <img src="images/articulos/zumos/juver-melocoton-escalar.jpg" alt="Juver Melocotón">
                </a>
                <h6>1.34 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Juver Melocoton">
                        <input type="hidden" name="imageArticle" value="images/articulos/zumos/juver-melocoton-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.34">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Romaneira</div>
                <a target="_blank" href="images/articulos/vinos/Romaneira-escalar.jpg">
                    <img src="images/articulos/vinos/Romaneira-escalar.jpg" alt="Romaneira">
                </a>
                <h6>3.60 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Romaneira">
                        <input type="hidden" name="imageArticle" value="images/articulos/vinos/Romaneira-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.60">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Juver Piña</div>
                <a target="_blank" href="images/articulos/zumos/juver-pina-escalar.jpg">
                    <img src="images/articulos/zumos/juver-pina-escalar.jpg" alt="Juver Piña">
                </a>
                <h6>1.44 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Juver Pina">
                        <input type="hidden" name="imageArticle" value="images/articulos/zumos/juver-pina-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.44">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Fernando Castilla</div>
                <a target="_blank" href="images/articulos/vinos/Fernando-castilla-escalar.jpg">
                    <img src="images/articulos/vinos/Fernando-castilla-escalar.jpg" alt="Fernando Castilla">
                </a>
                <h6>2.89 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Fernando Castilla">
                        <input type="hidden" name="imageArticle" value="images/articulos/vinos/Fernando-castilla-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.89">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Libby's Naranja</div>
                <a target="_blank" href="images/articulos/zumos/libby's-naranja-1L-escalar.jpg">
                    <img src="images/articulos/zumos/libby's-naranja-1L-escalar.jpg" alt="Libby's Naranja">
                </a>
                <h6>1.60 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Libby's Naranja">
                        <input type="hidden" name="imageArticle" value="images/articulos/zumos/libby's-naranja-1L-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.60">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Joel Gott</div>
                <a target="_blank" href="images/articulos/vinos/Joel-Gott-escalar.jpg">
                    <img src="images/articulos/vinos/Joel-Gott-escalar.jpg" alt="Joel Gott">
                </a>
                <h6>3.10 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Don Simon Naranja">
                        <input type="hidden" name="imageArticle" value="images/articulos/vinos/Joel-Gott-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.10">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Pago de los Capellanes</div>
                <a target="_blank" href="images/articulos/vinos/Pago-de-los-Capellanes-escalar.jpg">
                    <img src="images/articulos/vinos/Pago-de-los-Capellanes-escalar.jpg" alt="Pago de los Capellanes">
                </a>
                <h6>2.90 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Pago de los Capellanes">
                        <input type="hidden" name="imageArticle" value="images/articulos/vinos/Pago-de-los-Capellanes-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.90">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Pepsi 2L</div>
                <a target="_blank" href="images/articulos/refrescos/sabores/Pepsi-2L-escalar.png">
                    <img src="images/articulos/refrescos/sabores/Pepsi-2L-escalar.png" alt="Pepsi 2L">
                </a>
                <h6>1.90 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Pepsi 2L">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/sabores/Pepsi-2L-escalar.png">
                        <input type="hidden" name="pvpArticle" value="1.90">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Coca cola</div>
                <a target="_blank" href="images/articulos/refrescos/sabores/coca-cola-lata-escalar.jpg">
                    <img src="images/articulos/refrescos/sabores/coca-cola-lata-escalar.jpg" alt="Coca cola">
                </a>
                <h6>1.20 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Coca cola">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/sabores/coca-cola-lata-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.20">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Fanta</div>
                <a target="_blank" href="images/articulos/refrescos/sabores/fanta-lata-escalar.jpg">
                    <img src="images/articulos/refrescos/sabores/fanta-lata-escalar.jpg" alt="Fanta">
                </a>
                <h6>1.15 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Fanta">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/sabores/fanta-lata-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.15">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Pepsi Lata</div>
                <a target="_blank" href="images/articulos/refrescos/sabores/pepsi-lata-escalar.jpg">
                    <img src="images/articulos/refrescos/sabores/pepsi-lata-escalar.jpg" alt="Pepsi Lata">
                </a>
                <h6>1.35 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Pepsi Lata">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/sabores/pepsi-lata-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.35">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Sprite 1.5L</div>
                <a target="_blank" href="images/articulos/refrescos/sabores/sprite-1.5L-escalar.jpg">
                    <img src="images/articulos/refrescos/sabores/sprite-1.5L-escalar.jpg" alt="Sprite 1.5L">
                </a>
                <h6>1.75 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Sprite 1.5L">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/sabores/sprite-1.5L-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.75">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Sprite Lata</div>
                <a target="_blank" href="images/articulos/refrescos/sabores/sprite-lata-escalar.jpg">
                    <img src="images/articulos/refrescos/sabores/sprite-lata-escalar.jpg" alt="Sprite Lata">
                </a>
                <h6>1.20 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Sprite Lata">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/sabores/sprite-lata-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.20">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Coca Cola Light</div>
                <a target="_blank" href="images/articulos/refrescos/light/coca-cola-light-escalar.jpg">
                    <img src="images/articulos/refrescos/light/coca-cola-light-escalar.jpg" alt="Coca Cola Light">
                </a>
                <h6>1.20 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Coca cola Light">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/light/coca-cola-light-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.20">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Fanta Light</div>
                <a target="_blank" href="images/articulos/refrescos/light/fanta-light-escalar.jpg">
                    <img src="images/articulos/refrescos/light/fanta-light-escalar.jpg" alt="Fanta Light">
                </a>
                <h6>1.15 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Fanta Light">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/light/fanta-light-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.15">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Pepsi Light</div>
                <a target="_blank" href="images/articulos/refrescos/light/pepsi-Light-escalar.jpg">
                    <img src="images/articulos/refrescos/light/pepsi-Light-escalar.jpg" alt="Pepsi Light">
                </a>
                <h6>1.35 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Pepsi Light">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/light/pepsi-Light-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.35">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Sprite Light</div>
                <a target="_blank" href="images/articulos/refrescos/light/sprite-light-escalar.jpg">
                    <img src="images/articulos/refrescos/light/sprite-light-escalar.jpg" alt="Sprite Light">
                </a>
                <h6>1.20 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Sprite Light">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/light/sprite-light-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.20">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Bezolla 1.5L</div>
                <a target="_blank" href="images/articulos/agua/bezolla-1.5L-escalar.jpg">
                    <img src="images/articulos/agua/bezolla-1.5L-escalar.jpg" alt="Bezolla 1.5L">
                </a>
                <h6>0.95 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Bezolla 1.5L">
                        <input type="hidden" name="imageArticle" value="images/articulos/agua/bezolla-1.5L-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="0.95">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Firgas 1.5L</div>
                <a target="_blank" href="images/articulos/agua/firgas-1.5L-escalar.jpg">
                    <img src="images/articulos/agua/firgas-1.5L-escalar.jpg" alt="Firgas 1.5L">
                </a>
                <h6>1.05 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Figas 1.5L">
                        <input type="hidden" name="imageArticle" value="images/articulos/agua/firgas-1.5L-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.05">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Font Vella 1.5L</div>
                <a target="_blank" href="images/articulos/agua/font-vella-1.5L-escalar.jpg">
                    <img src="images/articulos/agua/font-vella-1.5L-escalar.jpg" alt="Font Vella 1.5L">
                </a>
                <h6>1.15 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Font Vella">
                        <input type="hidden" name="imageArticle" value="images/articulos/agua/font-vella-1.5L-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.15">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Teror Sin Gas</div>
                <a target="_blank" href="images/articulos/agua/teror-sin-gas-1.5L-escalar.jpg">
                    <img src="images/articulos/agua/teror-sin-gas-1.5L-escalar.jpg" alt="Teror Sin Gas">
                </a>
                <h6>1.10 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Terror Sin Gas">
                        <input type="hidden" name="imageArticle" value="images/articulos/agua/teror-sin-gas-1.5L-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.10">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Ariel</div>
                <a target="_blank" href="images/articulos/drogueria/ariel-escalar.jpg">
                    <img src="images/articulos/drogueria/ariel-escalar.jpg" alt="Ariel">
                </a>
                <h6>3.45 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Ariel">
                        <input type="hidden" name="imageArticle" value="images/articulos/drogueria/ariel-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.45">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Colón</div>
                <a target="_blank" href="images/articulos/drogueria/colon-escalar.jpg">
                    <img src="images/articulos/drogueria/colon-escalar.jpg" alt="Colón">
                </a>
                <h6>4.10 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Colon">
                        <input type="hidden" name="imageArticle" value="images/articulos/drogueria/colon-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="4.10">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Mimosin Vaporesse</div>
                <a target="_blank" href="images/articulos/drogueria/mimosin-vaporesse-escalar.jpg">
                    <img src="images/articulos/drogueria/mimosin-vaporesse-escalar.jpg" alt="Mimosin Vaporesse">
                </a>
                <h6>3.10 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Mimosin Vaporosse">
                        <input type="hidden" name="imageArticle" value="images/articulos/drogueria/mimosin-vaporesse-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.10">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Norit</div>
                <a target="_blank" href="images/articulos/drogueria/norit-escalar.jpg">
                    <img src="images/articulos/drogueria/norit-escalar.jpg" alt="Norit">
                </a>
                <h6>3.60 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Norit">
                        <input type="hidden" name="imageArticle" value="images/articulos/drogueria/norit-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.60">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Vanish</div>
                <a target="_blank" href="images/articulos/drogueria/vanish-escalar.jpg">
                    <img src="images/articulos/drogueria/vanish-escalar.jpg" alt="Vanish">
                </a>
                <h6>4.20 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Vanish">
                        <input type="hidden" name="imageArticle" value="images/articulos/drogueria/vanish-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="4.20">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Airport Mochila Azul</div>
                <a target="_blank" href="images/articulos/papeleria/airport-mochila-azul-escalar.jpg">
                    <img src="images/articulos/papeleria/airport-mochila-azul-escalar.jpg" alt="Airport Mochila Azul">
                </a>
                <h6>10.95 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Airport Mochila Azul">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/airport-mochila-azul-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="10.95">
                        <input type="hidden" name="window" value="/index.jsp">
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
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Airport Mochila Vintage">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/airport-mochila-vintage-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="15.95">
                        <input type="hidden" name="window" value="/index.jsp">
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
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Bic Cristal Soft Azul">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/bic-cristal-soft-azul-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="9.10">
                        <input type="hidden" name="window" value="/index.jsp">
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
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Oxford Cuaderno">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/oxford-cuaderno-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.30">
                        <input type="hidden" name="window" value="/index.jsp">
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
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Pacsa Cuaderno 3x3">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/pacsa-cuaderno-3x3-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.50">
                        <input type="hidden" name="window" value="/index.jsp">
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
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Pacsa Cuaderno 4x4">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/pacsa-cuaderno-4x4-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.10">
                        <input type="hidden" name="window" value="/index.jsp">
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
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Estuche Patrulla Canina">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/patrulla-canina-estuche-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="5.10">
                        <input type="hidden" name="window" value="/index.jsp">
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
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Pilot Super Grip Azul">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/pilot-super-grip-azul-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.10">
                        <input type="hidden" name="window" value="/index.jsp">
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
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="UniBall Eye Ub-150">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/uni-ball-eye-ub-150-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.95">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Ecolecera Espaguettis</div>
                <a target="_blank" href="images/articulos/pastas/ecolecera-espaguettis-escalar.jpg">
                    <img src="images/articulos/pastas/ecolecera-espaguettis-escalar.jpg" alt="Ecolecera Espaguettis">
                </a>
                <h6>1.75 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Ecolecera Espaguettis">
                        <input type="hidden" name="imageArticle" value="images/articulos/pastas/ecolecera-espaguettis-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.75">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Gallo Espaguettis</div>
                <a target="_blank" href="images/articulos/pastas/gallo-espaguettis-escalar.jpg">
                    <img src="images/articulos/pastas/gallo-espaguettis-escalar.jpg" alt="Gallo Espaguettis">
                </a>
                <h6>2.95 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Gallo Espaguettis">
                        <input type="hidden" name="imageArticle" value="images/articulos/pastas/gallo-espaguettis-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.95">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Gallo Fideos</div>
                <a target="_blank" href="images/articulos/pastas/gallo-fideos-escalar.jpg">
                    <img src="images/articulos/pastas/gallo-fideos-escalar.jpg" alt="Gallo Fideos">
                </a>
                <h6>3.65 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Gallo Fideos">
                        <input type="hidden" name="imageArticle" value="images/articulos/pastas/gallo-fideos-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.65">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Gallo Macarrones</div>
                <a target="_blank" href="images/articulos/pastas/gallo-macarrones-escalar.jpg">
                    <img src="images/articulos/pastas/gallo-macarrones-escalar.jpg" alt="Gallo Macarrones">
                </a>
                <h6>4.95 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Gallo Macarrones">
                        <input type="hidden" name="imageArticle" value="images/articulos/pastas/gallo-macarrones-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="4.95">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Gallo Sedalis Espaguettis</div>
                <a target="_blank" href="images/articulos/pastas/gallo-sedalis-espaguettis-escalar.jpg">
                    <img src="images/articulos/pastas/gallo-sedalis-espaguettis-escalar.jpg" alt="Gallo Sedalis Espaguettis">
                </a>
                <h6>3.95 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Gallo Segalis Espaguettis">
                        <input type="hidden" name="imageArticle" value="images/articulos/pastas/gallo-sedalis-espaguettis-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.95">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Gallo Sin Gluten Macarrones</div>
                <a target="_blank" href="images/articulos/pastas/gallo-sin-gluten-macarrones-escalar.jpg">
                    <img src="images/articulos/pastas/gallo-sin-gluten-macarrones-escalar.jpg" alt="Gallo Sin Gluten Macarrones">
                </a>
                <h6>4.95 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Gallo Sin Gluten Macarrones">
                        <input type="hidden" name="imageArticle" value="images/articulos/pastas/gallo-sin-gluten-macarrones-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="4.95">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Romero Fideos</div>
                <a target="_blank" href="images/articulos/pastas/romero-fideos-escalar.jpg">
                    <img src="images/articulos/pastas/romero-fideos-escalar.jpg" alt="Romero fideos">
                </a>
                <h6>3.65 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Romero Fideos">
                        <input type="hidden" name="imageArticle" value="images/articulos/pastas/romero-fideos-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.65">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Romero Macarrones</div>
                <a target="_blank" href="images/articulos/pastas/romero-macarrones-escalar.jpg">
                    <img src="images/articulos/pastas/romero-macarrones-escalar.jpg" alt="Romero Macarrones">
                </a>
                <h6>4.95 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Romero Macarrones">
                        <input type="hidden" name="imageArticle" value="images/articulos/pastas/romero-macarrones-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="4.95">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Sam Mills Macarrones</div>
                <a target="_blank" href="images/articulos/pastas/sam-mills-macarrones-escalar.jpg">
                    <img src="images/articulos/pastas/sam-mills-macarrones-escalar.jpg" alt="Sam Mills Macarrones">
                </a>
                <h6>4.95 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Sam Mills Macarrones">
                        <input type="hidden" name="imageArticle" value="images/articulos/pastas/sam-mills-macarrones-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="4.95">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Carretilla Alubias</div>
                <a target="_blank" href="images/articulos/preparados/Carretilla-alubias-escalar.jpg">
                    <img src="images/articulos/preparados/Carretilla-alubias-escalar.jpg" alt="Carretilla Alubias">
                </a>
                <h6>6.95 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Carretilla Alubias">
                        <input type="hidden" name="imageArticle" value="images/articulos/preparados/Carretilla-alubias-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="6.95">
                        <input type="hidden" name="window" value="/index.jsp">
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
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Carretilla Arroz con pollo al Curry">
                        <input type="hidden" name="imageArticle" value="images/articulos/preparados/Carretilla-arroz-con-pollo-al-curry-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="7.95">
                        <input type="hidden" name="window" value="/index.jsp">
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
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Isabel Albondigas con Atun">
                        <input type="hidden" name="imageArticle" value="images/articulos/preparados/Isabel-albondigas-con-atun-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="5.95">
                        <input type="hidden" name="window" value="/index.jsp">
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
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Lourino Albondigas con Guisantes">
                        <input type="hidden" name="imageArticle" value="images/articulos/preparados/Lourino-albondigas-con-guisantes-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="6.95">
                        <input type="hidden" name="window" value="/index.jsp">
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
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Yatekomo Arroz 3 Delicias">
                        <input type="hidden" name="imageArticle" value="images/articulos/preparados/Yatekomo-arroz-3-delicias-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="5.95">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Rolmovil Cubre Volante</div>
                <a target="_blank" href="images/articulos/automovil/accesorios/Rolmovil-cubre-volante-escalar.jpg">
                    <img src="images/articulos/automovil/accesorios/Rolmovil-cubre-volante-escalar.jpg" alt="Rolmovil Cubre Volante">
                </a>
                <h6>15.95 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Rolmovil Cubre Volante">
                        <input type="hidden" name="imageArticle" value="images/articulos/automovil/accesorios/Rolmovil-cubre-volante-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="15.95">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Rolmovil Extintor</div>
                <a target="_blank" href="images/articulos/automovil/accesorios/Rolmovil-extintor-escalar.jpg">
                    <img src="images/articulos/automovil/accesorios/Rolmovil-extintor-escalar.jpg" alt="Rolmovil Extintor">
                </a>
                <h6>19.95 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Rolmovil Extintor">
                        <input type="hidden" name="imageArticle" value="images/articulos/automovil/accesorios/Rolmovil-extintor-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="19.95">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Rolmovil Parasol</div>
                <a target="_blank" href="images/articulos/automovil/accesorios/Rolmovil-parasol-escalar.jpg">
                    <img src="images/articulos/automovil/accesorios/Rolmovil-parasol-escalar.jpg" alt="Rolmovil Parasol">
                </a>
                <h6>14.95 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Rolmovil Parasol">
                        <input type="hidden" name="imageArticle" value="images/articulos/automovil/accesorios/Rolmovil-parasol-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="14.95">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Rolmovil Triángulo de Emergencia</div>
                <a target="_blank" href="images/articulos/automovil/accesorios/Rolmovil-triangulo-de-emergencia-escalar.jpg">
                    <img src="images/articulos/automovil/accesorios/Rolmovil-triangulo-de-emergencia-escalar.jpg" alt="Rolmovil Triángulo de Emergencia">
                </a>
                <h6>29.95 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Rolmovil Triangulo de Emergencia">
                        <input type="hidden" name="imageArticle" value="images/articulos/automovil/accesorios/Rolmovil-triangulo-de-emergencia-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="29.95">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Air-Wick 2D Ambientador</div>
                <a target="_blank" href="images/articulos/automovil/limpieza/air-wick-2d-ambientador-escalar.jpg">
                    <img src="images/articulos/automovil/limpieza/air-wick-2d-ambientador-escalar.jpg" alt="Air-Wick 2D Ambientador">
                </a>
                <h6>9.95 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Air-Wick 2D Ambientador">
                        <input type="hidden" name="imageArticle" value="images/articulos/automovil/limpieza/air-wick-2d-ambientador-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="9.95">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Arbre Magique Ambientador</div>
                <a target="_blank" href="images/articulos/automovil/limpieza/arbre-magique-ambientador-escalar.jpg">
                    <img src="images/articulos/automovil/limpieza/arbre-magique-ambientador-escalar.jpg" alt="Arbre Magique Ambientador">
                </a>
                <h6>5.95 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Arbre Magique Ambientador">
                        <input type="hidden" name="imageArticle" value="images/articulos/automovil/limpieza/arbre-magique-ambientador-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="5.95">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Krafft Limpia Parabrisas</div>
                <a target="_blank" href="images/articulos/automovil/limpieza/krafft-limpia-parabrisas-escalar.jpg">
                    <img src="images/articulos/automovil/limpieza/krafft-limpia-parabrisas-escalar.jpg" alt="Krafft Limpia Parabrisas">
                </a>
                <h6>18.95 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Krafft Limpia Parabrisas">
                        <input type="hidden" name="imageArticle" value="images/articulos/automovil/limpieza/krafft-limpia-parabrisas-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="18.95">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Rolmovil Ambientador</div>
                <a target="_blank" href="images/articulos/automovil/limpieza/rolmovil-ambientador-escalar.jpg">
                    <img src="images/articulos/automovil/limpieza/rolmovil-ambientador-escalar.jpg" alt="Rolmovil Ambientador">
                </a>
                <h6>19.95 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Rolmovil Ambientador">
                        <input type="hidden" name="imageArticle" value="images/articulos/automovil/limpieza/rolmovil-ambientador-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="19.95">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Abadan Alas de Pollo</div>
                <a target="_blank" href="images/articulos/congelados/carne/abadan-alas-de-pollo-escalar.jpg">
                    <img src="images/articulos/congelados/carne/abadan-alas-de-pollo-escalar.jpg" alt="Abadan Alas de Pollo">
                </a>
                <h6>14.95 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Abadan Alas de Pollo">
                        <input type="hidden" name="imageArticle" value="images/articulos/congelados/carne/abadan-alas-de-pollo-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="14.95">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Meet Beef Albóndigas</div>
                <a target="_blank" href="images/articulos/congelados/carne/meet-beef-albondigas-escalar.jpg">
                    <img src="images/articulos/congelados/carne/meet-beef-albondigas-escalar.jpg" alt="Meet Beef Albóndigas">
                </a>
                <h6>15.95 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Meet Beef Albondigas">
                        <input type="hidden" name="imageArticle" value="images/articulos/congelados/carne/meet-beef-albondigas-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="15.95">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Meet Chicken Solomillo de Pollo</div>
                <a target="_blank" href="images/articulos/congelados/carne/meet-chicken-solimillo-de-pollo-escalar.jpg">
                    <img src="images/articulos/congelados/carne/meet-chicken-solimillo-de-pollo-escalar.jpg" alt="Meet Chicken Solomillo de Pollo">
                </a>
                <h6>18.95 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Meet Chicken Solomillo de Pollo">
                        <input type="hidden" name="imageArticle" value="images/articulos/congelados/carne/meet-chicken-solomillo-de-pollo-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="18.95">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Campos Bocados de Atún</div>
                <a target="_blank" href="images/articulos/congelados/pescado/campos-bocados-de-atun-escalar.jpg">
                    <img src="images/articulos/congelados/pescado/campos-bocados-de-atun-escalar.jpg" alt="Campos Bocados de Atún">
                </a>
                <h6>14.95 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Campos Bocados de Atun">
                        <input type="hidden" name="imageArticle" value="images/articulos/congelados/pescado/campos-bocados-de-atun-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="14.95">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Campos Filetes de Atún</div>
                <a target="_blank" href="images/articulos/congelados/pescado/campos-filetes-de-atun-escalar.jpg">
                    <img src="images/articulos/congelados/pescado/campos-filetes-de-atun-escalar.jpg" alt="Campos Filetes de Atún">
                </a>
                <h6>16.95 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Campos Filetes de Atun">
                        <input type="hidden" name="imageArticle" value="images/articulos/congelados/pescado/campos-filetes-de-atun-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="16.95">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Findus Bacalado Rebosado</div>
                <a target="_blank" href="images/articulos/congelados/pescado/findus-bacalado-rebosado-escalar.jpg">
                    <img src="images/articulos/congelados/pescado/findus-bacalado-rebosado-escalar.jpg" alt="Findus Bacalado Rebosado">
                </a>
                <h6>15.95 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Findus Bacalado Rebosado">
                        <input type="hidden" name="imageArticle" value="images/articulos/congelados/pescado/findus-bacalado-rebosado-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="15.95">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Pescanova Anillos a la Romana</div>
                <a target="_blank" href="images/articulos/congelados/pescado/pescanova-anillos-a-la-romana-escalar.jpg">
                    <img src="images/articulos/congelados/pescado/pescanova-anillos-a-la-romana-escalar.jpg" alt="Pescanova Anillos a la Romana">
                </a>
                <h6>15.95 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Pescanova Anillos a la Romana">
                        <input type="hidden" name="imageArticle" value="images/articulos/congelados/pescado/pescanova-anillos-a-la-romana-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="15.95">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Huevos Dagu 12 Unidades</div>
                <a target="_blank" href="images/articulos/lacteos/huevos/dagu-12u-escalar.jpg">
                    <img src="images/articulos/lacteos/huevos/dagu-12u-escalar.jpg" alt="Huevos Dagu 12 Unidades">
                </a>
                <h6>5.95 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Huevos Dagu 12 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/huevos/dagu-12u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="5.95">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Huevos Los Rancheros 6 Unidades</div>
                <a target="_blank" href="images/articulos/lacteos/huevos/los-rancheros-6u-escalar.jpg">
                    <img src="images/articulos/lacteos/huevos/los-rancheros-6u-escalar.jpg" alt="Huevos Los Rancheros 6 Unidades">
                </a>
                <h6>4.55 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Huevos Los Rancheros 6 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/huevos/los-rancheros-6u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="4.55">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Huevos Pazo de Vilane 6 Unidades</div>
                <a target="_blank" href="images/articulos/lacteos/huevos/pazo-de-vilane-6u-escalar.jpg">
                    <img src="images/articulos/lacteos/huevos/pazo-de-vilane-6u-escalar.jpg" alt="Huevos Pazo de Villane 6 Unidades">
                </a>
                <h6>4.95 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Huevos Pazo de Vilane 6 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/huevos/pazo-de-vilane-6u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="4.95">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Huevos Pitas 12 Unidades</div>
                <a target="_blank" href="images/articulos/lacteos/huevos/pitas-12u-escalar.jpg">
                    <img src="images/articulos/lacteos/huevos/pitas-12u-escalar.jpg" alt="Huevos Pitas 12 Unidades">
                </a>
                <h6>6.95 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Huevos Pitas 12 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/huevos/pitas-12u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="6.95">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Yogur Activia Limón 4 Unidades</div>
                <a target="_blank" href="images/articulos/lacteos/yogur/activia-limon-4u-escalar.jpg">
                    <img src="images/articulos/lacteos/yogur/activia-limon-4u-escalar.jpg" alt="Yogur Activia Limón 4 Unidades">
                </a>
                <h6>2.45 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Yogur Activia Limón 4 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/yogur/activia-limon-4u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.95">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Yogur Danone 4 Unidades</div>
                <a target="_blank" href="images/articulos/lacteos/yogur/danone-4u-escalar.jpg">
                    <img src="images/articulos/lacteos/yogur/danone-4u-escalar.jpg" alt="Yogur Danone 4 Unidades">
                </a>
                <h6>2.35 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Yogur Danone 4 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/yogur/danone-4u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.35">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Yogur Danone Limón 4 Unidades</div>
                <a target="_blank" href="images/articulos/lacteos/yogur/danone-limon-4u-escalar.jpg">
                    <img src="images/articulos/lacteos/yogur/danone-limon-4u-escalar.jpg" alt="Yogur Danone Limón 4 Unidades">
                </a>
                <h6>2.25 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Yogur Danone Limon 4 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/yogur/danone-limon-4u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.25">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Natillas Danone 4 Unidades</div>
                <a target="_blank" href="images/articulos/lacteos/yogur/danone-natillas-4u-escalar.jpg">
                    <img src="images/articulos/lacteos/yogur/danone-natillas-4u-escalar.jpg" alt="Natillas Danone 4 Unidades">
                </a>
                <h6>2.65 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Natillas Danone 4 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/yogur/danone-natillas-4u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.65">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Yogur Kalise Variado 8 Unidades</div>
                <a target="_blank" href="images/articulos/lacteos/yogur/kalise-variado-8u-escalar.jpg">
                    <img src="images/articulos/lacteos/yogur/kalise-variado-8u-escalar.jpg" alt="Yogur Kalise Variado 8 Unidades">
                </a>
                <h6>3.45 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Yogur Kalise Variado 8 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/yogur/kalise-variado-8u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.45">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Leche Asturiana Desnatada</div>
                <a target="_blank" href="images/articulos/lacteos/leche/asturiana-desnatada-escalar.jpg">
                    <img src="images/articulos/lacteos/leche/asturiana-desnatada-escalar.jpg" alt="Leche Asturiana Desnatada">
                </a>
                <h6>2.95 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Leche Asturiana Desnatada">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/asturiana-desnatada-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.95">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Leche Asturiana Entera</div>
                <a target="_blank" href="images/articulos/lacteos/leche/asturiana-entera-escalar.jpg">
                    <img src="images/articulos/lacteos/leche/asturiana-entera-escalar.jpg" alt="Leche Asturiana Entera">
                </a>
                <h6>2.95 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Leche Asturiana Entera">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/asturiana-entera-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.95">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Leche Calo Entera</div>
                <a target="_blank" href="images/articulos/lacteos/leche/calo-entera-escalar.jpg">
                    <img src="images/articulos/lacteos/leche/calo-entera-escalar.jpg" alt="Leche Calo Entera">
                </a>
                <h6>2.75 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Leche Calo Entera">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/calo-entera-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.75">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Leche Celgan Desnatada</div>
                <a target="_blank" href="images/articulos/lacteos/leche/celgan-desnatada-escalar.jpg">
                    <img src="images/articulos/lacteos/leche/celgan-desnatada-escalar.jpg" alt="Leche Celgan Desnatada">
                </a>
                <h6>3.10 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Leche Celgan Desnatada">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/celgan-desnatada-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.10">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Leche Celta Entera</div>
                <a target="_blank" href="images/articulos/lacteos/leche/celta-entera-escalar.jpg">
                    <img src="images/articulos/lacteos/leche/celta-entera-escalar.jpg" alt="Leche Celta Entera">
                </a>
                <h6>2.85 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Leche Celta Entera">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/celta-entera-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.85">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Leche Pascual Desnatada</div>
                <a target="_blank" href="images/articulos/lacteos/leche/pascual-desnatada-escalar.jpg">
                    <img src="images/articulos/lacteos/leche/pascual-desnatada-escalar.jpg" alt="Leche Pascual Desnatada">
                </a>
                <h6>3.25 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Leche Pascual Desnatada">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/pascual-desnatada-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.25">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Leche Pascual Entera</div>
                <a target="_blank" href="images/articulos/lacteos/leche/pascual-entera-escalar.jpg">
                    <img src="images/articulos/lacteos/leche/pascual-entera-escalar.jpg" alt="Leche Pascual Entera">
                </a>
                <h6>3.15 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Leche Pascual Entera">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/pascual-entera-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.15">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Leche Puleva Desnatada</div>
                <a target="_blank" href="images/articulos/lacteos/leche/puleva-desnatada-escalar.jpg">
                    <img src="images/articulos/lacteos/leche/puleva-desnatada-escalar.jpg" alt="Leche Puleva Desnatada">
                </a>
                <h6>3.45 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Leche Puleva Desnatada">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/puleva-desnatada-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.45">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Leche Puleva Entera</div>
                <a target="_blank" href="images/articulos/lacteos/leche/puleva-entera-escalar.jpg">
                    <img src="images/articulos/lacteos/leche/puleva-entera-escalar.jpg" alt="Leche Puleva Entera">
                </a>
                <h6>3.45 €</h6>
                <div class="desc"><!--<a href="#">Añadir al Carro</a>-->
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Leche Puleva Entera">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/puleva-entera-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.45">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>