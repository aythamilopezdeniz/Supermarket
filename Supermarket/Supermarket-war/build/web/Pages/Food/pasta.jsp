<%@include file="/PageStyle/imports.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Pastas</title>
        <%@include file="/PageStyle/head.jsp"%>
    </head>
    <body>
        <!-- Header -->
        <%@include file="/PageStyle/navbar.jsp"%>
        
        <!-- Navegación -->
        <%@include file="/PageStyle/menu.jsp"%>
        
        <!-- Artículos -->
        <div class="producto">
            <div class="container">
                <%  List<Article> pasta = subcategoria1Facade.findArticulos("pastas");
                    for (Article articles : pasta) {%>
                    <div class="responsive">
                        <div class="gallery">
                            <div class="desc"><%=articles.getNombre()%></div>
                            <img src="<%=articles.getImagen()%>" alt="<%=articles.getNombre()%>">
                            <h6><%=articles.getPvp()%> €</h6>
                            <div class="desc">
                                <form method="post" action="FrontServlet">
                                    <input type="hidden" name="nameArticle" value="<%=articles.getNombre()%>">
                                    <input type="hidden" name="imageArticle" value="<%=articles.getImagen()%>">
                                    <input type="hidden" name="pvpArticle" value="<%=articles.getPvp()%>">
                                    <input type="hidden" name="descriptionArticle" value="<%=articles.getDescription()%>">
                                    <input type="hidden" name="window" value="/Pages/product.jsp">
                                    <input type="hidden" name="idProducto" value="<%=articles.getId()%>">
                                    <input type="hidden" name="command" value="SeeProduct">
                                    <button id="seeProduct" type="submit" class="btn btn-primary">Ver</button>
                                </form>
                                <%if (session.getAttribute("user") != null && session.getAttribute("password") != null) {%>
                                    <form method="post" action="FrontServlet">
                                        <input type="hidden" name="nameArticle" value="<%=articles.getNombre()%>">
                                        <input type="hidden" name="imageArticle" value="<%=articles.getImagen()%>">
                                        <input type="hidden" name="pvpArticle" value="<%=articles.getPvp()%>">
                                        <input type="hidden" name="type" value="<%=articles.getTipo()%>">
                                        <input type="hidden" name="subtype1" value="<%=articles.getSubtipo1()%>">
                                        <input type="hidden" name="subtype2" value="<%=articles.getSubtipo2()%>">
                                        <input type="hidden" name="descriptionArticle" value="<%=articles.getDescription()%>">
                                        <input type="hidden" name="window" value="/Pages/Food/pasta.jsp">
                                        <input type="hidden" name="idProducto" value="<%=articles.getId()%>">
                                        <input type="hidden" name="command" value="AddProduct">
                                        <button type="submit" class="btn btn-primary">Añadir</button>
                                    </form>
                                <%}%>
                            </div>
                        </div>
                    </div>
                <%}%>
            </div>
        </div>

        <!-- Footer -->
        <%@include file="/PageStyle/footer.jsp"%>
    </body>
</html>