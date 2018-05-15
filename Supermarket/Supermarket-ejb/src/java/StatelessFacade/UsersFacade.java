package StatelessFacade;

import Entities.Users;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaDelete;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.CriteriaUpdate;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

@Stateless
public class UsersFacade extends AbstractFacade<Users> {

    @PersistenceContext(unitName = "Supermarket-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsersFacade() {
        super(Users.class);
    }
    
    public Users getUserAPI(String user, String password) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<Users> criteriaQuery = criteriaBuilder.createQuery(Users.class);
        Root<Users> users = criteriaQuery.from(Users.class);
        criteriaQuery.select(users);
        Predicate condicion = criteriaBuilder.and(criteriaBuilder.equal(users.get("nombre"), user), criteriaBuilder.equal(users.get("password"), password));
        criteriaQuery.where(condicion);
        return em.createQuery(criteriaQuery).getSingleResult();
    }
    
    public boolean existUserProfile(String user, String email) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<Users> criteriaQuery = criteriaBuilder.createQuery(Users.class);
        Root<Users> users = criteriaQuery.from(Users.class);
        criteriaQuery.select(users);
        Predicate condicion = criteriaBuilder.and(criteriaBuilder.equal(users.get("usuario"), user), criteriaBuilder.equal(users.get("email"), email));
        criteriaQuery.where(condicion);
        List<Users> clients = em.createQuery(criteriaQuery).getResultList();
        return !clients.isEmpty();
    }
    
    public int findLastItem() {
        List<Users> users = em.createNamedQuery("Users.findAll").getResultList();
        Users lastUser = (Users) em.createNamedQuery("Users.findById").setParameter("id", users.get(users.size() - 1).getId()).getSingleResult();
        return lastUser.getId();
    }

    public void insertUserProfile(String nombre, String apellidos, Date fecha, String user, String email, String password, String cliente) {
        String query = "INSERT INTO Users VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        Query q = em.createNativeQuery(query);
        q.setParameter(1, findLastItem() + 1);
        q.setParameter(2, nombre);
        q.setParameter(3, apellidos);
        q.setParameter(4, fecha);
        q.setParameter(5, user);
        q.setParameter(6, email);
        q.setParameter(7, password);
        q.setParameter(8, cliente);
        q.executeUpdate();
    }
    
    public void updateUserProfile(int idClient, String nombre, String apellidos, String fecha, String user, String email, String password) {
        try {
            CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
            CriteriaUpdate<Users> criteriaUpdate = criteriaBuilder.createCriteriaUpdate(Users.class);
            Root<Users> users = criteriaUpdate.from(Users.class);
            criteriaUpdate.set("nombre", nombre);
            criteriaUpdate.set("apellidos", apellidos);
            criteriaUpdate.set("fecha", new SimpleDateFormat("yyyy-MM-dd").parse(fecha));
            criteriaUpdate.set("usuario", user);
            criteriaUpdate.set("email", email);
            criteriaUpdate.set("password", password);
            Predicate predicate = criteriaBuilder.equal(users.get("id"), idClient);
            criteriaUpdate.where(predicate);
            em.createQuery(criteriaUpdate).executeUpdate();
        } catch (ParseException ex) {}
    }
    
    public void deleteUserProfile(int idClient) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaDelete<Users> criteriaDelete = criteriaBuilder.createCriteriaDelete(Users.class);
        Root<Users> users = criteriaDelete.from(Users.class);
        Predicate predicate = criteriaBuilder.equal(users.get("id"), idClient);
        criteriaDelete.where(predicate);
        em.createQuery(criteriaDelete).executeUpdate();
    }
}