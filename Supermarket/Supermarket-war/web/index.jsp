<%@include file="/PageStyle/imports.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Supermercado Torres: Compra alimentación, ocio, hogar, moda.</title>
        <%@include file="/PageStyle/head.jsp"%>
    </head>
    <body>
        <!-- Header -->
        <%@include file="/PageStyle/navbar.jsp"%>

        <!-- Imágenes -->
        <%@include file="/PageStyle/images.jsp"%>

        <!-- Navegación -->
        <%@include file="/PageStyle/menu.jsp"%>
        
        <!-- Paginación -->
        <%@include file="/PageStyle/pagination.jsp"%>

        <!-- Artículos -->
        <div class="container">
        <%  ArticleFacade articleFacade = (ArticleFacade) session.getAttribute("articleFacade");
            List<Article> listArticles = null;
            if(articleFacade == null) {
                articleFacade = InitialContext.doLookup("java:global/Supermarket/Supermarket-ejb/ArticleFacade!StatelessFacade.ArticleFacade");
                listArticles = articleFacade.findRange(new int[]{1,12});
                session.setAttribute("articleFacade", articleFacade);
                session.setAttribute("listArticles", listArticles);
                session.setAttribute("pagina", 1);
            }
            listArticles = (List<Article>) session.getAttribute("listArticles");
            for (Article articles : listArticles) {%>
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
                                    <input type="hidden" name="window" value="/index.jsp">
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

        <!-- Paginación -->
        <%@include file="/PageStyle/pagination.jsp"%>

        <!-- Footer -->
        <%@include file="/PageStyle/footer.jsp"%>
    </body>
</html>