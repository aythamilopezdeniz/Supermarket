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
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@Table(name = "SUBCATEGORIA1")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Subcategoria1.findAll", query = "SELECT s FROM Subcategoria1 s")
    , @NamedQuery(name = "Subcategoria1.findById", query = "SELECT s FROM Subcategoria1 s WHERE s.id = :id")
    , @NamedQuery(name = "Subcategoria1.findByNombre", query = "SELECT s FROM Subcategoria1 s WHERE s.nombre = :nombre")
    , @NamedQuery(name = "Subcategoria1.findArticulos", query = "SELECT a FROM Article a INNER JOIN Subcategoria1 s1 ON s1.nombre = a.subtipo1 WHERE a.subtipo1 = :nombre")
})
public class Subcategoria1 implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "NOMBRE")
    private String nombre;
    @JoinColumn(name = "CATEGORIA", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Categoria categoria;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "subcategoria1")
    private Collection<Subcategoria2> subcategoria2Collection;

    public Subcategoria1() {
    }

    public Subcategoria1(Integer id) {
        this.id = id;
    }

    public Subcategoria1(Integer id, String nombre) {
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

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    @XmlTransient
    public Collection<Subcategoria2> getSubcategoria2Collection() {
        return subcategoria2Collection;
    }

    public void setSubcategoria2Collection(Collection<Subcategoria2> subcategoria2Collection) {
        this.subcategoria2Collection = subcategoria2Collection;
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
        if (!(object instanceof Subcategoria1)) {
            return false;
        }
        Subcategoria1 other = (Subcategoria1) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entities.Subcategoria1[ id=" + id + " ]";
    }
}