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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "SUBCATEGORIA2")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Subcategoria2.findAll", query = "SELECT s FROM Subcategoria2 s")
    , @NamedQuery(name = "Subcategoria2.findById", query = "SELECT s FROM Subcategoria2 s WHERE s.id = :id")
    , @NamedQuery(name = "Subcategoria2.findByNombre", query = "SELECT s FROM Subcategoria2 s WHERE s.nombre = :nombre")
    , @NamedQuery(name = "Subcategoria2.findArticulos", query = "SELECT article FROM Article article INNER JOIN Subcategoria2 s2 ON s2.nombre = article.subtipo2 WHERE article.subtipo2 = :nombre")
})
public class Subcategoria2 implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "NOMBRE")
    private String nombre;
    @JoinColumn(name = "SUBCATEGORIA1", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Subcategoria1 subcategoria1;

    public Subcategoria2() {
    }

    public Subcategoria2(Integer id) {
        this.id = id;
    }

    public Subcategoria2(Integer id, String nombre) {
        this.id = id;
        this.nombre = nombre;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Subcategoria1 getSubcategoria1() {
        return subcategoria1;
    }

    public void setSubcategoria1(Subcategoria1 subcategoria1) {
        this.subcategoria1 = subcategoria1;
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
        if (!(object instanceof Subcategoria2)) {
            return false;
        }
        Subcategoria2 other = (Subcategoria2) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entities.Subcategoria2[ id=" + id + " ]";
    }
}