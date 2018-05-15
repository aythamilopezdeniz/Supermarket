package StatelessFacade;

import Entities.CreditCard;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaUpdate;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

@Stateless
public class CreditCardFacade extends AbstractFacade<CreditCard> {

    @PersistenceContext(unitName = "Supermarket-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CreditCardFacade() {
        super(CreditCard.class);
    }
    
    public List<CreditCard> findCreditId(int id) {
        return em.createNamedQuery("CreditCard.findByUsers").setParameter("users", id).getResultList();
    }
    
    public boolean existCreditCard(int idClient) {
        List<CreditCard> creditCard = em.createNamedQuery("CreditCard.exist").setParameter("users", idClient).getResultList();
        if(creditCard.isEmpty())return false;
        return true;
    }

    public void insertCreditCart(int idCliente, int number, Date fecha) {
        CreditCard creditCard = new CreditCard(idCliente, number, fecha);
        em.persist(creditCard);
    }

    public void updateCreditCardNumber(int id, String number, Date fecha) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaUpdate<CreditCard> criteriaUpdate = criteriaBuilder.createCriteriaUpdate(CreditCard.class);
        Root<CreditCard> creditCart = criteriaUpdate.from(CreditCard.class);
        criteriaUpdate.set("number", number);
        criteriaUpdate.set("fechaCaducidad", fecha);
        Predicate predicate = criteriaBuilder.equal(creditCart.get("users"), id);
        criteriaUpdate.where(predicate);
        em.createQuery(criteriaUpdate).executeUpdate();
    }
}