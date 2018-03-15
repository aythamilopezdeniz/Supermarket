<%@page import="DB.ArticleDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Article"%>
<%@page import="Model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Accesorios</title>
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
                <% for (Article articles : (ArrayList<Article>) ArticleDB.getTypeArticle("accesorios")) {%>
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
                                <input type="hidden" name="window" value="/Pages/Car/accesories.jsp">
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
                <div class="desc">Rolmovil Cubre Volante</div>
                <img src="images/articulos/automovil/accesorios/Rolmovil-cubre-volante-escalar.jpg" alt="Rolmovil Cubre Volante">
                <h6>15.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Rolmovil Cubre Volante">
                        <input type="hidden" name="imageArticle" value="images/articulos/automovil/accesorios/Rolmovil-cubre-volante-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="15.95">
                        <input type="hidden" name="descriptionArticle" value="Cubrevolante de 37-39 centímetros ROLMOVIL.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto52">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Rolmovil Cubre Volante">
                        <input type="hidden" name="imageArticle" value="images/articulos/automovil/accesorios/Rolmovil-cubre-volante-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="15.95">
                        <input type="hidden" name="descriptionArticle" value="Cubrevolante de 37-39 centímetros ROLMOVIL.">
                        <input type="hidden" name="window" value="/Pages/Car/accessories.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Rolmovil Extintor</div>
                <img src="images/articulos/automovil/accesorios/Rolmovil-extintor-escalar.jpg" alt="Rolmovil Extintor">
                <h6>19.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Rolmovil Extintor">
                        <input type="hidden" name="imageArticle" value="images/articulos/automovil/accesorios/Rolmovil-extintor-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="19.95">
                        <input type="hidden" name="descriptionArticle" value="Extintor apagafuegos con manómetro y capacidad de 1 kilogramo ROLMOVIL.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto53">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Rolmovil Extintor">
                        <input type="hidden" name="imageArticle" value="images/articulos/automovil/accesorios/Rolmovil-extintor-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="19.95">
                        <input type="hidden" name="descriptionArticle" value="Extintor apagafuegos con manómetro y capacidad de 1 kilogramo ROLMOVIL.">
                        <input type="hidden" name="window" value="/Pages/Car/accessories.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Rolmovil Parasol</div>
                <img src="images/articulos/automovil/accesorios/Rolmovil-parasol-escalar.jpg" alt="Rolmovil Parasol">
                <h6>14.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Rolmovil Parasol">
                        <input type="hidden" name="imageArticle" value="images/articulos/automovil/accesorios/Rolmovil-parasol-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="14.95">
                        <input type="hidden" name="descriptionArticle" value="Parasol aluminizado con cerrado meidnate correas elásticas, efecto laser, cortina térmica refelctora y medida de 145x90 centímetros ROLMOVIL.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto54">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Rolmovil Parasol">
                        <input type="hidden" name="imageArticle" value="images/articulos/automovil/accesorios/Rolmovil-parasol-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="14.95">
                        <input type="hidden" name="descriptionArticle" value="Parasol aluminizado con cerrado meidnate correas elásticas, efecto laser, cortina térmica refelctora y medida de 145x90 centímetros ROLMOVIL.">
                        <input type="hidden" name="window" value="/Pages/Car/accessories.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Rolmovil Triángulo de Emergencia</div>
                <img src="images/articulos/automovil/accesorios/Rolmovil-triangulo-de-emergencia-escalar.jpg" alt="Rolmovil Triángulo de Emergencia">
                <h6>29.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Rolmovil Triangulo de Emergencia">
                        <input type="hidden" name="imageArticle" value="images/articulos/automovil/accesorios/Rolmovil-triangulo-de-emergencia-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="29.95">
                        <input type="hidden" name="descriptionArticle" value="Se puede plegar quedando guardado en un práctico y reducido estuche, por lo que nos ocupará muy poco espacio en nuestro maletero.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto55">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Rolmovil Triangulo de Emergencia">
                        <input type="hidden" name="imageArticle" value="images/articulos/automovil/accesorios/Rolmovil-triangulo-de-emergencia-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="29.95">
                        <input type="hidden" name="descriptionArticle" value="Se puede plegar quedando guardado en un práctico y reducido estuche, por lo que nos ocupará muy poco espacio en nuestro maletero.">
                        <input type="hidden" name="window" value="/Pages/Car/accessories.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>-->
    </body>
</html>