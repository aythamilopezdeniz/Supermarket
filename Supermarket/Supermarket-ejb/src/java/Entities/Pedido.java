package Entities;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@Table(name = "PEDIDO")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Pedido.findAll", query = "SELECT p FROM Pedido p")
    , @NamedQuery(name = "Pedido.findById", query = "SELECT p FROM Pedido p WHERE p.id = :id")
    , @NamedQuery(name = "Pedido.findByPvp", query = "SELECT p FROM Pedido p WHERE p.pvp = :pvp")
    , @NamedQuery(name = "Pedido.findByDia", query = "SELECT p FROM Pedido p WHERE p.dia = :dia")
    , @NamedQuery(name = "Pedido.findByHora", query = "SELECT p FROM Pedido p WHERE p.hora = :hora")
    , @NamedQuery(name = "Pedido.findByEstado", query = "SELECT p FROM Pedido p WHERE p.estado = :estado")
    , @NamedQuery(name = "Pedido.findByIdClient", query = "SELECT p FROM Pedido p WHERE p.users.id = :id")
    , @NamedQuery(name = "Pedido.findIdOrderBy", query = "SELECT p FROM Pedido p WHERE p.id = :id")
    , @NamedQuery(name = "Pedido.findOrderByPedido", query = "SELECT p FROM Pedido p WHERE p.estado LIKE :estado AND p.users.id = :id ORDER BY p.id")
    , @NamedQuery(name = "Pedido.findDiaOrderByPedido", query = "SELECT p FROM Pedido p WHERE p.dia LIKE :dia AND p.users.id = :id ORDER BY p.id")
    , @NamedQuery(name = "Pedido.findHoraOrderByPedido", query = "SELECT p FROM Pedido p WHERE p.hora LIKE :hora AND p.users.id = :id ORDER BY p.id")
    , @NamedQuery(name = "Pedido.findPvpOrderByPedido", query = "SELECT p FROM Pedido p WHERE p.pvp >= :pvp AND p.users.id = :id ORDER BY p.pvp ASC")
})
public class Pedido implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "PVP")
    private double pvp;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "DIA")
    private String dia;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "HORA")
    private String hora;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "ESTADO")
    private String estado;
    @JoinColumn(name = "CART", referencedColumnName = "ID")
    @OneToOne(optional = false)
    private Cart cart;
    @JoinColumn(name = "USERS", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Users users;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "pedido")
    private Collection<Direction> directionCollection;

    public Pedido() {
    }

    public Pedido(Integer id) {
        this.id = id;
    }

    public Pedido(Integer id, double pvp, String dia, String hora, String estado) {
        this.id = id;
        this.pvp = pvp;
        this.dia = dia;
        this.hora = hora;
        this.estado = estado;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public double getPvp() {
        return pvp;
    }

    public void setPvp(double pvp) {
        this.pvp = pvp;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    @XmlTransient
    public Collection<Direction> getDirectionCollection() {
        return directionCollection;
    }

    public void setDirectionCollection(Collection<Direction> directionCollection) {
        this.directionCollection = directionCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pedido)) {
            return false;
        }
        Pedido other = (Pedido) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entities.Pedido[ id=" + id + " ]";
    }
}