package Entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "ARTICLE")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Article.findAll", query = "SELECT a FROM Article a")
    , @NamedQuery(name = "Article.findById", query = "SELECT a FROM Article a WHERE a.id = :id")
    , @NamedQuery(name = "Article.findByNombre", query = "SELECT a FROM Article a WHERE a.nombre = :nombre")
    , @NamedQuery(name = "Article.findByPalabra", query = "SELECT a FROM Article a WHERE upper(a.nombre) LIKE upper(:nombre)")
    , @NamedQuery(name = "Article.findByImagen", query = "SELECT a FROM Article a WHERE a.imagen = :imagen")
    , @NamedQuery(name = "Article.findByPvp", query = "SELECT a FROM Article a WHERE a.pvp = :pvp")
    , @NamedQuery(name = "Article.findByCantidad", query = "SELECT a FROM Article a WHERE a.cantidad = :cantidad")
    , @NamedQuery(name = "Article.findByTipo", query = "SELECT a FROM Article a WHERE a.tipo = :tipo")
    , @NamedQuery(name = "Article.findByType", query = "SELECT a FROM Article a WHERE upper(a.tipo) LIKE upper(:tipo)")
    , @NamedQuery(name = "Article.findBySubtipo1", query = "SELECT a FROM Article a WHERE a.subtipo1 = :subtipo1")
    , @NamedQuery(name = "Article.findBySubtype1", query = "SELECT a FROM Article a WHERE upper(a.subtipo1) LIKE upper(:subtipo1)")
    , @NamedQuery(name = "Article.findBySubtipo2", query = "SELECT a FROM Article a WHERE a.subtipo2 = :subtipo2")
    , @NamedQuery(name = "Article.findBySubtype2", query = "SELECT a FROM Article a WHERE upper(a.subtipo2) LIKE upper(:subtipo2)")
    , @NamedQuery(name = "Article.findByDescription", query = "SELECT a FROM Article a WHERE a.description = :description")})
public class Article implements Serializable {

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
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "IMAGEN")
    private String imagen;
    @Basic(optional = false)
    @NotNull
    @Column(name = "PVP")
    private double pvp;
    @Basic(optional = false)
    @NotNull
    @Column(name = "CANTIDAD")
    private int cantidad;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "TIPO")
    private String tipo;
    @Size(max = 20)
    @Column(name = "SUBTIPO1")
    private String subtipo1;
    @Size(max = 20)
    @Column(name = "SUBTIPO2")
    private String subtipo2;
    @Size(max = 500)
    @Column(name = "DESCRIPTION")
    private String description;

    public Article() {
    }

    public Article(Integer id) {
        this.id = id;
    }

    public Article(Integer id, String nombre, String imagen, double pvp, int cantidad, String tipo) {
        this.id = id;
        this.nombre = nombre;
        this.imagen = imagen;
        this.pvp = pvp;
        this.cantidad = cantidad;
        this.tipo = tipo;
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

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public double getPvp() {
        return pvp;
    }

    public void setPvp(double pvp) {
        this.pvp = pvp;
    }

    public int getCantidad() {
        return cantidad;
    }
    
    public void addCantidad() {
        this.cantidad++;
    }
    
    public void removeCantidad() {
        this.cantidad--;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getSubtipo1() {
        return subtipo1;
    }

    public void setSubtipo1(String subtipo1) {
        this.subtipo1 = subtipo1;
    }

    public String getSubtipo2() {
        return subtipo2;
    }

    public void setSubtipo2(String subtipo2) {
        this.subtipo2 = subtipo2;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
        if (!(object instanceof Article)) {
            return false;
        }
        Article other = (Article) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public Article clone() {
        Article clon=null;
        try{
            clon=(Article) super.clone();
        }catch(CloneNotSupportedException ex){
            System.out.println(" no se puede duplicar");
        }
        return clon;
    }
    
    public double calculatePrice(double pvpArticle, int cantidad) {
        return (pvp*Math.round(cantidad*100)/100);
    }

    @Override
    public String toString() {
        return "Entities.Article[ id=" + id + " ]";
    }
}