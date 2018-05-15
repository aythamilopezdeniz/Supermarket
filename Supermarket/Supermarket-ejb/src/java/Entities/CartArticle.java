package Entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "CART_ARTICLE")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CartArticle.findAll", query = "SELECT c FROM CartArticle c")
    , @NamedQuery(name = "CartArticle.findById", query = "SELECT c FROM CartArticle c WHERE c.id = :id")
    , @NamedQuery(name = "CartArticle.findByPvp", query = "SELECT c FROM CartArticle c WHERE c.pvp = :pvp")
    , @NamedQuery(name = "CartArticle.findByCantidad", query = "SELECT c FROM CartArticle c WHERE c.cantidad = :cantidad")
    , @NamedQuery(name = "CartArticle.findByCart", query = "SELECT c FROM CartArticle c WHERE c.cart.id = :cart")
    , @NamedQuery(name = "CartArticle.findByArticle", query = "SELECT c FROM CartArticle c WHERE c.cart.id = :cart AND c.article.id = :article")
    , @NamedQuery(name = "CartArticle.updateArticle", query = "UPDATE CartArticle c SET c.cantidad = :valor1, c.pvp = :valor2 WHERE c.cart.id = :cart AND c.article.id = :article")
    , @NamedQuery(name = "CartArticle.deleteArticle", query = "DELETE FROM CartArticle c WHERE c.cart.id = :cart AND c.article.id = :article")
})
public class CartArticle implements Serializable {

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
    @Column(name = "CANTIDAD")
    private Integer cantidad;
    @JoinColumn(name = "ARTICLE", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Article article;
    @JoinColumn(name = "CART", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Cart cart;

    public CartArticle() {
    }

    public CartArticle(Integer id) {
        this.id = id;
    }

    public CartArticle(Integer id, double pvp) {
        this.id = id;
        this.pvp = pvp;
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

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
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
        if (!(object instanceof CartArticle)) {
            return false;
        }
        CartArticle other = (CartArticle) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entities.CartArticle[ id=" + id + " ]";
    }
}