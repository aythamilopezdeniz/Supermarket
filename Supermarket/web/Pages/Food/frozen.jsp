<%@page import="DB.ArticleDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Article"%>
<%@page import="Model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Congelados</title>
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
        <% for (Article articles : (ArrayList<Article>)ArticleDB.getTypeArticle("congelados")) { %>
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
                        <input type="hidden" name="window" value="/Pages/Food/frozen.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Food/frozen.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Food/frozen.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Food/frozen.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Food/frozen.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Food/frozen.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Food/frozen.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>-->
    </body>
</html>