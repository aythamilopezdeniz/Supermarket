package StatelessFacade;

import Entities.Cart;
import Entities.Pedido;
import Entities.Users;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaUpdate;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

@Stateless
public class PedidoFacade extends AbstractFacade<Pedido> {

    @PersistenceContext(unitName = "Supermarket-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PedidoFacade() {
        super(Pedido.class);
    }
    
    public int numeroRegistro() {
        return em.createNamedQuery("Pedido.findAll").getMaxResults();
    }
    
    public boolean findExistPedido(int id) {
        List<Pedido> pedidos = em.createNamedQuery("Pedido.findById").setParameter("id", id).getResultList();
        if(!pedidos.isEmpty())return true;
        return false;
    }
    
    public List<Pedido> findPedidosCliente(Users cliente, String estado) {
        return em.createNamedQuery("Pedido.findOrderByPedido").setParameter("id", cliente.getId()).setParameter("estado", estado).getResultList();
    }
    
    public List<Pedido> findDiaPedidosCliente(String dia, int idCliente) {
        return em.createNamedQuery("Pedido.findDiaOrderByPedido").setParameter("id", idCliente).setParameter("dia", "%" + dia + "%").getResultList();
    }
    
    public List<Pedido> findHoraPedidosCliente(String hora, int idCliente) {
        return em.createNamedQuery("Pedido.findHoraOrderByPedido").setParameter("id", idCliente).setParameter("hora", "%" + hora + "%").getResultList();
    }

    public List<Pedido> findPvpPedidosCliente(double pvp, int idCliente) {
        return em.createNamedQuery("Pedido.findPvpOrderByPedido").setParameter("pvp", pvp).setParameter("id", idCliente).getResultList();
    }
    
    public Pedido obtenerUltimoPedido(int idCliente) {
        List<Pedido> pedidos = em.createNamedQuery("Pedido.findByIdClient").setParameter("id", idCliente).getResultList();
        if(pedidos.isEmpty())return null;
        return pedidos.get(pedidos.size() - 1);
    }

    public void insertPedido(Users Cliente, Cart cart, String dia, String hora, String estado) {
        int idPedido = count() + 1;
        Pedido pedido = new Pedido(idPedido);
        pedido.setUsers(Cliente);
        pedido.setCart(cart);
        pedido.setPvp(cart.getPvp());
        pedido.setDia(dia);
        pedido.setHora(hora);
        pedido.setEstado(estado);
        em.persist(pedido);
    }

    public void updatePvpPedido(int id, double pvp) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaUpdate<Pedido> criteriaUpdate = criteriaBuilder.createCriteriaUpdate(Pedido.class);
        Root<Pedido> pedido = criteriaUpdate.from(Pedido.class);
        criteriaUpdate.set("pvp", pvp);
        Predicate predicate = criteriaBuilder.equal(pedido.get("id"), id);
        criteriaUpdate.where(predicate);
        em.createQuery(criteriaUpdate).executeUpdate();
    }
}