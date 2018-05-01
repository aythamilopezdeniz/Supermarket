package StatelessFacade;

import Entities.Article;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class ArticleFacade extends AbstractFacade<Article> {

    @PersistenceContext(unitName = "Supermarket-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ArticleFacade() {
        super(Article.class);
    }
    
    public List<Article> findTypesArticles(String type) {
        return em.createNamedQuery("Article.findByTipo").setParameter("tipo", type).getResultList();
    }
    
    public List<Article> findSubTypes1Articles(String subtype) {
        return em.createNamedQuery("Article.findBySubtipo1").setParameter("subtipo1", subtype).getResultList();
    }
    
    public List<Article> findSubTypes2Articles(String subtype) {
        return em.createNamedQuery("Article.findBySubtipo2").setParameter("subtipo2", subtype).getResultList();
    }
    
    public List<Article> findArticle(String name) {
        List<Article> result = em.createNamedQuery("Article.findByPalabra").setParameter("nombre", "%" + name + "%").getResultList();
        if(result.isEmpty())
            result = em.createNamedQuery("Article.findByType").setParameter("tipo", "%" + name + "%").getResultList();
        if(result.isEmpty())
            result = em.createNamedQuery("Article.findBySubtype1").setParameter("subtipo1", "%" + name + "%").getResultList();
        if(result.isEmpty())
            result = em.createNamedQuery("Article.findBySubtype2").setParameter("subtipo2", "%" + name + "%").getResultList();
        return result;
    }
    
    public List<Article> findIDArticle(int id) {
        return em.createNamedQuery("Article.findById").setParameter("id", id).getResultList();
    }
}