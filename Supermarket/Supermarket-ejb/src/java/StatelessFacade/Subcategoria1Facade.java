package StatelessFacade;

import Entities.Article;
import Entities.Subcategoria1;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class Subcategoria1Facade extends AbstractFacade<Subcategoria1> {

    @PersistenceContext(unitName = "Supermarket-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public Subcategoria1Facade() {
        super(Subcategoria1.class);
    }

    public List<Article> findArticulos(String nombre) {
        return em.createNamedQuery("Subcategoria1.findArticulos").setParameter("nombre", nombre).getResultList();
    }
}