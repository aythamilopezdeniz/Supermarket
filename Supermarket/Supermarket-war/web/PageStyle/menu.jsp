<%@page import="StatelessFacade.Subcategoria2Facade"%>
<%@page import="StatelessFacade.Subcategoria1Facade"%>
<%@page import="StatelessFacade.CategoriaFacade"%>
<%@page import="java.util.List"%>
<%@page import="Entities.Article"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="StatelessFacade.ArticleFacade"%>
<!-- Navegación -->
        <nav>
            <ul class="menu">
                <li><a href="FrontServlet?command=Redirect&window=/Pages/Drinks/drinks.jsp">Bebidas</a>
                    <ul>
                        <li><a href="FrontServlet?command=Redirect&window=/Pages/Drinks/refreshments.jsp">Refresco</a>
                            <ul>
                                <li><a href="FrontServlet?command=Redirect&window=/Pages/Drinks/Refreshments/flavor.jsp">De Sabores</a></li>
                                <li><a href="FrontServlet?command=Redirect&window=/Pages/Drinks/Refreshments/light.jsp">Deportivos</a></li>
                            </ul>
                        </li>
                        <li><a href="FrontServlet?command=Redirect&window=/Pages/Drinks/wine.jsp">Vino</a></li>
                        <li><a href="FrontServlet?command=Redirect&window=/Pages/Drinks/water.jsp">Agua</a></li>
                        <li><a href="FrontServlet?command=Redirect&window=/Pages/Drinks/juices.jsp">Zumos</a></li>
                    </ul>
                </li>
                <li><a href="FrontServlet?command=Redirect&window=/Pages/Food/food.jsp&type=alimentacion">Alimentación</a>
                    <ul>
                        <li><a href="FrontServlet?command=Redirect&window=/Pages/Food/diaryProducts.jsp">Lácteos</a></li>
                        <li><a href="FrontServlet?command=Redirect&window=/Pages/Food/pasta.jsp">Pastas</a></li>
                        <li><a href="FrontServlet?command=Redirect&window=/Pages/Food/preparations.jsp">Preparados</a></li>
                        <li><a href="FrontServlet?command=Redirect&window=/Pages/Food/frozen.jsp">Congelados</a></li>
                    </ul>
                </li>
                <li><a href="FrontServlet?command=Redirect&window=/Pages/Drugstore/drugstore.jsp">Droguería</a></li>
                <li><a href="FrontServlet?command=Redirect&window=/Pages/StationerShop/stationerShop.jsp">Papelería</a></li>
                <li><a href="FrontServlet?command=Redirect&window=/Pages/Car/car.jsp">Automóvil</a>
                    <ul>
                        <li><a href="FrontServlet?command=Redirect&window=/Pages/Car/accesories.jsp">Accesorios</a></li>
                        <li><a href="FrontServlet?command=Redirect&window=/Pages/Car/cleaning.jsp">Limpieza</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <%  CategoriaFacade categoriaFacade = (CategoriaFacade) session.getAttribute("categoriaFacade");
            Subcategoria1Facade subcategoria1Facade = (Subcategoria1Facade) session.getAttribute("subCategoria1Facade");
            Subcategoria2Facade subcategoria2Facade = (Subcategoria2Facade) session.getAttribute("subCategoria2Facade");
            if(categoriaFacade == null) { 
                categoriaFacade = InitialContext.doLookup("java:global/Supermarket/Supermarket-ejb/CategoriaFacade!StatelessFacade.CategoriaFacade");
                session.setAttribute("categoriaFacade", categoriaFacade);
            }
            if(subcategoria1Facade == null) {
                subcategoria1Facade = InitialContext.doLookup("java:global/Supermarket/Supermarket-ejb/Subcategoria1Facade!StatelessFacade.Subcategoria1Facade");
                session.setAttribute("subcategoria1Facade", subcategoria1Facade);
            }
            if(subcategoria2Facade == null) {
                subcategoria2Facade = InitialContext.doLookup("java:global/Supermarket/Supermarket-ejb/Subcategoria2Facade!StatelessFacade.Subcategoria2Facade");
                session.setAttribute("subcategoria2Facade", subcategoria2Facade);
            }
        %>