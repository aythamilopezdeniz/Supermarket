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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@Table(name = "CART")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cart.findAll", query = "SELECT c FROM Cart c")
    , @NamedQuery(name = "Cart.findById", query = "SELECT c FROM Cart c WHERE c.id = :id")
    , @NamedQuery(name = "Cart.findByPvp", query = "SELECT c FROM Cart c WHERE c.pvp = :pvp")
    , @NamedQuery(name = "Cart.findByUsers", query = "SELECT c FROM Cart c WHERE c.users.id = :users AND c.tipo = :tipo")
    , @NamedQuery(name = "Cart.findByTipo", query = "SELECT c FROM Cart c WHERE c.tipo = :tipo")
    , @NamedQuery(name = "Cart.updatePvp", query = "UPDATE Cart c SET c.pvp = :pvp WHERE c.id = :id")
})
public class Cart implements Serializable {

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "cart")
    private Collection<CartArticle> cartArticleCollection;

    @OneToOne(cascade = CascadeType.ALL, mappedBy = "cart")
    private Collection<Pedido> pedidoCollection;

    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "PVP")
    private Double pvp;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "TIPO")
    private int tipo;
    @JoinColumn(name = "USERS", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Users users;

    public Cart() {
    }

    public Cart(Integer id) {
        this.id = id;
    }

    public Cart(Integer id, int tipo) {
        this.id = id;
        this.tipo = tipo;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
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
        if (!(object instanceof Cart)) {
            return false;
        }
        Cart other = (Cart) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entities.Cart[ id=" + id + " ]";
    }

    public Double getPvp() {
        return pvp;
    }

    public void setPvp(Double pvp) {
        this.pvp = pvp;
    }

    @XmlTransient
    public Collection<Pedido> getPedidoCollection() {
        return pedidoCollection;
    }

    public void setPedidoCollection(Collection<Pedido> pedidoCollection) {
        this.pedidoCollection = pedidoCollection;
    }

    @XmlTransient
    public Collection<CartArticle> getCartArticleCollection() {
        return cartArticleCollection;
    }

    public void setCartArticleCollection(Collection<CartArticle> cartArticleCollection) {
        this.cartArticleCollection = cartArticleCollection;
    }
}