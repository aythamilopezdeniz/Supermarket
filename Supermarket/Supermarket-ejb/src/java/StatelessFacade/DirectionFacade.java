package StatelessFacade;

import Entities.Direction;
import Entities.Pedido;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class DirectionFacade extends AbstractFacade<Direction> {

    @PersistenceContext(unitName = "Supermarket-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DirectionFacade() {
        super(Direction.class);
    }

    public boolean findExistDirection(Integer idClient) {
        List<Direction> direction = em.createNamedQuery("Direction.findByUsers").setParameter("users", idClient).getResultList();
        if(direction.isEmpty()) return false;
        return true;
    }

    public void insertDirectionLocal(int idClient, Pedido pedido, String nombre, String apellidos, String direccion) {
        Direction direction = new Direction();
        direction.setUsers(idClient);
        direction.setPedido(pedido);
        direction.setNombre(nombre);
        direction.setApellidos(apellidos);
        direction.setDireccion(direccion);
        em.persist(direction);
    }

    public void insertDirectionDomicilio(int idClient, Pedido pedido, String nombre, String apellidos, String direccion, int codigoPostal) {
        Direction direction = new Direction(idClient, nombre, apellidos, direccion);
        direction.setCodigoPostal(codigoPostal);
        em.persist(direction);
    }

    public void updateDirectionLocal(int idCliente, String nombre, String apellidos, String direccion) {
        em.createNamedQuery("Direction.updateLocal").setParameter("idCliente", idCliente).setParameter("direccion", direccion).setParameter("apellidos", apellidos).setParameter("nombre", nombre).executeUpdate();
    }

    public void updateDirectionDomicilio(int idCliente, String nombre, String apellidos, String direccion, int codigoPostal) {
        em.createNamedQuery("Direction.updateDomicilio").setParameter("idCliente", idCliente).setParameter("codigoPostal", codigoPostal).setParameter("direccion", direccion).setParameter("apellidos", apellidos).setParameter("nombre", nombre).executeUpdate();
    }
}