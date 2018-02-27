package Commands;

import Model.Cart;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public abstract class FrontCommand {

    protected ServletContext context;
    protected HttpServletRequest request;
    protected HttpServletResponse response;

    public void init(ServletContext context, HttpServletRequest request, HttpServletResponse response) {
        this.context = context;
        this.request = request;
        this.response = response;
    }

    protected Cart getCart() {
        HttpSession session = request.getSession();
        Cart shoppingCart = (Cart) session.getAttribute("shoppingCart");
        if (shoppingCart == null) {
            shoppingCart = new Cart();
            session.setAttribute("shoppingCart", shoppingCart);
        }
        return shoppingCart;
    }
    
    abstract public void process() throws ServletException, IOException;
    
    

    public void forward(String target) throws ServletException, IOException {
        RequestDispatcher dispatcher = context.getRequestDispatcher(target);
        dispatcher.forward(request, response);
    }
}
