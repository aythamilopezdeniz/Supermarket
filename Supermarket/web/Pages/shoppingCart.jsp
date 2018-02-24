<%@page import="Model.Article"%>
<%@page import="Model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Shopping Cart</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link type="text/css" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
        <!--<link id="bootstrap-css" type="text/css" rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">-->
        <link type="text/css" rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <!-- Header -->
        <% if(session.getAttribute("user")==null){ %>
        <header class="SignIn-Login">
            <ul>
                <li><a class="title" href="index.jsp">Supermercado Torres</a></li>
                <li>
                    <form>
                        <input type="text" name="search" placeholder="Buscar producto" required="">
                        <button type="submit">Buscar</button>
                    </form>
                </li>
                <li><a href="FrontServlet?command=SignIn">Registrarse</a></li>
                <li><a href="FrontServlet?command=Login">Login</a></li>
                <li><a href="FrontServlet?command=ShoppingCart"><span class="glyphicon glyphicon-shopping-cart"></span> Cesta</a></li>
            </ul>
        </header>
        <% } else { %>
        <header class="SignIn-Login">
            <ul>
                <li><a class="title" href="index.jsp">Supermercado Torres</a></li>
                <li>
                    <form>
                        <input type="text" name="search" placeholder="Buscar producto" required="">
                        <button type="submit">Buscar</button>
                    </form>
                </li>
                <li><p><%=session.getAttribute("user")%></p></li>
                <li><a href="FrontServlet?command=Logout">Cerrar Sesión</a></li>
                <li><a href="FrontServlet?command=ShoppingCart"><span class="glyphicon glyphicon-shopping-cart"></span> Cesta</a></li>
            </ul>
        </header>
        <%
                if (!session.isNew()) {
                    Cart shoppingCart = (Cart) session.getAttribute("shoppingCart");
                    if (shoppingCart != null) {
                        if (!shoppingCart.isEmpty()) {
                            /*out.println(shoppingCart.getArticle().getNombre());
                            out.println(shoppingCart.getArticle().getImage());
                            out.println(shoppingCart.getArticle().getPvp());
                            out.println(shoppingCart.getArticle().getCantidad());*/
                            %>
                            <div class="container">
                                <table id="cart" class="table table-hover table-condensed">
                                    <thead>
                                        <tr>
                                            <th style="width:50%">Producto</th>
                                            <th style="width:10%">Precio</th>
                                            <th style="width:8%">Cantidad</th>
                                            <th style="width:22%" class="text-center">Subtotal</th>
                                            <th style="width:10%"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr><% for (Article article : shoppingCart.getCart()) {%>
                                            <td data-th="Product">
                                                <div class="row">
                                                    <div class="col-sm-2 hidden-xs"><img src="<%=article.getImage()%>" alt="..." class="img-responsive"/></div>
                                                    <div class="col-sm-10">
                                                        <h4 class="nomargin"><%=article.getNombre()%></h4>
                                                        <p>Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet.</p>
                                                    </div>
                                                </div>
                                            </td>
                                            <td data-th="Price">
                                                <%=
                                                    article.getPvp()+" €"
                                                %></td>
                                            <td data-th="Quantity"><%=article.getCantidad()%>
                                                <!--<input type="number" class="form-control text-center" value="1">-->
                                            </td>
                                            <td data-th="Subtotal" class="text-center"><%=(article.calculatePrice(article.getPvp(), article.getCantidad()))%></td>
                                            <td class="actions" data-th="">
                                                <button class="btn btn-info btn-sm"><i class="fa fa-refresh"></i></button>
                                                <button class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>								
                                            </td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                    <tfoot>
                                        <tr class="visible-xs">
                                            <td class="text-center"><strong>Total </strong></td>
                                        </tr>
                                        <tr>
                                            <td><a href="#" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
                                            <td colspan="2" class="hidden-xs"></td>
                                            <td class="hidden-xs text-center"><strong>Total </strong><%=shoppingCart.calculatePriceCart()+" €"%></td>
                                            <td><a href="#" class="btn btn-success btn-block">Checkout <i class="fa fa-angle-right"></i></a></td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <%
                        }
                    }
                }
            }
            //Article article = shoppingCart.getArticle();
            /*out.println(article.getNombre());
            out.println(article.getImage());
            out.println(article.getPvp());
            out.println(article.getCantidad());*/
        %>
    </body>
</html>