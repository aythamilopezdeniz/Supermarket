package StatelessFacade;

import Entities.Article;
import Entities.Categoria;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class CategoriaFacade extends AbstractFacade<Categoria> {

    @PersistenceContext(unitName = "Supermarket-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CategoriaFacade() {
        super(Categoria.class);
    }
    
    public List<Article> findArticulos(String nombre) {
        return em.createNamedQuery("Categoria.findArticulos").setParameter("nombre", nombre).getResultList();
    }
}