<%@page import="DB.ArticleDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Article"%>
<%@page import="Model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Zumos</title>
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
        <div class="producto">
            <div class="container">
                <% for (Article articles : (ArrayList<Article>) ArticleDB.getTypeArticle("zumos")) {%>
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
                                <!--<input class="seeProduct" type="submit" value="Ver">-->
                                <button id="seeProduct" type="submit" class="btn btn-primary">Ver</button>
                            </form>
                            <form method="post" action="FrontServlet">
                                <input type="hidden" name="nameArticle" value="<%=articles.getNombre()%>">
                                <input type="hidden" name="imageArticle" value="<%=articles.getImage()%>">
                                <input type="hidden" name="pvpArticle" value="<%=articles.getPvp()%>">
                                <input type="hidden" name="type" value="<%=articles.getType()%>">
                                <input type="hidden" name="subtype1" value="<%=articles.getSubtype1()%>">
                                <input type="hidden" name="subtype2" value="<%=articles.getSubtype2()%>">
                                <input type="hidden" name="descriptionArticle" value="<%=articles.getDescription()%>">
                                <input type="hidden" name="window" value="/Pages/Drinks/juices.jsp">
                                <input type="hidden" name="command" value="Product">
                                <!--<input type="submit" value="Añadir al Carro">-->
                                <button type="submit" class="btn btn-primary">Añadir</button>
                            </form>
                        </div>
                    </div>
                </div><%}%>
            </div>
        </div>

        <!-- Footer -->
        <%@include file="/PageStyle/footer.jsp"%>

        <!--<div class="responsive">
            <div class="gallery">
                <div class="desc">Don Simón Naranja</div>
                <img src="images/articulos/zumos/don-simon-naranja-escalar.jpg" alt="Don Simon">
                <h6>1.43 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Don Simon Naranja">
                        <input type="hidden" name="imageArticle" value="images/articulos/zumos/don-simon-naranja-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.43">
                        <input type="hidden" name="descriptionArticle" value="El nectar de naranja Don Simon es el unico en el mercado elaborado con zumo exprimido, diferenciandose de otros nectares de la competencia hechos con zumo de naranja a base de concentrado.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto1">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Don Simon Naranja">
                        <input type="hidden" name="imageArticle" value="images/articulos/zumos/don-simon-naranja-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.43">
                        <input type="hidden" name="descriptionArticle" value="El nectar de naranja Don Simon es el unico en el mercado elaborado con zumo exprimido, diferenciandose de otros nectares de la competencia hechos con zumo de naranja a base de concentrado.">
                        <input type="hidden" name="window" value="/Pages/Drinks/juices.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="Juver Disfruta es la mejor opción para controlar los azúcares y calorías de tu dieta de una forma sana y deliciosa.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto3">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Juver Melocoton">
                        <input type="hidden" name="imageArticle" value="images/articulos/zumos/juver-melocoton-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.34">
                        <input type="hidden" name="descriptionArticle" value="Juver Disfruta es la mejor opción para controlar los azúcares y calorías de tu dieta de una forma sana y deliciosa.">
                        <input type="hidden" name="window" value="/Pages/Drinks/juices.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="Todo el sabor de la fruta sin azúcares añadidos y pocas calorías. Juver Disfruta es la mejor opción para controlar los azúcares y calorías de tu dieta de una forma sana y deliciosa.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto5">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Juver Pina">
                        <input type="hidden" name="imageArticle" value="images/articulos/zumos/juver-pina-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.44">
                        <input type="hidden" name="descriptionArticle" value="Todo el sabor de la fruta sin azúcares añadidos y pocas calorías. Juver Disfruta es la mejor opción para controlar los azúcares y calorías de tu dieta de una forma sana y deliciosa.">
                        <input type="hidden" name="window" value="/Pages/Drinks/juices.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="Zumo de naranja a partir de zumo de naranja concentrado, pulpa de naranja.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto7">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Libby's Naranja">
                        <input type="hidden" name="imageArticle" value="images/articulos/zumos/libby's-naranja-1L-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.60">
                        <input type="hidden" name="descriptionArticle" value="Zumo de naranja a partir de zumo de naranja concentrado, pulpa de naranja.">
                        <input type="hidden" name="window" value="/Pages/Drinks/juices.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>-->
    </body>
</html>