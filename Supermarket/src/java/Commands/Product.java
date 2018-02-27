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
                request.getParameter("pvpArticle")));
        forward(request.getParameter("window"));
    }
}