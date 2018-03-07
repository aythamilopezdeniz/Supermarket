<%@page import="Model.Article"%>
<%@page import="Model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Alimentación</title>
        <%@include file="/PageStyle/head.jsp"%>
    </head>
    <body>
        <%
            if(session.getAttribute("user")==null) {
        %>
            <%@include file="/PageStyle/nonActiveSession.jsp"%>
        <% } else {%>
            <%@include file="/PageStyle/sessionActive.jsp"%>
        <% }%>
        
        <!-- Navegación -->
        <%@include file="/PageStyle/menu.jsp"%>
        
        <!-- Artículos -->
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Ecolecera Espaguettis</div>
                <img src="images/articulos/pastas/ecolecera-espaguettis-escalar.jpg" alt="Ecolecera Espaguettis">
                <h6>1.75 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Ecolecera Espaguettis">
                        <input type="hidden" name="imageArticle" value="images/articulos/pastas/ecolecera-espaguettis-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.75">
                        <input type="hidden" name="descriptionArticle" value="Espaguetis ecológicos, pasta compuesta integral de calidad superior ECOLECERA 500 gr.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto38">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Ecolecera Espaguettis">
                        <input type="hidden" name="imageArticle" value="images/articulos/pastas/ecolecera-espaguettis-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.75">
                        <input type="hidden" name="descriptionArticle" value="Espaguetis ecológicos, pasta compuesta integral de calidad superior ECOLECERA 500 gr.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Gallo Espaguettis</div>
                <img src="images/articulos/pastas/gallo-espaguettis-escalar.jpg" alt="Gallo Espaguettis">
                <h6>2.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Gallo Espaguettis">
                        <input type="hidden" name="imageArticle" value="images/articulos/pastas/gallo-espaguettis-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.95">
                        <input type="hidden" name="descriptionArticle" value="Espagueti Nº 3 GALLO paquete de 500 grs.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto39">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Gallo Espaguettis">
                        <input type="hidden" name="imageArticle" value="images/articulos/pastas/gallo-espaguettis-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.95">
                        <input type="hidden" name="descriptionArticle" value="Espagueti Nº 3 GALLO paquete de 500 grs.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Gallo Fideos</div>
                <img src="images/articulos/pastas/gallo-fideos-escalar.jpg" alt="Gallo Fideos">
                <h6>3.65 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Gallo Fideos">
                        <input type="hidden" name="imageArticle" value="images/articulos/pastas/gallo-fideos-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.65">
                        <input type="hidden" name="descriptionArticle" value="Estrellas GALLO paquete de 500 gr.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto40">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Gallo Fideos">
                        <input type="hidden" name="imageArticle" value="images/articulos/pastas/gallo-fideos-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.65">
                        <input type="hidden" name="descriptionArticle" value="Estrellas GALLO paquete de 500 gr.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Gallo Macarrones</div>
                <img src="images/articulos/pastas/gallo-macarrones-escalar.jpg" alt="Gallo Macarrones">
                <h6>4.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Gallo Macarrones">
                        <input type="hidden" name="imageArticle" value="images/articulos/pastas/gallo-macarrones-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="4.95">
                        <input type="hidden" name="pvpArticle" value="Macarrón rayado GALLO paquete de 500 gr.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto41">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Gallo Macarrones">
                        <input type="hidden" name="imageArticle" value="images/articulos/pastas/gallo-macarrones-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="4.95">
                        <input type="hidden" name="pvpArticle" value="Macarrón rayado GALLO paquete de 500 gr.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Gallo Sedalis Espaguettis</div>
                <img src="images/articulos/pastas/gallo-sedalis-espaguettis-escalar.jpg" alt="Gallo Sedalis Espaguettis">
                <h6>3.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Gallo Segalis Espaguettis">
                        <input type="hidden" name="imageArticle" value="images/articulos/pastas/gallo-sedalis-espaguettis-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.95">
                        <input type="hidden" name="descriptionArticle" value="Espagueti Nº 3 GALLO SEDALIS paquete de 500 grs">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto42">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Gallo Segalis Espaguettis">
                        <input type="hidden" name="imageArticle" value="images/articulos/pastas/gallo-sedalis-espaguettis-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.95">
                        <input type="hidden" name="descriptionArticle" value="Espagueti Nº 3 GALLO SEDALIS paquete de 500 grs">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Gallo Sin Gluten Macarrones</div>
                <img src="images/articulos/pastas/gallo-sin-gluten-macarrones-escalar.jpg" alt="Gallo Sin Gluten Macarrones">
                <h6>4.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Gallo Sin Gluten Macarrones">
                        <input type="hidden" name="imageArticle" value="images/articulos/pastas/gallo-sin-gluten-macarrones-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="4.95">
                        <input type="hidden" name="descriptionArticle" value="Gallo sin gluten GALLO, 500 gr,.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto43">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Gallo Sin Gluten Macarrones">
                        <input type="hidden" name="imageArticle" value="images/articulos/pastas/gallo-sin-gluten-macarrones-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="4.95">
                        <input type="hidden" name="descriptionArticle" value="Gallo sin gluten GALLO, 500 gr,.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Romero Fideos</div>
                <img src="images/articulos/pastas/romero-fideos-escalar.jpg" alt="Romero fideos">
                <h6>3.65 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Romero Fideos">
                        <input type="hidden" name="imageArticle" value="images/articulos/pastas/romero-fideos-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.65">
                        <input type="hidden" name="descriptionArticle" value="Fideo cabellín+ ROMERO paquete de 500 gr.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto44">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Romero Fideos">
                        <input type="hidden" name="imageArticle" value="images/articulos/pastas/romero-fideos-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.65">
                        <input type="hidden" name="descriptionArticle" value="Fideo cabellín+ ROMERO paquete de 500 gr.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Romero Macarrones</div>
                <img src="images/articulos/pastas/romero-macarrones-escalar.jpg" alt="Romero Macarrones">
                <h6>4.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Romero Macarrones">
                        <input type="hidden" name="imageArticle" value="images/articulos/pastas/romero-macarrones-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="4.95">
                        <input type="hidden" name="descriptionArticle" value="Espirales,pasta ROMERO 500 gr.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto45">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Romero Macarrones">
                        <input type="hidden" name="imageArticle" value="images/articulos/pastas/romero-macarrones-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="4.95">
                        <input type="hidden" name="descriptionArticle" value="Espirales,pasta ROMERO 500 gr.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Sam Mills Macarrones</div>
                <img src="images/articulos/pastas/sam-mills-macarrones-escalar.jpg" alt="Sam Mills Macarrones">
                <h6>4.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Sam Mills Macarrones">
                        <input type="hidden" name="imageArticle" value="images/articulos/pastas/sam-mills-macarrones-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="4.95">
                        <input type="hidden" name="descriptionArticle" value="Fusilli, pasta sin Gluten SAM MILLS 500 gr,.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto46">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Sam Mills Macarrones">
                        <input type="hidden" name="imageArticle" value="images/articulos/pastas/sam-mills-macarrones-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="4.95">
                        <input type="hidden" name="descriptionArticle" value="Fusilli, pasta sin Gluten SAM MILLS 500 gr,.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Carretilla Alubias</div>
                <img src="images/articulos/preparados/Carretilla-alubias-escalar.jpg" alt="Carretilla Alubias">
                <h6>6.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Carretilla Alubias">
                        <input type="hidden" name="imageArticle" value="images/articulos/preparados/Carretilla-alubias-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="6.95">
                        <input type="hidden" name="descriptionArticle" value="Alubias al estilo casero CARRETILLA 300 g.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto47">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Carretilla Alubias">
                        <input type="hidden" name="imageArticle" value="images/articulos/preparados/Carretilla-alubias-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="6.95">
                        <input type="hidden" name="descriptionArticle" value="Alubias al estilo casero CARRETILLA 300 g.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Carretilla Arroz con pollo al Curry</div>
                <img src="images/articulos/preparados/Carretilla-arroz-con-pollo-al-curry-escalar.jpg" alt="Carretilla Arroz con Pollo al Curry">
                <h6>7.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Carretilla Arroz con pollo al Curry">
                        <input type="hidden" name="imageArticle" value="images/articulos/preparados/Carretilla-arroz-con-pollo-al-curry-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="7.95">
                        <input type="hidden" name="descriptionArticle" value="Arroz con pollo al curry Carretilla 300 g.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto48">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Carretilla Arroz con pollo al Curry">
                        <input type="hidden" name="imageArticle" value="images/articulos/preparados/Carretilla-arroz-con-pollo-al-curry-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="7.95">
                        <input type="hidden" name="descriptionArticle" value="Arroz con pollo al curry Carretilla 300 g.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Isabel Albóndigas con Atún</div>
                <img src="images/articulos/preparados/Isabel-albondigas-con-atun-escalar.jpg" alt="Isable Albóndigas con Atún">
                <h6>5.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Isabel Albondigas con Atun">
                        <input type="hidden" name="imageArticle" value="images/articulos/preparados/Isabel-albondigas-con-atun-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="5.95">
                        <input type="hidden" name="descriptionArticle" value="Albóndigas de atún con tomate ISABEL 100 g.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto49">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Isabel Albondigas con Atun">
                        <input type="hidden" name="imageArticle" value="images/articulos/preparados/Isabel-albondigas-con-atun-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="5.95">
                        <input type="hidden" name="descriptionArticle" value="Albóndigas de atún con tomate ISABEL 100 g.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Louriño Albóndigas con Guisantes</div>
                <img src="images/articulos/preparados/Lourino-albondigas-con-guisantes-escalar.jpg" alt="Louriño Algóndigas con Guisantes">
                <h6>6.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Lourino Albondigas con Guisantes">
                        <input type="hidden" name="imageArticle" value="images/articulos/preparados/Lourino-albondigas-con-guisantes-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="6.95">
                        <input type="hidden" name="descriptionArticle" value="Albóndigas con guisantes LOURIÑO lata de 425 g.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto50">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Lourino Albondigas con Guisantes">
                        <input type="hidden" name="imageArticle" value="images/articulos/preparados/Lourino-albondigas-con-guisantes-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="6.95">
                        <input type="hidden" name="descriptionArticle" value="Albóndigas con guisantes LOURIÑO lata de 425 g.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Yatekomo Arroz 3 Delicias</div>
                <img src="images/articulos/preparados/Yatekomo-arroz-3-delicias-escalar.jpg" alt="Yatekomo Arroz 3 Delicias">
                <h6>5.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Yatekomo Arroz 3 Delicias">
                        <input type="hidden" name="imageArticle" value="images/articulos/preparados/Yatekomo-arroz-3-delicias-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="5.95">
                        <input type="hidden" name="descriptionArticle" value="Arroz 3 delicias YATEKOMO 100 grs.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto51">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input type="hidden" name="command" value="Product">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Yatekomo Arroz 3 Delicias">
                        <input type="hidden" name="imageArticle" value="images/articulos/preparados/Yatekomo-arroz-3-delicias-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="5.95">
                        <input type="hidden" name="descriptionArticle" value="Arroz 3 delicias YATEKOMO 100 grs.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
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
                        <input type="hidden" name="descriptionArticle" value="Alas de pollo ABADAN 900 gr.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto60">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Abadan Alas de Pollo">
                        <input type="hidden" name="imageArticle" value="images/articulos/congelados/carne/abadan-alas-de-pollo-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="14.95">
                        <input type="hidden" name="descriptionArticle" value="Alas de pollo ABADAN 900 gr.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="Albóndigas de vacuno MEAT BEEF 600 gr.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto61">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Meet Beef Albondigas">
                        <input type="hidden" name="imageArticle" value="images/articulos/congelados/carne/meet-beef-albondigas-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="15.95">
                        <input type="hidden" name="descriptionArticle" value="Albóndigas de vacuno MEAT BEEF 600 gr.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Meet Chicken Solomillo de Pollo</div>
                <img src="images/articulos/congelados/carne/meet-chicken-solomillo-de-pollo-escalar.jpg" alt="Meet Chicken Solomillo de Pollo">
                <h6>18.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Meet Chicken Solomillo de Pollo">
                        <input type="hidden" name="imageArticle" value="images/articulos/congelados/carne/meet-chicken-solomillo-de-pollo-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="18.95">
                        <input type="hidden" name="descriptionArticle" value="Solomillos de pollo MEAT CHICKEN 600 gr">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto62">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Meet Chicken Solomillo de Pollo">
                        <input type="hidden" name="imageArticle" value="images/articulos/congelados/carne/meet-chicken-solomillo-de-pollo-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="18.95">
                        <input type="hidden" name="descriptionArticle" value="Solomillos de pollo MEAT CHICKEN 600 gr">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="Atún en dados CAMPOS 250 gr.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto63">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Campos Bocados de Atun">
                        <input type="hidden" name="imageArticle" value="images/articulos/congelados/pescado/campos-bocados-de-atun-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="14.95">
                        <input type="hidden" name="descriptionArticle" value="Atún en dados CAMPOS 250 gr.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="Atún en solomillo CAMPOS 250 gr.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto64">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Campos Filetes de Atun">
                        <input type="hidden" name="imageArticle" value="images/articulos/congelados/pescado/campos-filetes-de-atun-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="16.95">
                        <input type="hidden" name="descriptionArticle" value="Atún en solomillo CAMPOS 250 gr.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="Bacalao rebozado FINDUS 280 gr.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto65">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Findus Bacalado Rebosado">
                        <input type="hidden" name="imageArticle" value="images/articulos/congelados/pescado/findus-bacalado-rebosado-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="15.95">
                        <input type="hidden" name="descriptionArticle" value="Bacalao rebozado FINDUS 280 gr.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="Calamares a la romana en anillas PESCANOVA 400 gr.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto66">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Pescanova Anillos a la Romana">
                        <input type="hidden" name="imageArticle" value="images/articulos/congelados/pescado/pescanova-anillos-a-la-romana-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="15.95">
                        <input type="hidden" name="descriptionArticle" value="Calamares a la romana en anillas PESCANOVA 400 gr.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
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
                        <input type="hidden" name="descriptionArticle" value="Huevos Clase L Chef DAGU 12 Unidades.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto67">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Huevos Dagu 12 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/huevos/dagu-12u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="5.95">
                        <input type="hidden" name="descriptionArticle" value="Huevos Clase L Chef DAGU 12 Unidades.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="Huevos clase M LOS RANCHEROS cartón de 6 uds.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto68">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Huevos Los Rancheros 6 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/huevos/los-rancheros-6u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="4.55">
                        <input type="hidden" name="descriptionArticle" value="Huevos clase M LOS RANCHEROS cartón de 6 uds.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="En Vilane mantenemos la tradición, nuestras gallinas de crían al aire libre y completan su dieta a voluntad en los extensos campos del Pazo.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto69">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Huevos Pazo de Vilane 6 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/huevos/pazo-de-vilane-6u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="4.95">
                        <input type="hidden" name="descriptionArticle" value="En Vilane mantenemos la tradición, nuestras gallinas de crían al aire libre y completan su dieta a voluntad en los extensos campos del Pazo.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="Huevos Clase L PITAS 12 Unidades.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto70">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Huevos Pitas 12 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/huevos/pitas-12u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="6.95">
                        <input type="hidden" name="descriptionArticle" value="Huevos Clase L PITAS 12 Unidades.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="Yogur bifidus con sabor a limón DANONE ACTIVIA CREMOSO pack de 4 uds de 120 gr">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto71">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Yogur Activia Limón 4 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/yogur/activia-limon-4u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.95">
                        <input type="hidden" name="descriptionArticle" value="Yogur bifidus con sabor a limón DANONE ACTIVIA CREMOSO pack de 4 uds de 120 gr">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="El Yogur Danone está elaborado con leche fresca de ganaderos españoles que trabajan con Danone hace muchos años.

Es un alimento nutritivo, con fermentos activos exclusivos.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto72">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Yogur Danone 4 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/yogur/danone-4u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.35">
                        <input type="hidden" name="descriptionArticle" value="El Yogur Danone está elaborado con leche fresca de ganaderos españoles que trabajan con Danone hace muchos años.

Es un alimento nutritivo, con fermentos activos exclusivos.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="El Yogur Danone está elaborado con leche fresca de ganaderos españoles que trabajan con Danone hace muchos años.

Es un alimento nutritivo, con fermentos activos exclusivos.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto73">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Yogur Danone Limon 4 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/yogur/danone-limon-4u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.25">
                        <input type="hidden" name="descriptionArticle" value="El Yogur Danone está elaborado con leche fresca de ganaderos españoles que trabajan con Danone hace muchos años.

Es un alimento nutritivo, con fermentos activos exclusivos.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="Ahora Danet Doble Placer te trae tus Danet con deliciosa base de vainilla o chocolate cubierta por una esponjosa mousse de nata o de chocolate. ¡Mires como lo mires, una combinación irresistible! Con Danet Sabor Vainilla con Nata, descubrirás la perfecta harmonía del sabor de la vainilla combinado con una deliciosa capa de mousse de nata.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto74">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Natillas Danone 4 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/yogur/danone-natillas-4u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.65">
                        <input type="hidden" name="descriptionArticle" value="Ahora Danet Doble Placer te trae tus Danet con deliciosa base de vainilla o chocolate cubierta por una esponjosa mousse de nata o de chocolate. ¡Mires como lo mires, una combinación irresistible! Con Danet Sabor Vainilla con Nata, descubrirás la perfecta harmonía del sabor de la vainilla combinado con una deliciosa capa de mousse de nata.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="Gracias a sus fermentos naturales, facilita la digestión de la lactosa que contienen.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto75">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Yogur Kalise Variado 8 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/yogur/kalise-variado-8u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.45">
                        <input type="hidden" name="descriptionArticle" value="Gracias a sus fermentos naturales, facilita la digestión de la lactosa que contienen.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="Leche desnatada 0,0% materia grasa CENTRAL LECHERA ASTURIANA.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto76">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Leche Asturiana Desnatada">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/asturiana-desnatada-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.95">
                        <input type="hidden" name="descriptionArticle" value="Leche desnatada 0,0% materia grasa CENTRAL LECHERA ASTURIANA.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="Leche entera CENTRAL LECHERA ASTURIANA.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto77">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Leche Asturiana Entera">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/asturiana-entera-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.95">
                        <input type="hidden" name="descriptionArticle" value="Leche entera CENTRAL LECHERA ASTURIANA.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="Leche entera Calo 1L.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto78">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Leche Calo Entera">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/calo-entera-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.75">
                        <input type="hidden" name="descriptionArticle" value="Leche entera Calo 1L.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="Leche desnatada celga 1L.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto79">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Leche Celgan Desnatada">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/celgan-desnatada-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.10">
                        <input type="hidden" name="descriptionArticle" value="Leche desnatada celga 1L.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="Leche entera CELTA 1.5 L.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto80">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Leche Celta Entera">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/celta-entera-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.85">
                        <input type="hidden" name="descriptionArticle" value="Leche entera CELTA 1.5 L.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="Leche desnatada PASCUAL 1.5 L.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto81">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Leche Pascual Desnatada">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/pascual-desnatada-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.25">
                        <input type="hidden" name="descriptionArticle" value="Leche desnatada PASCUAL 1.5 L.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="Leche entera PASCUAL 1 L.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto82">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Leche Pascual Entera">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/pascual-entera-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.15">
                        <input type="hidden" name="descriptionArticle" value="Leche entera PASCUAL 1 L.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="Leche desnatada con calcio PULEVA 1L.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto83">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Leche Puleva Desnatada">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/puleva-desnatada-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.45">
                        <input type="hidden" name="descriptionArticle" value="Leche desnatada con calcio PULEVA 1L.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="Leche entera con calcio PULEVA 1L.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto84">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Leche Puleva Entera">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/leche/puleva-entera-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.45">
                        <input type="hidden" name="descriptionArticle" value="Leche entera con calcio PULEVA 1L.">
                        <input type="hidden" name="window" value="/Pages/Food/food.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>