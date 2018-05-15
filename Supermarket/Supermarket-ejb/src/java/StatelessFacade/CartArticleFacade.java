package StatelessFacade;

import Entities.Article;
import Entities.Cart;
import Entities.CartArticle;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class CartArticleFacade extends AbstractFacade<CartArticle> {

    @PersistenceContext(unitName = "Supermarket-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CartArticleFacade() {
        super(CartArticle.class);
    }
    
    public boolean existCartArticle(int idCart, int idArticle) {
        List<CartArticle> cartArticle = null;
        cartArticle = em.createNamedQuery("CartArticle.findByArticle").setParameter("cart", idCart).setParameter("article", idArticle).getResultList();
        return cartArticle.isEmpty();
    }

    public CartArticle obtenerArticle(int idCart, int idArticle) {
        return (CartArticle) em.createNamedQuery("CartArticle.findByArticle").setParameter("cart", idCart).setParameter("article", idArticle).getSingleResult();
    }

    public List<CartArticle> obtenerCartArticle(int idCart, int idArticle) {
        List<CartArticle> cart = em.createNamedQuery("CartArticle.findByArticle").setParameter("cart", idCart).setParameter("article", idArticle).getResultList();
        return cart;
    }
    
    public List<CartArticle> obtenerCarrito(int idCart) {
        return em.createNamedQuery("CartArticle.findByCart").setParameter("cart", idCart).getResultList();
    }
    
    public int findLastIdItem() {
        List<CartArticle> cartArticles = em.createNamedQuery("CartArticle.findAll").getResultList();
        if(!cartArticles.isEmpty()) return cartArticles.get(cartArticles.size() - 1).getId();
        return 0;
    }
    
    public void insertCartArticle(Cart cart, Article article) {
        String query = "INSERT INTO Cart_Article VALUES(?,?,?,?,?)";
        Query q = em.createNativeQuery(query);
        q.setParameter(1, findLastIdItem() + 1);
        q.setParameter(2, cart.getId());
        q.setParameter(3, article.getId());
        q.setParameter(4, article.getPvp());
        q.setParameter(5, 1);
        q.executeUpdate();
    }

    public void updateIncrementCartArticle(CartArticle cart, Article article) {
        em.createNamedQuery("CartArticle.updateArticle").setParameter("article", article.getId()).setParameter("cart", cart.getCart().getId()).setParameter("valor2", roundNumber(cart.getPvp() + article.getPvp())).setParameter("valor1", cart.getCantidad() + 1).executeUpdate();
        /*Otra forma*/
//        Query q = em.createQuery("UPDATE CartArticle c SET c.cantidad = :valor1, c.pvp = :valor2 WHERE c.cart = :cart AND c.article.id = :article");
//        q.setParameter("article", article.getId());
//        q.setParameter("cart", cart.getCart());
//        q.setParameter("valor2", cart.getPvp() + article.getPvp());
//        q.setParameter("valor1", cart.getCantidad() + 1);
//        q.executeUpdate();
    }

    public void updateDecrementCartArticle(CartArticle cart, Article article) {
        em.createNamedQuery("CartArticle.updateArticle").setParameter("article", article.getId()).setParameter("cart", cart.getCart().getId()).setParameter("valor2", roundNumber(cart.getPvp() - article.getPvp())).setParameter("valor1", cart.getCantidad() - 1).executeUpdate();
        /*Otra forma*/
//        Query q = em.createQuery("UPDATE CartArticle c SET c.cantidad = :valor1, c.pvp = :valor2 WHERE c.cart = :cart AND c.article.id = :article");
//        q.setParameter("article", article.getId());
//        q.setParameter("cart", cart.getCart());
//        q.setParameter("valor2", cart.getPvp() + article.getPvp());
//        q.setParameter("valor1", cart.getCantidad() + 1);
//        q.executeUpdate();
    }
    
    public void deleteCartArticle(CartArticle cart, Article article) {
        em.createNamedQuery("CartArticle.deleteArticle").setParameter("article", article.getId()).setParameter("cart", cart.getCart().getId()).executeUpdate();
    }

    private double roundNumber(Double number) {
        return Math.round(number * 100.0) / 100.0;
    }
}