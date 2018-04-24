<%@page import="DB.ArticleDB"%>
<%@page import="Entities.Descuento"%>
<%@page import="java.util.Random"%>
<%@page import="StatelessBeans.StatelessDiscount"%>
<%@page import="Timers.TimerLog"%>
<%@page import="Timers.TimerEstadisticas"%>
<%@page import="SingletonBeans.SingletonEstadisticasBean"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%
    Context c = new InitialContext();
    SingletonEstadisticasBean estadisticasBean = (SingletonEstadisticasBean) c.lookup("java:global/Supermarket/Supermarket-ejb/SingletonEstadisticasBean!SingletonBeans.SingletonEstadisticasBean");
    estadisticasBean.setAccessComponents(request.getRequestURI());
    System.out.println("Estadísticas Componentes No Logueado: " + estadisticasBean.getListComponents());
    TimerEstadisticas timerEstadisticas = (TimerEstadisticas) c.lookup("java:global/Supermarket/Supermarket-ejb/TimerEstadisticas!Timers.TimerEstadisticas");
    timerEstadisticas.setText("Comienza el Timer Estadísticas");
    TimerLog timerLog = (TimerLog) c.lookup("java:global/Supermarket/Supermarket-ejb/TimerLog!Timers.TimerLog");
    timerLog.setText("Comienza el Timer Log");
    Random rand = new Random();
    int random = rand.nextInt(3)+1;
    Descuento descuento = new Descuento(random);
    ArticleDB.setDiscount(descuento);
    StatelessDiscount statelessDiscount = (StatelessDiscount) c.lookup("java:global/Supermarket/Supermarket-ejb/StatelessDiscount!StatelessBeans.StatelessDiscount");
    if(statelessDiscount.isEstablished() == false) {
        statelessDiscount.setText("Comienza el descuento de artículos");
        statelessDiscount.setText(descuento.getDiscountArticle().get(0) + ", " + descuento.getDiscountArticle().get(1) + ", " + descuento.getDiscountArticle().get(2));
    }
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
                <li><a href="FrontServlet?command=Redirect&window=/Pages/log.jsp">Estadísticas</a></li>
                <li><a href="FrontServlet?command=Redirect&window=/Pages/signin.jsp">Registrarse</a></li>
                <li><a href="FrontServlet?command=Redirect&window=/Pages/login.jsp">Login</a></li>
                <li><a href="FrontServlet?command=Redirect&window=/Pages/shoppingCart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> Cesta</a></li>
            </ul>
        </header>