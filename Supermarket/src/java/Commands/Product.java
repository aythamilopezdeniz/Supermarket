package Commands;

import Model.Article;
import Model.Cart;
import java.io.IOException;
import javax.servlet.ServletException;

public class Product extends FrontCommand {

    @Override
    public void process() throws ServletException, IOException {
        Cart shoppingCart = getCart();
        shoppingCart.addArticle(new Article(request.getParameter("nameArticle"),
                request.getParameter("imageArticle"),
                request.getParameter("pvpArticle"), 
                request.getParameter("type"),
                request.getParameter("subtype1"),
                request.getParameter("subtype2"),
                request.getParameter("descriptionArticle")));
        forward(request.getParameter("window"));
    }
}