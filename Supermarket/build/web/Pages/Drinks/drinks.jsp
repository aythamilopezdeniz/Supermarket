<%@page import="DB.ArticleDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Article"%>
<%@page import="Model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Bebidas</title>
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
        <% for (Article articles : (ArrayList<Article>)ArticleDB.getTypeArticle("bebidas")) { %>
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
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
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
                        <input type="hidden" name="window" value="/Pages/Drinks/drinks.jsp">
                        <input type="hidden" name="command" value="Product">
                        <input type="submit" value="Añadir al Carro">
                    </form>
                </div>
            </div>
        </div>-->
    </body>
</html>