<%@page import="DB.ArticleDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Article"%>
<%@page import="Model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Agua</title>
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
        <% for (Article articles : (ArrayList<Article>)ArticleDB.getTypeArticle("agua")) { %>
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
                <div class="desc">Bezolla 1.5L</div>
                <img src="images/articulos/agua/bezolla-1.5L-escalar.jpg" alt="Bezolla 1.5L">
                <h6>0.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Bezolla 1.5L">
                        <input type="hidden" name="imageArticle" value="images/articulos/agua/bezolla-1.5L-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="0.95">
                        <input type="hidden" name="descriptionArticle" value="De mineralización muy débil. Tiene un residuo seco muy bajo, que le hace diferente de la gran mayoría de las aguas. Uno de sus principales valores es que está indicada para dietas pobres en sodio y para la preparación de alimentos infantiles. 

El Agua Bezoya procede de la Sierra de Guadarrama, ubicada en plena Naturaleza y en la provincia de Segovia.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto20">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Bezolla 1.5L">
                        <input type="hidden" name="imageArticle" value="images/articulos/agua/bezolla-1.5L-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="0.95">
                        <input type="hidden" name="descriptionArticle" value="De mineralización muy débil. Tiene un residuo seco muy bajo, que le hace diferente de la gran mayoría de las aguas. Uno de sus principales valores es que está indicada para dietas pobres en sodio y para la preparación de alimentos infantiles. 

El Agua Bezoya procede de la Sierra de Guadarrama, ubicada en plena Naturaleza y en la provincia de Segovia.">
                        <input type="hidden" name="window" value="/Pages/Drinks/water.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="Agua mineral natural con gas extra botella 1,5 L.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto21">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Figas 1.5L">
                        <input type="hidden" name="imageArticle" value="images/articulos/agua/firgas-1.5L-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.05">
                        <input type="hidden" name="descriptionArticle" value="Agua mineral natural con gas extra botella 1,5 L.">
                        <input type="hidden" name="window" value="/Pages/Drinks/water.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="Font Vella es un agua equilibrada, de mineralización débil y 0% impurezas. Baja en sodio. 

Durante más de 15 años Font Vella recorre intacta un largo camino subterráneo, protegida por la naturaleza a más de 150 metros de profundidad, en el Parque Natural del Montseny y en el del Barranco del Río Dulce, dos parajes naturales.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto22">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Font Vella">
                        <input type="hidden" name="imageArticle" value="images/articulos/agua/font-vella-1.5L-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.15">
                        <input type="hidden" name="descriptionArticle" value="Font Vella es un agua equilibrada, de mineralización débil y 0% impurezas. Baja en sodio. 

Durante más de 15 años Font Vella recorre intacta un largo camino subterráneo, protegida por la naturaleza a más de 150 metros de profundidad, en el Parque Natural del Montseny y en el del Barranco del Río Dulce, dos parajes naturales.">
                        <input type="hidden" name="window" value="/Pages/Drinks/water.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="Agua mineral natural sin gas botella 1,5 L.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto23">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Terror Sin Gas">
                        <input type="hidden" name="imageArticle" value="images/articulos/agua/teror-sin-gas-1.5L-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.10">
                        <input type="hidden" name="descriptionArticle" value="Agua mineral natural sin gas botella 1,5 L.">
                        <input type="hidden" name="window" value="/Pages/Drinks/water.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>-->
    </body>
</html>