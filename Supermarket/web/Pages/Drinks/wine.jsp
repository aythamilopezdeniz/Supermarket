<%@page import="DB.ArticleDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Article"%>
<%@page import="Model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Vinos</title>
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
        <% for (Article articles : (ArrayList<Article>)ArticleDB.getTypeArticle("vinos")) { %>
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
                <div class="desc">Colimoro Montepulciano</div>
                <img src="images/articulos/vinos/Colimoro-Montepulciano-escalar.jpg" alt="Colimoro Montepulciano">
                <h6>2.60 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Colimoro Montepulciano">
                        <input type="hidden" name="imageArticle" value="images/articulos/vinos/Colimoro-Montepulciano-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.60">
                        <input type="hidden" name="descriptionArticle" value=" Vino tinto producido en los viñedos que rodean la ciudad de Montepulciano, Italia. El vino se hace principalmente con uvas de la variedad Sangiovese (conocida localmente como Prugnolo) (mínimo de 70%), mezclado con Canaiolo Nero (10%-20%) y pequeñas cantidades de otras variedades locales como la Mammolo.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto2">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Colimoro Montepulciano">
                        <input type="hidden" name="imageArticle" value="images/articulos/vinos/Colimoro-Montepulciano-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.60">
                        <input type="hidden" name="descriptionArticle" value=" Vino tinto producido en los viñedos que rodean la ciudad de Montepulciano, Italia. El vino se hace principalmente con uvas de la variedad Sangiovese (conocida localmente como Prugnolo) (mínimo de 70%), mezclado con Canaiolo Nero (10%-20%) y pequeñas cantidades de otras variedades locales como la Mammolo.">
                        <input type="hidden" name="window" value="/Pages/Drinks/wine.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Romaneira</div>
                <img src="images/articulos/vinos/Romaneira-escalar.jpg" alt="Romaneira">
                <h6>3.60 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Romaneira">
                        <input type="hidden" name="imageArticle" value="images/articulos/vinos/Romaneira-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.60">
                        <input type="hidden" name="descriptionArticle" value="Con su aroma floral delicado y su finura característica y la pureza de la fruta, la Romaneira Touriga Nacional es a la vez una auténtica expresión del terroir único de la Quinta y del carácter distintivo de esta variedad de uva notable. nariz floral delicado con notas de rosas silvestres y violetas. Elegante, fresco, armonioso, con taninos sedosos en el paladar y un acabado fino largo.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto4">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Romaneira">
                        <input type="hidden" name="imageArticle" value="images/articulos/vinos/Romaneira-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.60">
                        <input type="hidden" name="descriptionArticle" value="Con su aroma floral delicado y su finura característica y la pureza de la fruta, la Romaneira Touriga Nacional es a la vez una auténtica expresión del terroir único de la Quinta y del carácter distintivo de esta variedad de uva notable. nariz floral delicado con notas de rosas silvestres y violetas. Elegante, fresco, armonioso, con taninos sedosos en el paladar y un acabado fino largo.">
                        <input type="hidden" name="window" value="/Pages/Drinks/wine.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Fernando Castilla</div>
                <img src="images/articulos/vinos/Fernando-castilla-escalar.jpg" alt="Fernando Castilla">
                <h6>2.89 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Fernando Castilla">
                        <input type="hidden" name="imageArticle" value="images/articulos/vinos/Fernando-castilla-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.44">
                        <input type="hidden" name="descriptionArticle" value="Elaborado con uvas pasificadas de la variedad que le da nombre, Pedro Ximenez es un vino increíblemente dulce que, tras tres décadas de crianza en barrica, ha desarrollado unos aromas y sabores únicos, y un color caoba intenso, muy oscuro, apreciable desde su exterior como todos los vinos de la selecta gama Antique.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto6">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Fernando Castilla">
                        <input type="hidden" name="imageArticle" value="images/articulos/vinos/Fernando-castilla-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.89">
                        <input type="hidden" name="descriptionArticle" value="Elaborado con uvas pasificadas de la variedad que le da nombre, Pedro Ximenez es un vino increíblemente dulce que, tras tres décadas de crianza en barrica, ha desarrollado unos aromas y sabores únicos, y un color caoba intenso, muy oscuro, apreciable desde su exterior como todos los vinos de la selecta gama Antique.">
                        <input type="hidden" name="window" value="/Pages/Drinks/wine.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Joel Gott</div>
                <img src="images/articulos/vinos/Joel-Gott-escalar.jpg" alt="Joel Gott">
                <h6>3.10 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Joel Gott">
                        <input type="hidden" name="imageArticle" value="images/articulos/vinos/Joel-Gott-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.10">
                        <input type="hidden" name="descriptionArticle" value="Desde nuestro comienzo en 1996, hemos seleccionado la mejor fruta de las regiones de cultivo en California, Oregon y Washington, que combinamos para crear vinos más equilibrados, limpios, complejos y elegantes. Estamos orientados a continuar ofreciendo a nuestros clientes vinos expresivos y amigables con los alimentos a excelentes precios. ¡Esperamos que lo disfrute y nos deje saber lo que piensa!">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto8">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Joel Gott">
                        <input type="hidden" name="imageArticle" value="images/articulos/vinos/Joel-Gott-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.10">
                        <input type="hidden" name="descriptionArticle" value="Desde nuestro comienzo en 1996, hemos seleccionado la mejor fruta de las regiones de cultivo en California, Oregon y Washington, que combinamos para crear vinos más equilibrados, limpios, complejos y elegantes. Estamos orientados a continuar ofreciendo a nuestros clientes vinos expresivos y amigables con los alimentos a excelentes precios. ¡Esperamos que lo disfrute y nos deje saber lo que piensa!">
                        <input type="hidden" name="window" value="/Pages/Drinks/wine.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Pago de los Capellanes</div>
                <img src="images/articulos/vinos/Pago-de-los-Capellanes-escalar.jpg" alt="Pago de los Capellanes">
                <h6>2.90 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Pago de los Capellanes">
                        <input type="hidden" name="imageArticle" value="images/articulos/vinos/Pago-de-los-Capellanes-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.90">
                        <input type="hidden" name="descriptionArticle" value="Llega la nueva añada de un habitual en nuestros rankings de vinos Más Vendidos y Mejor Valorados. Hablamos del Joven Roble de Pago de los Capellanes, el vino con mejor relación calidad/precio de la bodega. En esta nueva añada 2016 vuelve a hacer gala de su alegre carácter frutal, convirtiéndose en un tinto muy apto para la temporada estival. Su acidez refrescante y su sutil tanicidad terminan por modelarlo como el acompañante perfecto para una elegante noche de verano.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto9">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Pago de los Capellanes">
                        <input type="hidden" name="imageArticle" value="images/articulos/vinos/Pago-de-los-Capellanes-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.90">
                        <input type="hidden" name="descriptionArticle" value="Llega la nueva añada de un habitual en nuestros rankings de vinos Más Vendidos y Mejor Valorados. Hablamos del Joven Roble de Pago de los Capellanes, el vino con mejor relación calidad/precio de la bodega. En esta nueva añada 2016 vuelve a hacer gala de su alegre carácter frutal, convirtiéndose en un tinto muy apto para la temporada estival. Su acidez refrescante y su sutil tanicidad terminan por modelarlo como el acompañante perfecto para una elegante noche de verano.">
                        <input type="hidden" name="window" value="/Pages/Drinks/wine.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>-->
    </body>
</html>