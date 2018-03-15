<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Página Errónea</title>
        <%@include file="/PageStyle/head.jsp"%>
    </head>
    <body>
        <!-- Header -->
        <% if(session.getAttribute("user")==null){ %>
            <%@include file="/PageStyle/nonActiveSession.jsp"%>
        <% } else { %>
            <%@include file="/PageStyle/sessionActive.jsp"%>
        <% } %>
        
        <!-- Página Errónea -->
        <h1>404 Error Page</h1>
        <!--<p class="zoom-area"><b>CSS</b> animations to make a cool 404 page. </p>-->
        <section class="error-container">
            <span><span>4</span></span>
            <span>0</span>
            <span><span>4</span></span>
        </section>
        <div class="link-container">
            <a target="_blank" href="index.jsp" class="more-link">Visite la página original</a>
        </div>

        <!-- Footer -->
        <%@include file="/PageStyle/footer.jsp"%>
    </body>
</html>