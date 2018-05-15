package Commands;

import StatelessFacade.CartFacade;
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

    protected CartFacade getCart() {
        HttpSession session = request.getSession();
        CartFacade cartFacade = (CartFacade) session.getAttribute("cartFacade");
        if (cartFacade == null) {
            try {
                cartFacade = InitialContext.doLookup("java:global/Supermarket/Supermarket-ejb/CartFacade!StatelessFacade.CartFacade");
            } catch (NamingException ex) {}
            session.setAttribute("cartFacade", cartFacade);
        }
        return cartFacade;
    }
    
    abstract public void process() throws ServletException, IOException;
    
    

    public void forward(String target) throws ServletException, IOException {
        RequestDispatcher dispatcher = context.getRequestDispatcher(target);
        dispatcher.forward(request, response);
    }
}
