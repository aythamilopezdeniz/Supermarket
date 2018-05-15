<%@page import="SingletonBeans.SingletonEstadisticasBean"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%
    Context c = new InitialContext();
    SingletonEstadisticasBean estadisticasBean = (SingletonEstadisticasBean) c.lookup("java:global/Supermarket/Supermarket-ejb/SingletonEstadisticasBean!SingletonBeans.SingletonEstadisticasBean");
    estadisticasBean.setAccessComponents(request.getRequestURI());
    System.out.println("Estadísticas Componentes Logueado: " + estadisticasBean.getListComponents());
%>            
        <header class="SignIn-Login">
            <ul>
                <li><a class="title" href="/Supermarket-war/">Supermercado Torres</a></li>
                <li>
                    <form class="search" method="post" action="FrontServlet">
                        <input type="text" name="search" placeholder="Buscar producto" required="">
                        <input type="hidden" name="window" value="/Pages/search.jsp">
                        <input type="hidden" name="command" value="Search">
                        <button id="search" type="submit">Buscar</button>
                    </form>
                </li>
                <li><p><%=session.getAttribute("user")%></p></li>
                <li><a href="FrontServlet?command=Redirect&window=/Pages/profile.jsp">Editar Perfil</a></li>
                <li><a href="FrontServlet?command=InCharges&window=/Pages/inCharges.jsp">Pedidos</a></li>
                <li><a href="FrontServlet?command=Redirect&window=/Pages/log.jsp">Estadísticas</a></li>
                <li><a href="FrontServlet?command=Logout">Cerrar Sesión</a></li>
                <li><a href="FrontServlet?command=Redirect&window=/Pages/shoppingCart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> Cesta</a></li>
            </ul>
        </header>