package StatelessFacade;

import Entities.Article;
import Entities.Subcategoria2;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class Subcategoria2Facade extends AbstractFacade<Subcategoria2> {

    @PersistenceContext(unitName = "Supermarket-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public Subcategoria2Facade() {
        super(Subcategoria2.class);
    }

    public List<Article> findArticulos(String nombre) {
        return em.createNamedQuery("Subcategoria2.findArticulos").setParameter("nombre", nombre).getResultList();
    }
}