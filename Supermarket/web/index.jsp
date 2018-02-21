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
        <% if(session.getAttribute("user")==null){ %>
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
                <li><a href="FrontServlet?command=Login&user=user1&password=user1">Login</a></li>
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
                <li><a href="FrontServlet?command=Drinks">Bebidas</a>
                    <ul>
                        <li><a href="FrontServlet?command=Refreshments">Refresco</a>
                            <ul>
                                <li><a href="FrontServlet?command=Flavor">De Sabores</a></li>
                                <li><a href="FrontServlet?command=Light">Deportivos</a></li>
                            </ul>
                        </li>
                        <li><a href="FrontServlet?command=Wine">Vino</a></li>
                        <li><a href="FrontServlet?command=Water">Agua</a></li>
                        <li><a href="FrontServlet?command=Juices">Zumos</a></li>
                    </ul>
                </li>
                <li><a href="FrontServlet?command=Food">Alimentación</a>
                    <ul>
                        <li><a href="FrontServlet?command=DiaryProducts">Lácteos</a></li>
                        <li><a href="FrontServlet?command=Pasta">Pastas</a></li>
                        <li><a href="FrontServlet?command=Preparations">Preparados</a></li>
                        <li><a href="FrontServlet?command=Frozen">Congelados</a></li>
                    </ul>
                </li>
                <li><a href="FrontServlet?command=Drugstore">Droguería</a></li>
                <li><a href="FrontServlet?command=StationerShop">Papelería</a></li>
                <li><a href="FrontServlet?command=Car">Automóvil</a>
                    <ul>
                        <li><a href="FrontServlet?command=Accessories">Accesorios</a></li>
                        <li><a href="FrontServlet?command=Cleaning">Limpieza</a></li>
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
                <h4>1.43 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Colimoro Montepulciano</div>
                <a target="_blank" href="images/articulos/vinos/Colimoro-Montepulciano-escalar.jpg">
                    <img src="images/articulos/vinos/Colimoro-Montepulciano-escalar.jpg" alt="Colimoro Montepulciano">
                </a>
                <h4>2.60 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Juver Melocotón</div>
                <a target="_blank" href="images/articulos/zumos/juver-melocoton-escalar.jpg">
                    <img src="images/articulos/zumos/juver-melocoton-escalar.jpg" alt="Juver Melocotón">
                </a>
                <h4>1.34 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Romaneira</div>
                <a target="_blank" href="images/articulos/vinos/Romaneira-escalar.jpg">
                    <img src="images/articulos/vinos/Romaneira-escalar.jpg" alt="Romaneira">
                </a>
                <h4>3.60 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Juver Piña</div>
                <a target="_blank" href="images/articulos/zumos/juver-piña-escalar.jpg">
                    <img src="images/articulos/zumos/juver-piña-escalar.jpg" alt="Juver Piña">
                </a>
                <h4>1.44 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Fernando Castilla</div>
                <a target="_blank" href="images/articulos/vinos/Fernando-castilla-escalar.jpg">
                    <img src="images/articulos/vinos/Fernando-castilla-escalar.jpg" alt="Fernando Castilla">
                </a>
                <h4>2.89 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Libby's Naranja</div>
                <a target="_blank" href="images/articulos/zumos/libby's-naranja-1L-escalar.jpg">
                    <img src="images/articulos/zumos/libby's-naranja-1L-escalar.jpg" alt="Libby's Naranja">
                </a>
                <h4>1.60 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Joel Gott</div>
                <a target="_blank" href="images/articulos/vinos/Joel-Gott-escalar.jpg">
                    <img src="images/articulos/vinos/Joel-Gott-escalar.jpg" alt="Joel Gott">
                </a>
                <h4>3.10 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Pago de los Capellanes</div>
                <a target="_blank" href="images/articulos/vinos/Pago-de-los-Capellanes-escalar.jpg">
                    <img src="images/articulos/vinos/Pago-de-los-Capellanes-escalar.jpg" alt="Pago de los Capellanes">
                </a>
                <h4>2.90 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Pepsi 2L</div>
                <a target="_blank" href="images/articulos/refrescos/sabores/Pepsi-2L-escalar.png">
                    <img src="images/articulos/refrescos/sabores/Pepsi-2L-escalar.png" alt="Pepsi 2L">
                </a>
                <h4>1.90 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Coca cola</div>
                <a target="_blank" href="images/articulos/refrescos/sabores/coca-cola-lata-escalar.jpg">
                    <img src="images/articulos/refrescos/sabores/coca-cola-lata-escalar.jpg" alt="Coca cola">
                </a>
                <h4>1.20 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Fanta</div>
                <a target="_blank" href="images/articulos/refrescos/sabores/fanta-lata-escalar.jpg">
                    <img src="images/articulos/refrescos/sabores/fanta-lata-escalar.jpg" alt="Fanta">
                </a>
                <h4>1.15 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Pepsi Lata</div>
                <a target="_blank" href="images/articulos/refrescos/sabores/pepsi-lata-escalar.jpg">
                    <img src="images/articulos/refrescos/sabores/pepsi-lata-escalar.jpg" alt="Pepsi Lata">
                </a>
                <h4>1.35 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Sprite 1.5L</div>
                <a target="_blank" href="images/articulos/refrescos/sabores/sprite-1.5L-escalar.jpg">
                    <img src="images/articulos/refrescos/sabores/sprite-1.5L-escalar.jpg" alt="Sprite 1.5L">
                </a>
                <h4>1.75 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Sprite Lata</div>
                <a target="_blank" href="images/articulos/refrescos/sabores/sprite-lata-escalar.jpg">
                    <img src="images/articulos/refrescos/sabores/sprite-lata-escalar.jpg" alt="Sprite Lata">
                </a>
                <h4>1.20 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Coca Cola Light</div>
                <a target="_blank" href="images/articulos/refrescos/light/coca-cola-light-escalar.jpg">
                    <img src="images/articulos/refrescos/light/coca-cola-light-escalar.jpg" alt="Coca Cola Light">
                </a>
                <h4>1.20 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Fanta Light</div>
                <a target="_blank" href="images/articulos/refrescos/light/fanta-light-escalar.jpg">
                    <img src="images/articulos/refrescos/light/fanta-light-escalar.jpg" alt="Fanta Light">
                </a>
                <h4>1.15 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Pepsi Light</div>
                <a target="_blank" href="images/articulos/refrescos/light/pepsi-Light-escalar.jpg">
                    <img src="images/articulos/refrescos/light/pepsi-Light-escalar.jpg" alt="Pepsi Light">
                </a>
                <h4>1.35 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Sprite Light</div>
                <a target="_blank" href="images/articulos/refrescos/light/sprite-light-escalar.jpg">
                    <img src="images/articulos/refrescos/light/sprite-light-escalar.jpg" alt="Sprite Light">
                </a>
                <h4>1.20 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Bezolla 1.5L</div>
                <a target="_blank" href="images/articulos/agua/bezolla-1.5L-escalar.jpg">
                    <img src="images/articulos/agua/bezolla-1.5L-escalar.jpg" alt="Bezolla 1.5L">
                </a>
                <h4>0.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Firgas 1.5L</div>
                <a target="_blank" href="images/articulos/agua/firgas-1.5L-escalar.jpg">
                    <img src="images/articulos/agua/firgas-1.5L-escalar.jpg" alt="Firgas 1.5L">
                </a>
                <h4>1.05 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Font Vella 1.5L</div>
                <a target="_blank" href="images/articulos/agua/font-vella-1.5L-escalar.jpg">
                    <img src="images/articulos/agua/font-vella-1.5L-escalar.jpg" alt="Font Vella 1.5L">
                </a>
                <h4>1.15 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Teror Sin Gas</div>
                <a target="_blank" href="images/articulos/agua/teror-sin-gas-1.5L-escalar.jpg">
                    <img src="images/articulos/agua/teror-sin-gas-1.5L-escalar.jpg" alt="Teror Sin Gas">
                </a>
                <h4>1.10 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Ariel</div>
                <a target="_blank" href="images/articulos/droguería/ariel-escalar.jpg">
                    <img src="images/articulos/droguería/ariel-escalar.jpg" alt="Ariel">
                </a>
                <h4>3.45 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Colón</div>
                <a target="_blank" href="images/articulos/droguería/colon-escalar.jpg">
                    <img src="images/articulos/droguería/colon-escalar.jpg" alt="Colón">
                </a>
                <h4>4.10 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Mimosin Vaporesse</div>
                <a target="_blank" href="images/articulos/droguería/mimosin-vaporesse-escalar.jpg">
                    <img src="images/articulos/droguería/mimosin-vaporesse-escalar.jpg" alt="Mimosin Vaporesse">
                </a>
                <h4>3.10 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Norit</div>
                <a target="_blank" href="images/articulos/droguería/norit-escalar.jpg">
                    <img src="images/articulos/droguería/norit-escalar.jpg" alt="Norit">
                </a>
                <h4>3.60 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Vanish</div>
                <a target="_blank" href="images/articulos/droguería/vanish-escalar.jpg">
                    <img src="images/articulos/droguería/vanish-escalar.jpg" alt="Vanish">
                </a>
                <h4>4.20 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Airport Mochila Azul</div>
                <a target="_blank" href="images/articulos/papelería/airport-mochila-azul-escalar.jpg">
                    <img src="images/articulos/papelería/airport-mochila-azul-escalar.jpg" alt="Airport Mochila Azul">
                </a>
                <h4>10.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Airport Mochila Vintage</div>
                <a target="_blank" href="images/articulos/papelería/airport-mochila-vintage-escalar.jpg">
                    <img src="images/articulos/papelería/airport-mochila-vintage-escalar.jpg" alt="Airport Mochila Vintage">
                </a>
                <h4>15.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Bic Cristal Soft Azul</div>
                <a target="_blank" href="images/articulos/papelería/bic-cristal-soft-azul-escalar.jpg">
                    <img src="images/articulos/papelería/bic-cristal-soft-azul-escalar.jpg" alt="Bic Cristal Soft Azul">
                </a>
                <h4>9.10 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Oxford Cuaderno</div>
                <a target="_blank" href="images/articulos/papelería/oxford-cuaderno-escalar.jpg">
                    <img src="images/articulos/papelería/oxford-cuaderno-escalar.jpg" alt="Oxford Cuaderno">
                </a>
                <h4>3.30 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Pacsa Cuaderno 3x3</div>
                <a target="_blank" href="images/articulos/papelería/pacsa-cuaderno-3x3-escalar.jpg">
                    <img src="images/articulos/papelería/pacsa-cuaderno-3x3-escalar.jpg" alt="Pacsa Cuaderno 3x3">
                </a>
                <h4>1.50 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Pacsa Cuaderno 4x4</div>
                <a target="_blank" href="images/articulos/papelería/pacsa-cuaderno-4x4-escalar.jpg">
                    <img src="images/articulos/papelería/pacsa-cuaderno-4x4-escalar.jpg" alt="Pacsa Cuaderno 4x4">
                </a>
                <h4>3.10 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Estuche Patrulla Canina</div>
                <a target="_blank" href="images/articulos/papelería/patrulla-canina-estuche-escalar.jpg">
                    <img src="images/articulos/papelería/patrulla-canina-estuche-escalar.jpg" alt="Estuche Patrulla Canina">
                </a>
                <h4>5.10 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Pilot Super Grip Azul</div>
                <a target="_blank" href="images/articulos/papelería/pilot-super-grip-azul-escalar.jpg">
                    <img src="images/articulos/papelería/pilot-super-grip-azul-escalar.jpg" alt="Pilot Super Grip Azul">
                </a>
                <h4>3.10 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">UniBall Eye Ub-150</div>
                <a target="_blank" href="images/articulos/papelería/uni-ball-eye-ub-150-escalar.jpg">
                    <img src="images/articulos/papelería/uni-ball-eye-ub-150-escalar.jpg" alt="UniBall Eye Ub-150">
                </a>
                <h4>2.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Ecolecera Espaguettis</div>
                <a target="_blank" href="images/articulos/pastas/ecolecera-espaguettis-escalar.jpg">
                    <img src="images/articulos/pastas/ecolecera-espaguettis-escalar.jpg" alt="Ecolecera Espaguettis">
                </a>
                <h4>1.75 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Gallo Espaguettis</div>
                <a target="_blank" href="images/articulos/pastas/gallo-espaguettis-escalar.jpg">
                    <img src="images/articulos/pastas/gallo-espaguettis-escalar.jpg" alt="Gallo Espaguettis">
                </a>
                <h4>2.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Gallo Fideos</div>
                <a target="_blank" href="images/articulos/pastas/gallo-fideos-escalar.jpg">
                    <img src="images/articulos/pastas/gallo-fideos-escalar.jpg" alt="Gallo Fideos">
                </a>
                <h4>3.65 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Gallo Macarrones</div>
                <a target="_blank" href="images/articulos/pastas/gallo-macarrones-escalar.jpg">
                    <img src="images/articulos/pastas/gallo-macarrones-escalar.jpg" alt="Gallo Macarrones">
                </a>
                <h4>4.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Gallo Sedalis Espaguettis</div>
                <a target="_blank" href="images/articulos/pastas/gallo-sedalis-espaguettis-escalar.jpg">
                    <img src="images/articulos/pastas/gallo-sedalis-espaguettis-escalar.jpg" alt="Gallo Sedalis Espaguettis">
                </a>
                <h4>3.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Gallo Sin Gluten Macarrones</div>
                <a target="_blank" href="images/articulos/pastas/gallo-sin-gluten-macarrones-escalar.jpg">
                    <img src="images/articulos/pastas/gallo-sin-gluten-macarrones-escalar.jpg" alt="Gallo Sin Gluten Macarrones">
                </a>
                <h4>4.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Romero Fideos</div>
                <a target="_blank" href="images/articulos/pastas/romero-fideos-escalar.jpg">
                    <img src="images/articulos/pastas/romero-fideos-escalar.jpg" alt="Romero fideos">
                </a>
                <h4>3.65 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Romero Macarrones</div>
                <a target="_blank" href="images/articulos/pastas/romero-macarrones-escalar.jpg">
                    <img src="images/articulos/pastas/romero-macarrones-escalar.jpg" alt="Romero Macarrones">
                </a>
                <h4>4.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Sam Mills Macarrones</div>
                <a target="_blank" href="images/articulos/pastas/sam-mills-macarrones-escalar.jpg">
                    <img src="images/articulos/pastas/sam-mills-macarrones-escalar.jpg" alt="Sam Mills Macarrones">
                </a>
                <h4>4.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Carretilla Alubias</div>
                <a target="_blank" href="images/articulos/preparados/Carretilla-alubias-escalar.jpg">
                    <img src="images/articulos/preparados/Carretilla-alubias-escalar.jpg" alt="Carretilla Alubias">
                </a>
                <h4>6.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Carretilla Arroz con pollo al Curry</div>
                <a target="_blank" href="images/articulos/preparados/Carretilla-arroz-con-pollo-al-curry-escalar.jpg">
                    <img src="images/articulos/preparados/Carretilla-arroz-con-pollo-al-curry-escalar.jpg" alt="Carretilla Arroz con Pollo al Curry">
                </a>
                <h4>7.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Isabel Albóndigas con Atún</div>
                <a target="_blank" href="images/articulos/preparados/Isabel-albondigas-con-atun-escalar.jpg">
                    <img src="images/articulos/preparados/Isabel-albondigas-con-atun-escalar.jpg" alt="Isable Albóndigas con Atún">
                </a>
                <h4>5.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Louriño Albóndigas con Guisantes</div>
                <a target="_blank" href="images/articulos/preparados/Louriño-albondigas-con-guisantes-escalar.jpg">
                    <img src="images/articulos/preparados/Louriño-albondigas-con-guisantes-escalar.jpg" alt="Louriño Algóndigas con Guisantes">
                </a>
                <h4>6.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Yatekomo Arroz 3 Delicias</div>
                <a target="_blank" href="images/articulos/preparados/Yatekomo-arroz-3-delicias-escalar.jpg">
                    <img src="images/articulos/preparados/Yatekomo-arroz-3-delicias-escalar.jpg" alt="Yatekomo Arroz 3 Delicias">
                </a>
                <h4>5.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Rolmovil Cubre Volante</div>
                <a target="_blank" href="images/articulos/automovil/accesorios/Rolmovil-cubre-volante-escalar.jpg">
                    <img src="images/articulos/automovil/accesorios/Rolmovil-cubre-volante-escalar.jpg" alt="Rolmovil Cubre Volante">
                </a>
                <h4>15.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Rolmovil Extintor</div>
                <a target="_blank" href="images/articulos/automovil/accesorios/Rolmovil-extintor-escalar.jpg">
                    <img src="images/articulos/automovil/accesorios/Rolmovil-extintor-escalar.jpg" alt="Rolmovil Extintor">
                </a>
                <h4>19.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Rolmovil Parasol</div>
                <a target="_blank" href="images/articulos/automovil/accesorios/Rolmovil-parasol-escalar.jpg">
                    <img src="images/articulos/automovil/accesorios/Rolmovil-parasol-escalar.jpg" alt="Rolmovil Parasol">
                </a>
                <h4>14.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Rolmovil Triángulo de Emergencia</div>
                <a target="_blank" href="images/articulos/automovil/accesorios/Rolmovil-triangulo-de-emergencia-escalar.jpg">
                    <img src="images/articulos/automovil/accesorios/Rolmovil-triangulo-de-emergencia-escalar.jpg" alt="Rolmovil Triángulo de Emergencia">
                </a>
                <h4>29.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Air-Wick 2D Ambientador</div>
                <a target="_blank" href="images/articulos/automovil/limpieza/air-wick-2d-ambientador-escalar.jpg">
                    <img src="images/articulos/automovil/limpieza/air-wick-2d-ambientador-escalar.jpg" alt="Air-Wick 2D Ambientador">
                </a>
                <h4>9.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Arbre Magique Ambientador</div>
                <a target="_blank" href="images/articulos/automovil/limpieza/arbre-magique-ambientador-escalar.jpg">
                    <img src="images/articulos/automovil/limpieza/arbre-magique-ambientador-escalar.jpg" alt="Arbre Magique Ambientador">
                </a>
                <h4>5.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Krafft Limpia Parabrisas</div>
                <a target="_blank" href="images/articulos/automovil/limpieza/krafft-limpia-parabrisas-escalar.jpg">
                    <img src="images/articulos/automovil/limpieza/krafft-limpia-parabrisas-escalar.jpg" alt="Krafft Limpia Parabrisas">
                </a>
                <h4>18.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Rolmovil Ambientador</div>
                <a target="_blank" href="images/articulos/automovil/limpieza/rolmovil-ambientador-escalar.jpg">
                    <img src="images/articulos/automovil/limpieza/rolmovil-ambientador-escalar.jpg" alt="Rolmovil Ambientador">
                </a>
                <h4>19.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Abadan Alas de Pollo</div>
                <a target="_blank" href="images/articulos/congelados/carne/abadan-alas-de-pollo-escalar.jpg">
                    <img src="images/articulos/congelados/carne/abadan-alas-de-pollo-escalar.jpg" alt="Abadan Alas de Pollo">
                </a>
                <h4>14.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Meet Beef Albóndigas</div>
                <a target="_blank" href="images/articulos/congelados/carne/meet-beef-albondigas-escalar.jpg">
                    <img src="images/articulos/congelados/carne/meet-beef-albondigas-escalar.jpg" alt="Meet Beef Albóndigas">
                </a>
                <h4>15.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Meet Chicken Solomillo de Pollo</div>
                <a target="_blank" href="images/articulos/congelados/carne/meet-chicken-solimillo-de-pollo-escalar.jpg">
                    <img src="images/articulos/congelados/carne/meet-chicken-solimillo-de-pollo-escalar.jpg" alt="Meet Chicken Solomillo de Pollo">
                </a>
                <h4>18.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Campos Bocados de Atún</div>
                <a target="_blank" href="images/articulos/congelados/pescado/campos-bocados-de-atun-escalar.jpg">
                    <img src="images/articulos/congelados/pescado/campos-bocados-de-atun-escalar.jpg" alt="Campos Bocados de Atún">
                </a>
                <h4>14.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Campos Filetes de Atún</div>
                <a target="_blank" href="images/articulos/congelados/pescado/campos-filetes-de-atun-escalar.jpg">
                    <img src="images/articulos/congelados/pescado/campos-filetes-de-atun-escalar.jpg" alt="Campos Filetes de Atún">
                </a>
                <h4>16.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Findus Bacalado Rebosado</div>
                <a target="_blank" href="images/articulos/congelados/pescado/findus-bacalado-rebosado-escalar.jpg">
                    <img src="images/articulos/congelados/pescado/findus-bacalado-rebosado-escalar.jpg" alt="Findus Bacalado Rebosado">
                </a>
                <h4>15.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Pescanova Anillos a la Romana</div>
                <a target="_blank" href="images/articulos/congelados/pescado/pescanova-anillos-a-la-romana-escalar.jpg">
                    <img src="images/articulos/congelados/pescado/pescanova-anillos-a-la-romana-escalar.jpg" alt="Pescanova Anillos a la Romana">
                </a>
                <h4>15.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Huevos Dagu 12 Unidades</div>
                <a target="_blank" href="images/articulos/lacteos/huevos/dagu-12u-escalar.jpg">
                    <img src="images/articulos/lacteos/huevos/dagu-12u-escalar.jpg" alt="Huevos Dagu 12 Unidades">
                </a>
                <h4>5.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Huevos Los Rancheros 6 Unidades</div>
                <a target="_blank" href="images/articulos/lacteos/huevos/los-rancheros-6u-escalar.jpg">
                    <img src="images/articulos/lacteos/huevos/los-rancheros-6u-escalar.jpg" alt="Huevos Los Rancheros 6 Unidades">
                </a>
                <h4>4.55 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Huevos Pazo de Villane 6 Unidades</div>
                <a target="_blank" href="images/articulos/lacteos/huevos/pazo-de-vilane-6u-escalar.jpg">
                    <img src="images/articulos/lacteos/huevos/pazo-de-vilane-6u-escalar.jpg" alt="Huevos Pazo de Villane 6 Unidades">
                </a>
                <h4>4.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Huevos Pitas 12 Unidades</div>
                <a target="_blank" href="images/articulos/lacteos/huevos/pitas-12u-escalar.jpg">
                    <img src="images/articulos/lacteos/huevos/pitas-12u-escalar.jpg" alt="Huevos Pitas 12 Unidades">
                </a>
                <h4>6.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Yogur Activia Limón 4 Unidades</div>
                <a target="_blank" href="images/articulos/lacteos/yogur/activia-limon-4u-escalar.jpg">
                    <img src="images/articulos/lacteos/yogur/activia-limon-4u-escalar.jpg" alt="Yogur Activia Limón 4 Unidades">
                </a>
                <h4>2.45 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Yogur Danone 4 Unidades</div>
                <a target="_blank" href="images/articulos/lacteos/yogur/danone-4u-escalar.jpg">
                    <img src="images/articulos/lacteos/yogur/danone-4u-escalar.jpg" alt="Yogur Danone 4 Unidades">
                </a>
                <h4>2.35 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Yogur Danone Limón 4 Unidades</div>
                <a target="_blank" href="images/articulos/lacteos/yogur/danone-limon-4u-escalar.jpg">
                    <img src="images/articulos/lacteos/yogur/danone-limon-4u-escalar.jpg" alt="Yogur Danone Limón 4 Unidades">
                </a>
                <h4>2.25 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Natillas Danone 4 Unidades</div>
                <a target="_blank" href="images/articulos/lacteos/yogur/danone-natillas-4u-escalar.jpg">
                    <img src="images/articulos/lacteos/yogur/danone-natillas-4u-escalar.jpg" alt="Natillas Danone 4 Unidades">
                </a>
                <h4>2.65 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Yogur Kalise Variado 8 Unidades</div>
                <a target="_blank" href="images/articulos/lacteos/yogur/kalise-variado-8u-escalar.jpg">
                    <img src="images/articulos/lacteos/yogur/kalise-variado-8u-escalar.jpg" alt="Yogur Kalise Variado 8 Unidades">
                </a>
                <h4>3.45 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Leche Asturiana Desnatada</div>
                <a target="_blank" href="images/articulos/lacteos/leche/asturiana-desnatada-escalar.jpg">
                    <img src="images/articulos/lacteos/leche/asturiana-desnatada-escalar.jpg" alt="Leche Asturiana Desnatada">
                </a>
                <h4>2.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Leche Asturiana Entera</div>
                <a target="_blank" href="images/articulos/lacteos/leche/asturiana-entera-escalar.jpg">
                    <img src="images/articulos/lacteos/leche/asturiana-entera-escalar.jpg" alt="Leche Asturiana Entera">
                </a>
                <h4>2.95 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Leche Calo Entera</div>
                <a target="_blank" href="images/articulos/lacteos/leche/calo-entera-escalar.jpg">
                    <img src="images/articulos/lacteos/leche/calo-entera-escalar.jpg" alt="Leche Calo Entera">
                </a>
                <h4>2.75 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Leche Celgan Desnatada</div>
                <a target="_blank" href="images/articulos/lacteos/leche/celgan-desnatada-escalar.jpg">
                    <img src="images/articulos/lacteos/leche/celgan-desnatada-escalar.jpg" alt="Leche Celgan Desnatada">
                </a>
                <h4>3.10 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Leche Celta Entera</div>
                <a target="_blank" href="images/articulos/lacteos/leche/celta-entera-escalar.jpg">
                    <img src="images/articulos/lacteos/leche/celta-entera-escalar.jpg" alt="Leche Celta Entera">
                </a>
                <h4>2.85 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Leche Pascual Desnatada</div>
                <a target="_blank" href="images/articulos/lacteos/leche/pascual-desnatada-escalar.jpg">
                    <img src="images/articulos/lacteos/leche/pascual-desnatada-escalar.jpg" alt="Leche Pascual Desnatada">
                </a>
                <h4>3.25 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Leche Pascual Entera</div>
                <a target="_blank" href="images/articulos/lacteos/leche/pascual-entera-escalar.jpg">
                    <img src="images/articulos/lacteos/leche/pascual-entera-escalar.jpg" alt="Leche Pascual Entera">
                </a>
                <h4>3.15 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Leche Puleva Desnatada</div>
                <a target="_blank" href="images/articulos/lacteos/leche/puleva-desnatada-escalar.jpg">
                    <img src="images/articulos/lacteos/leche/puleva-desnatada-escalar.jpg" alt="Leche Puleva Desnatada">
                </a>
                <h4>3.45 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Leche Puleva Entera</div>
                <a target="_blank" href="images/articulos/lacteos/leche/puleva-entera-escalar.jpg">
                    <img src="images/articulos/lacteos/leche/puleva-entera-escalar.jpg" alt="Leche Puleva Entera">
                </a>
                <h4>3.45 €</h4>
                <div class="desc"><a href="#">Añadir al Carro</a></div>
            </div>
        </div>
    </body>
</html>