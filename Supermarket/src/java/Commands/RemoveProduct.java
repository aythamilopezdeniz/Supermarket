package Commands;

import Model.Article;
import Model.Cart;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class RemoveProduct extends FrontCommand {

    @Override
    public void process() throws ServletException, IOException {
        HttpSession session = request.getSession();
        removeArticle(session);
        forward(request.getParameter("window"));
    }

    private void removeArticle(HttpSession session) {
        Cart shoppingCart = getCart();
        Article article = shoppingCart.getArticle(request.getParameter("nameArticle"));
        if(!shoppingCart.isEmpty()) {
            if (article.getCantidad() > 0) {
                shoppingCart.removeArticle(article, Integer.parseInt(request.getParameter("idCart")));
                if (article.getCantidad() == 0)
                    shoppingCart.removeArticle(article, Integer.parseInt(request.getParameter("idCart")));
            }
        }
    }
}