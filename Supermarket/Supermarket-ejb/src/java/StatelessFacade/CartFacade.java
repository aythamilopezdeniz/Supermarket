package StatelessFacade;

import Entities.Cart;
import Entities.Users;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaUpdate;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

@Stateless
public class CartFacade extends AbstractFacade<Cart> {

    @PersistenceContext(unitName = "Supermarket-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CartFacade() {
        super(Cart.class);
    }
    
    public int findLastItem() {
        List<Cart> carts = em.createNamedQuery("Cart.findAll").getResultList();
        Cart lastCart = (Cart) em.createNamedQuery("Cart.findById").setParameter("id", carts.get(carts.size() - 1).getId()).getSingleResult();
        return lastCart.getId();
    }
    
    public boolean existOpenCart(int idCliente) {
        List<Cart> cart = em.createNamedQuery("Cart.findByUsers").setParameter("users", idCliente).setParameter("tipo", 0).getResultList();
        if(!cart.isEmpty())return true;
        return false;
    }

    public Cart findOpenCart(int idUsers) {
        List<Cart> carts = em.createNamedQuery("Cart.findByUsers").setParameter("users", idUsers).setParameter("tipo", 0).getResultList();
        if(carts.isEmpty())
            return null;
        return carts.get(0);
    }

    public List<Cart> findOpen(Integer idUsers) {
        return em.createNamedQuery("Cart.findByUsers").setParameter("users", idUsers).setParameter("tipo", 0).getResultList();
    }
    
    public void insertNewCart(Users client) {
        String query = "INSERT INTO Cart (id, Users, pvp, tipo) VALUES (?, ?, ?, ?)";
        Query q = em.createNativeQuery(query);
        q.setParameter(1, findLastItem() + 1);
        q.setParameter(2, client.getId());
        q.setParameter(3, 0);
        q.setParameter(4, 0);
        q.executeUpdate();
    }
    
    public void updatePvpCart(int idCart, double pvp) {
        em.createNamedQuery("Cart.updatePvp").setParameter("id", idCart).setParameter("pvp", pvp).executeUpdate();
    }

    public void closeCartAPI(int tipo, Cart cart) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaUpdate<Cart> criteriaUpdate = criteriaBuilder.createCriteriaUpdate(Cart.class);
        Root<Cart> shoppingCart = criteriaUpdate.from(Cart.class);
        criteriaUpdate.set("tipo", tipo);
        Predicate predicate = criteriaBuilder.equal(shoppingCart.get("id"), cart.getId());
        criteriaUpdate.where(predicate);
        em.createQuery(criteriaUpdate).executeUpdate();
    }
}