<%@page import="java.util.ArrayList"%>
<%@page import="DB.ArticleDB"%>
<%@page import="Model.Article"%>
<%@page import="Model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>De Sabores</title>
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
        <% for (Article articles : (ArrayList<Article>)ArticleDB.getTypeArticle("sabores")) { %>
        <div class="responsive">
            <div class="gallery">
                <div class="desc"><%=articles.getNombre()%></div>
                <img src="<%=articles.getImage()%>" alt="<%=articles.getNombre()%>">
                <h6><%=articles.getPvp()%> €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="<%=articles.getNombre()%>">
                        <input type="hidden" name="imageArticle" value="<%=articles.getImage()%>">
                        <input type="hidden" name="pvpArticle" value="<%=articles.getPvp()%>">
                        <input type="hidden" name="descriptionArticle" value="<%=articles.getDescription()%>">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto1">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="<%=articles.getNombre()%>">
                        <input type="hidden" name="imageArticle" value="<%=articles.getImage()%>">
                        <input type="hidden" name="pvpArticle" value="<%=articles.getPvp()%>">
                        <input type="hidden" name="type" value="<%=articles.getType()%>">
                        <input type="hidden" name="subtype1" value="<%=articles.getSubtype1()%>">
                        <input type="hidden" name="subtype2" value="<%=articles.getSubtype2()%>">
                        <input type="hidden" name="descriptionArticle" value="<%=articles.getDescription()%>">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div><%}%>

        <!--<div class="responsive">
            <div class="gallery">
                <div class="desc">Pepsi 2L</div>
                <img src="images/articulos/refrescos/sabores/Pepsi-2L-escalar.png" alt="Pepsi 2L">
                <h6>1.90 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Pepsi 2L">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/sabores/Pepsi-2L-escalar.png">
                        <input type="hidden" name="pvpArticle" value="1.90">
                        <input type="hidden" name="descriptionArticle" value="El refresco carbonatado seña de identidad de PepsiCo. Desde sus humildes comienzos hace unos 100 años, Pepsi-Cola ha crecido hasta ser uno de los productos más conocidos y amados alrededor del mundo.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto10">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Pepsi 2L">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/sabores/Pepsi-2L-escalar.png">
                        <input type="hidden" name="pvpArticle" value="1.90">
                        <input type="hidden" name="descriptionArticle" value="El refresco carbonatado seña de identidad de PepsiCo. Desde sus humildes comienzos hace unos 100 años, Pepsi-Cola ha crecido hasta ser uno de los productos más conocidos y amados alrededor del mundo.">
                        <input type="hidden" name="window" value="/Pages/Drinks/Refreshments/flavor.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="Corría el año 1886. Lugar: Atlanta (Georgia). Un farmacéutico llamado John Pemberton se propuso crear una bebida que fuera a la vez refrescante y vigorizante. Buscó la mezcla perfecta de ingredientes frescos de todo el mundo hasta que la encontró. 

La mezcla exacta de los ingredientes y los extractos vegetales provenientes de todo el mundo que, hasta hoy, siguen formando parte de la fórmula secreta más famosa del mundo.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto11">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Coca cola">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/sabores/coca-cola-lata-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.20">
                        <input type="hidden" name="descriptionArticle" value="Corría el año 1886. Lugar: Atlanta (Georgia). Un farmacéutico llamado John Pemberton se propuso crear una bebida que fuera a la vez refrescante y vigorizante. Buscó la mezcla perfecta de ingredientes frescos de todo el mundo hasta que la encontró. 

La mezcla exacta de los ingredientes y los extractos vegetales provenientes de todo el mundo que, hasta hoy, siguen formando parte de la fórmula secreta más famosa del mundo.">
                        <input type="hidden" name="window" value="/Pages/Drinks/Refreshments/flavor.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="Bebida refrescante de zumo de frutas. Con azúcares y edulcorantes. 

Fanta es la bebida refrescante con zumo de frutas preferida por los jóvenes de nuestro país. Joven, alegre, extrovertida y siempre asociada a un sentimiento universal: la diversión con amigos">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto12">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Fanta">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/sabores/fanta-lata-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.15">
                        <input type="hidden" name="descriptionArticle" value="Bebida refrescante de zumo de frutas. Con azúcares y edulcorantes. 

Fanta es la bebida refrescante con zumo de frutas preferida por los jóvenes de nuestro país. Joven, alegre, extrovertida y siempre asociada a un sentimiento universal: la diversión con amigos">
                        <input type="hidden" name="window" value="/Pages/Drinks/Refreshments/flavor.jsp">
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
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Pepsi Lata">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/sabores/pepsi-lata-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.35">
                        <input type="hidden" name="descriptionArticle" value="El refresco carbonatado seña de identidad de PepsiCo. Desde sus humildes comienzos hace unos 100 años, Pepsi-Cola ha crecido hasta ser uno de los productos más conocidos y amados alrededor del mundo.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto13">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Pepsi Lata">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/sabores/pepsi-lata-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.35">
                        <input type="hidden" name="descriptionArticle" value="El refresco carbonatado seña de identidad de PepsiCo. Desde sus humildes comienzos hace unos 100 años, Pepsi-Cola ha crecido hasta ser uno de los productos más conocidos y amados alrededor del mundo.">
                        <input type="hidden" name="window" value="/Pages/Drinks/Refreshments/flavor.jsp">
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
                        <input type="hidden" name="pvpArticle" value="Bebida refrescante de extractos. Con azúcares y edulcorantes. Ideal para esos momentos en los que te apetece una bebida con un sabor diferente.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto14">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Sprite 1.5L">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/sabores/sprite-1.5L-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.75">
                        <input type="hidden" name="pvpArticle" value="Bebida refrescante de extractos. Con azúcares y edulcorantes. Ideal para esos momentos en los que te apetece una bebida con un sabor diferente.">
                        <input type="hidden" name="window" value="/Pages/Drinks/Refreshments/flavor.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="Bebida refrescante de extractos. Con azúcares y edulcorantes. Ideal para esos momentos en los que te apetece una bebida con un sabor diferente.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto15">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Sprite Lata">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/sabores/sprite-lata-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.20">
                        <input type="hidden" name="descriptionArticle" value="Bebida refrescante de extractos. Con azúcares y edulcorantes. Ideal para esos momentos en los que te apetece una bebida con un sabor diferente.">
                        <input type="hidden" name="window" value="/Pages/Drinks/Refreshments/flavor.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>-->
    </body>
</html>