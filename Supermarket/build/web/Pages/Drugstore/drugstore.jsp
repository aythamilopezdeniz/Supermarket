<%@page import="DB.ArticleDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Article"%>
<%@page import="Model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Droguería</title>
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
        <% for (Article articles : (ArrayList<Article>)ArticleDB.getTypeArticle("drogueria")) { %>
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
                <div class="desc">Ariel</div>
                <img src="images/articulos/drogueria/ariel-escalar.jpg" alt="Ariel">
                <h6>3.45 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Ariel">
                        <input type="hidden" name="imageArticle" value="images/articulos/drogueria/ariel-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.45">
                        <input type="hidden" name="descriptionArticle" value="Detergente líquido para lavadora regular ARIEL 70 ds.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto24">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Ariel">
                        <input type="hidden" name="imageArticle" value="images/articulos/drogueria/ariel-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.45">
                        <input type="hidden" name="descriptionArticle" value="Detergente líquido para lavadora regular ARIEL 70 ds.">
                        <input type="hidden" name="window" value="/Pages/Drugstore/drugstore.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Colón</div>
                <img src="images/articulos/drogueria/colon-escalar.jpg" alt="Colón">
                <h6>4.10 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Colon">
                        <input type="hidden" name="imageArticle" value="images/articulos/drogueria/colon-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="4.10">
                        <input type="hidden" name="descriptionArticle" value="Detergente azul en polvo COLON 30 + 9ds.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto25">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Colon">
                        <input type="hidden" name="imageArticle" value="images/articulos/drogueria/colon-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="4.10">
                        <input type="hidden" name="descriptionArticle" value="Detergente azul en polvo COLON 30 + 9ds.">
                        <input type="hidden" name="window" value="/Pages/Drugstore/drugstore.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Mimosin Vaporesse</div>
                <img src="images/articulos/drogueria/mimosin-vaporesse-escalar.jpg" alt="Mimosin Vaporesse">
                <h6>3.10 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Mimosin Vaporosse">
                        <input type="hidden" name="imageArticle" value="images/articulos/drogueria/mimosin-vaporesse-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.10">
                        <input type="hidden" name="descriptionArticle" value="Agua de planchar perfumada MIMOSIN Vaporesse 1 L.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto26">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Mimosin Vaporosse">
                        <input type="hidden" name="imageArticle" value="images/articulos/drogueria/mimosin-vaporesse-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.10">
                        <input type="hidden" name="descriptionArticle" value="Agua de planchar perfumada MIMOSIN Vaporesse 1 L.">
                        <input type="hidden" name="window" value="/Pages/Drugstore/drugstore.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Norit</div>
                <img src="images/articulos/drogueria/norit-escalar.jpg" alt="Norit">
                <h6>3.60 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Norit">
                        <input type="hidden" name="imageArticle" value="images/articulos/drogueria/norit-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.60">
                        <input type="hidden" name="descriptionArticle" value="Detergente delicado lavado a mano NORIT 45 lavados. 1125 ml.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto27">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Norit">
                        <input type="hidden" name="imageArticle" value="images/articulos/drogueria/norit-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.60">
                        <input type="hidden" name="descriptionArticle" value="Detergente delicado lavado a mano NORIT 45 lavados. 1125 ml.">
                        <input type="hidden" name="window" value="/Pages/Drugstore/drugstore.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Vanish</div>
                <img src="images/articulos/drogueria/vanish-escalar.jpg" alt="Vanish">
                <h6>4.20 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Vanish">
                        <input type="hidden" name="imageArticle" value="images/articulos/drogueria/vanish-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="4.20">
                        <input type="hidden" name="descriptionArticle" value="Activador de lavado en polvo para lavar la ropa de color con oxígeno VANISH 2 L.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto28">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Vanish">
                        <input type="hidden" name="imageArticle" value="images/articulos/drogueria/vanish-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="4.20">
                        <input type="hidden" name="descriptionArticle" value="Activador de lavado en polvo para lavar la ropa de color con oxígeno VANISH 2 L.">
                        <input type="hidden" name="window" value="/Pages/Drugstore/drugstore.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>-->
    </body>
</html>