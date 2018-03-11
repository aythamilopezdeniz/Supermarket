<%@page import="DB.ArticleDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Article"%>
<%@page import="Model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Pastas</title>
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
        <% for (Article articles : (ArrayList<Article>)ArticleDB.getTypeArticle("pastas")) { %>
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
                        <input type="hidden" name="window" value="/Pages/pasta.jsp">
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
                        <input type="hidden" name="window" value="/Pages/pasta.jsp">
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
                        <input type="hidden" name="window" value="/Pages/pasta.jsp">
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
                        <input type="hidden" name="window" value="/Pages/pasta.jsp">
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
                        <input type="hidden" name="window" value="/Pages/pasta.jsp">
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
                        <input type="hidden" name="window" value="/Pages/pasta.jsp">
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
                        <input type="hidden" name="window" value="/Pages/pasta.jsp">
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
                        <input type="hidden" name="window" value="/Pages/pasta.jsp">
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
                        <input type="hidden" name="window" value="/Pages/pasta.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>-->
    </body>
</html>