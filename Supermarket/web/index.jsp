<%@page import="DB.ArticleDB"%>
<%@page import="Model.Article"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Supermercado Torres: Compra alimentación, ocio, hogar, moda.</title>
        <%@include file="/PageStyle/head.jsp"%>
    </head>
    <body>
        <!-- Header -->
        <%
            if (session.getAttribute("user") == null && session.getAttribute("password") == null) {
        %>
            <%@include file="/PageStyle/nonActiveSession.jsp"%>
        <% } else {%>
            <%@include file="/PageStyle/sessionActive.jsp"%>
        <% }%>

        <!-- Imágenes -->
        <%@include file="/PageStyle/images.jsp"%>
        
        <!-- Navegación -->
        <%@include file="/PageStyle/menu.jsp"%>
        
        <!-- Artículos -->
        <% for (Article articles : (ArrayList<Article>)ArticleDB.getArticles()) { %>
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
        
        <!--
        <div class="responsive">
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
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="Bebida refrescante de extractos. Con azúcares y edulcorantes. Ideal para esos momentos en los que te apetece una bebida con un sabor diferente.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto14">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Sprite 1.5L">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/sabores/sprite-1.5L-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.75">
                        <input type="hidden" name="descriptionArticle" value="Bebida refrescante de extractos. Con azúcares y edulcorantes. Ideal para esos momentos en los que te apetece una bebida con un sabor diferente.">
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Coca Cola Light</div>
                <img src="images/articulos/refrescos/light/coca-cola-light-escalar.jpg" alt="Coca Cola Light">
                <h6>1.20 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Coca cola Light">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/light/coca-cola-light-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.20">
                        <input type="hidden" name="descriptionArticle" value="Agua carbonatada, colorante E-150d, edulcorantes E-952, E-950 y aspartamo, acidulantes E-338 y E-330 y aromas naturales (incluyendo cafeína). Contiene una fuente de fenilalanina.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto16">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Coca cola Light">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/light/coca-cola-light-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.20">
                        <input type="hidden" name="descriptionArticle" value="Agua carbonatada, colorante E-150d, edulcorantes E-952, E-950 y aspartamo, acidulantes E-338 y E-330 y aromas naturales (incluyendo cafeína). Contiene una fuente de fenilalanina.">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Fanta Light</div>
                <img src="images/articulos/refrescos/light/fanta-light-escalar.jpg" alt="Fanta Light">
                <h6>1.15 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Fanta Light">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/light/fanta-light-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.15">
                        <input type="hidden" name="descriptionArticle" value="Bebida refrescante de zumo de frutas. Sin azúcares añadidos. Con edulcorantes. 

Fanta es la bebida refrescante con zumo de frutas preferida por los jóvenes de nuestro país. Joven, alegre, extrovertida y siempre asociada a un sentimiento universal: la diversión con amigos.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto17">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Fanta Light">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/light/fanta-light-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.15">
                        <input type="hidden" name="descriptionArticle" value="Bebida refrescante de zumo de frutas. Sin azúcares añadidos. Con edulcorantes. 

Fanta es la bebida refrescante con zumo de frutas preferida por los jóvenes de nuestro país. Joven, alegre, extrovertida y siempre asociada a un sentimiento universal: la diversión con amigos.">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Pepsi Light</div>
                <img src="images/articulos/refrescos/light/pepsi-Light-escalar.jpg" alt="Pepsi Light">
                <h6>1.35 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Pepsi Light">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/light/pepsi-Light-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.35">
                        <input type="hidden" name="descriptionArticle" value="Sin azúcar. Bebida refrescante aromatizada con edulcorantes. Todo el sabor de la Pepsi, el refresco carbonatado seña de identidad de PepsiCo. Desde sus humildes comienzos hace unos 100 años, Pepsi-Cola ha crecido hasta ser uno de los productos más conocidos y amados alrededor del mundo.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto18">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet?command=Product">
                        <input type="hidden" name="nameArticle" value="Pepsi Light">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/light/pepsi-Light-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.35">
                        <input type="hidden" name="descriptionArticle" value="Sin azúcar. Bebida refrescante aromatizada con edulcorantes. Todo el sabor de la Pepsi, el refresco carbonatado seña de identidad de PepsiCo. Desde sus humildes comienzos hace unos 100 años, Pepsi-Cola ha crecido hasta ser uno de los productos más conocidos y amados alrededor del mundo.">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Sprite Light</div>
                <img src="images/articulos/refrescos/light/sprite-light-escalar.jpg" alt="Sprite Light">
                <h6>1.20 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Sprite Light">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/light/sprite-light-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.20">
                        <input type="hidden" name="descriptionArticle" value="Refresco Light sin azúcar añadido. Bebida refrescante de extractos con edulcorantes. Sprite Zero es una bebida refrescante de sabor lima-limón, transparente y con gas, con el auténtico sabor de Sprite y cero calorías.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto19">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Sprite Light">
                        <input type="hidden" name="imageArticle" value="images/articulos/refrescos/light/sprite-light-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.20">
                        <input type="hidden" name="descriptionArticle" value="Refresco Light sin azúcar añadido. Bebida refrescante de extractos con edulcorantes. Sprite Zero es una bebida refrescante de sabor lima-limón, transparente y con gas, con el auténtico sabor de Sprite y cero calorías.">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Airport Mochila Azul</div>
                <img src="images/articulos/papeleria/airport-mochila-azul-escalar.jpg" alt="Airport Mochila Azul">
                <h6>10.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Airport Mochila Azul">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/airport-mochila-azul-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="10.95">
                        <input type="hidden" name="descriptionArticle" value="Para los que les gusta ir con colores llamativos, esta mochila turquesa les proporciona no solo diseño sino confort al usar.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto29">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Airport Mochila Azul">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/airport-mochila-azul-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="10.95">
                        <input type="hidden" name="descriptionArticle" value="Para los que les gusta ir con colores llamativos, esta mochila turquesa les proporciona no solo diseño sino confort al usar.">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Airport Mochila Vintage</div>
                <img src="images/articulos/papeleria/airport-mochila-vintage-escalar.jpg" alt="Airport Mochila Vintage">
                <h6>15.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Airport Mochila Vintage">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/airport-mochila-vintage-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="15.95">
                        <input type="hidden" name="descriptionArticle" value="Mochila Vintage Puma con compartimentos y espaldar acolchado para mayor comodidad al transportar, AIRPORT.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto30">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Airport Mochila Vintage">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/airport-mochila-vintage-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="15.95">
                        <input type="hidden" name="descriptionArticle" value="Mochila Vintage Puma con compartimentos y espaldar acolchado para mayor comodidad al transportar, AIRPORT.">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Bic Cristal Soft Azul</div>
                <img src="images/articulos/papeleria/bic-cristal-soft-azul-escalar.jpg" alt="Bic Cristal Soft Azul">
                <h6>9.10 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Bic Cristal Soft Azul">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/bic-cristal-soft-azul-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="9.10">
                        <input type="hidden" name="descriptionArticle" value="Duran hasta 2 veces más que un bolígrafo común.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto31">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Bic Cristal Soft Azul">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/bic-cristal-soft-azul-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="9.10">
                        <input type="hidden" name="descriptionArticle" value="Duran hasta 2 veces más que un bolígrafo común.">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Oxford Cuaderno</div>
                <img src="images/articulos/papeleria/oxford-cuaderno-escalar.jpg" alt="Oxford Cuaderno">
                <h6>3.30 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Oxford Cuaderno">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/oxford-cuaderno-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.30">
                        <input type="hidden" name="descriptionArticle" value="Cuaderno de tamaño A5, con cuadrícula de 4x4 mm, 80 hojas y tapas encuadernadas OXFORD.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto32">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Oxford Cuaderno">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/oxford-cuaderno-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.30">
                        <input type="hidden" name="descriptionArticle" value="Cuaderno de tamaño A5, con cuadrícula de 4x4 mm, 80 hojas y tapas encuadernadas OXFORD.">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Pacsa Cuaderno 3x3</div>
                <img src="images/articulos/papeleria/pacsa-cuaderno-3x3-escalar.jpg" alt="Pacsa Cuaderno 3x3">
                <h6>1.50 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Pacsa Cuaderno 3x3">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/pacsa-cuaderno-3x3-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.50">
                        <input type="hidden" name="descriptionArticle" value="Cuaderno de cuadrícula de 3x3 con margen, 80 hojas y tapa dura, PACSA.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto33">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Pacsa Cuaderno 3x3">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/pacsa-cuaderno-3x3-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="1.50">
                        <input type="hidden" name="descriptionArticle" value="Cuaderno de cuadrícula de 3x3 con margen, 80 hojas y tapa dura, PACSA.">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Pacsa Cuaderno 4x4</div>
                <img src="images/articulos/papeleria/pacsa-cuaderno-4x4-escalar.jpg" alt="Pacsa Cuaderno 4x4">
                <h6>3.10 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Pacsa Cuaderno 4x4">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/pacsa-cuaderno-4x4-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.10">
                        <input type="hidden" name="descriptionArticle" value="Dispone de tapas de polipropileno de alta resistencia y microperforado con encuadernación con espiral metálica. Las hojas de este cuaderno son de papel extrablanco.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto34">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Pacsa Cuaderno 4x4">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/pacsa-cuaderno-4x4-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.10">
                        <input type="hidden" name="descriptionArticle" value="Dispone de tapas de polipropileno de alta resistencia y microperforado con encuadernación con espiral metálica. Las hojas de este cuaderno son de papel extrablanco.">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Estuche Patrulla Canina</div>
                <img src="images/articulos/papeleria/patrulla-canina-estuche-escalar.jpg" alt="Estuche Patrulla Canina">
                <h6>5.10 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Estuche Patrulla Canina">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/patrulla-canina-estuche-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="5.10">
                        <input type="hidden" name="descriptionArticle" value="El estuche incluye: 1 portaminas, 1 bolígrafo, 4 reglas, 1 sacapuntas, 1 libro para colorear y 18 rotuladores.
Producto no recomendado para menores de 3 años.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto35">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Estuche Patrulla Canina">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/patrulla-canina-estuche-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="5.10">
                        <input type="hidden" name="descriptionArticle" value="El estuche incluye: 1 portaminas, 1 bolígrafo, 4 reglas, 1 sacapuntas, 1 libro para colorear y 18 rotuladores.
Producto no recomendado para menores de 3 años.">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Pilot Super Grip Azul</div>
                <img src="images/articulos/papeleria/pilot-super-grip-azul-escalar.jpg" alt="Pilot Super Grip Azul">
                <h6>3.10 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Pilot Super Grip Azul">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/pilot-super-grip-azul-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.10">
                        <input type="hidden" name="descriptionArticle" value="Tinta con base de aceite color azul. Estos bolígrafos al tener tinta con base de aceite, hace que escribir cueste muy poco esfuerzo, ya que se convierte en una acción muy fluida.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto36">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Pilot Super Grip Azul">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/pilot-super-grip-azul-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="3.10">
                        <input type="hidden" name="descriptionArticle" value="Tinta con base de aceite color azul. Estos bolígrafos al tener tinta con base de aceite, hace que escribir cueste muy poco esfuerzo, ya que se convierte en una acción muy fluida.">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">UniBall Eye Ub-150</div>
                <img src="images/articulos/papeleria/uni-ball-eye-ub-150-escalar.jpg" alt="UniBall Eye Ub-150">
                <h6>2.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="UniBall Eye Ub-150">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/uni-ball-eye-ub-150-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.95">
                        <input type="hidden" name="descriptionArticle" value="La tinta pigmentada de estos bolígrafos es resistente al agua y a la luz, lo que los confiere una escritura suave y constante.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto37">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="UniBall Eye Ub-150">
                        <input type="hidden" name="imageArticle" value="images/articulos/papeleria/uni-ball-eye-ub-150-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.95">
                        <input type="hidden" name="descriptionArticle" value="La tinta pigmentada de estos bolígrafos es resistente al agua y a la luz, lo que los confiere una escritura suave y constante.">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Air-Wick 2D Ambientador</div>
                <img src="images/articulos/automovil/limpieza/air-wick-2d-ambientador-escalar.jpg" alt="Air-Wick 2D Ambientador">
                <h6>9.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Air-Wick 2D Ambientador">
                        <input type="hidden" name="imageArticle" value="images/articulos/automovil/limpieza/air-wick-2d-ambientador-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="9.95">
                        <input type="hidden" name="descriptionArticle" value="El olor tiene una duración aproximada de 7 semanas.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto56">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Air-Wick 2D Ambientador">
                        <input type="hidden" name="imageArticle" value="images/articulos/automovil/limpieza/air-wick-2d-ambientador-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="9.95">
                        <input type="hidden" name="descriptionArticle" value="El olor tiene una duración aproximada de 7 semanas.">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Arbre Magique Ambientador</div>
                <img src="images/articulos/automovil/limpieza/arbre-magique-ambientador-escalar.jpg" alt="Arbre Magique Ambientador">
                <h6>5.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Arbre Magique Ambientador">
                        <input type="hidden" name="imageArticle" value="images/articulos/automovil/limpieza/arbre-magique-ambientador-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="5.95">
                        <input type="hidden" name="descriptionArticle" value="Difunde una agradable fragancia que elimina los malos olores de nuestro vehículo durante siete semanas aproximadamente.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto57">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Arbre Magique Ambientador">
                        <input type="hidden" name="imageArticle" value="images/articulos/automovil/limpieza/arbre-magique-ambientador-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="5.95">
                        <input type="hidden" name="descriptionArticle" value="Difunde una agradable fragancia que elimina los malos olores de nuestro vehículo durante siete semanas aproximadamente.">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Krafft Limpia Parabrisas</div>
                <img src="images/articulos/automovil/limpieza/krafft-limpia-parabrisas-escalar.jpg" alt="Krafft Limpia Parabrisas">
                <h6>18.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Krafft Limpia Parabrisas">
                        <input type="hidden" name="imageArticle" value="images/articulos/automovil/limpieza/krafft-limpia-parabrisas-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="18.95">
                        <input type="hidden" name="descriptionArticle" value="Listo para usar, no necesita añadir agua, siendo capaz de limpiar de forma eficaz las manchas de barro, insectos, grasa...que pueda haber en nuestro parabrisas o en nuestros faros.
Temperatura de congelación de -5 ºC.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto58">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Krafft Limpia Parabrisas">
                        <input type="hidden" name="imageArticle" value="images/articulos/automovil/limpieza/krafft-limpia-parabrisas-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="18.95">
                        <input type="hidden" name="descriptionArticle" value="Listo para usar, no necesita añadir agua, siendo capaz de limpiar de forma eficaz las manchas de barro, insectos, grasa...que pueda haber en nuestro parabrisas o en nuestros faros.
Temperatura de congelación de -5 ºC.">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>
        <div class="responsive">
            <div class="gallery">
                <div class="desc">Rolmovil Ambientador</div>
                <img src="images/articulos/automovil/limpieza/rolmovil-ambientador-escalar.jpg" alt="Rolmovil Ambientador">
                <h6>19.95 €</h6>
                <div class="desc">
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Rolmovil Ambientador">
                        <input type="hidden" name="imageArticle" value="images/articulos/automovil/limpieza/rolmovil-ambientador-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="19.95">
                        <input type="hidden" name="descriptionArticle" value="Al ser un formato XXL, la fragancia tiene una duración aproximada de 60 días.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto59">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Rolmovil Ambientador">
                        <input type="hidden" name="imageArticle" value="images/articulos/automovil/limpieza/rolmovil-ambientador-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="19.95">
                        <input type="hidden" name="descriptionArticle" value="Al ser un formato XXL, la fragancia tiene una duración aproximada de 60 días.">
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="hidden" name="command" value="Product">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="descriptionArticle" value="Yogur bifidus con sabor a limón DANONE ACTIVIA CREMOSO pack de 4 uds de 120 gr.">
                        <input type="hidden" name="window" value="/Pages/product.jsp">
                        <input type="hidden" name="idProducto" value="producto71">
                        <input type="hidden" name="command" value="SeeProduct">
                        <input class="seeProduct" type="submit" value="Ver">
                    </form>
                    <form method="post" action="FrontServlet">
                        <input type="hidden" name="nameArticle" value="Yogur Activia Limón 4 Unidades">
                        <input type="hidden" name="imageArticle" value="images/articulos/lacteos/yogur/activia-limon-4u-escalar.jpg">
                        <input type="hidden" name="pvpArticle" value="2.95">
                        <input type="hidden" name="descriptionArticle" value="Yogur bifidus con sabor a limón DANONE ACTIVIA CREMOSO pack de 4 uds de 120 gr.">
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
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
                        <input type="hidden" name="window" value="/index.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>-->
    </body>
</html>