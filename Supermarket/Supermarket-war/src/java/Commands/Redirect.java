package Commands;

import Entities.Article;
import StatelessFacade.ArticleFacade;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class Redirect extends FrontCommand {

    @Override
    public void process() throws ServletException, IOException {
        searchArticles(request);
        forward(request.getParameter("window"));
    }

    private void searchArticles(HttpServletRequest request) {
        HttpSession session = request.getSession();
        ArticleFacade articleFacade = (ArticleFacade) session.getAttribute("articleFacade");
        if(request.getParameter("type") != null) {
            List<Article> typeArticles = articleFacade.findTypesArticles(request.getParameter("type"));
            request.setAttribute("typeArticles", typeArticles);
        }
        if(request.getParameter("subtype1") != null) {
            List<Article> typeArticles = articleFacade.findSubTypes1Articles(request.getParameter("subtype1"));
            request.setAttribute("type1Articles", typeArticles);
        }
        if(request.getParameter("subtype2") != null) {
            List<Article> typeArticles = articleFacade.findSubTypes2Articles(request.getParameter("subtype2"));
            request.setAttribute("type2Articles", typeArticles);
        }
    }
}