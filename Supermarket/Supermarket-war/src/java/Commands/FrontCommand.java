package Commands;

import StatefulBeans.StatefulCart;
import java.io.IOException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
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

    protected StatefulCart getCart() {
        HttpSession session = request.getSession();
        StatefulCart shoppingCart = (StatefulCart) session.getAttribute("shoppingCart");
        if (shoppingCart == null) {
            try {
                shoppingCart = InitialContext.doLookup("java:global/Supermarket/Supermarket-ejb/StatefulCart!StatefulBeans.StatefulCart");
            } catch (NamingException ex) {}
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
