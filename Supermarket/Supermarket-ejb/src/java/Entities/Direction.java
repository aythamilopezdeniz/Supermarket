package Entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "DIRECTION")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Direction.findAll", query = "SELECT d FROM Direction d")
    , @NamedQuery(name = "Direction.findByUsers", query = "SELECT d FROM Direction d WHERE d.users = :users")
    , @NamedQuery(name = "Direction.findByNombre", query = "SELECT d FROM Direction d WHERE d.nombre = :nombre")
    , @NamedQuery(name = "Direction.findByApellidos", query = "SELECT d FROM Direction d WHERE d.apellidos = :apellidos")
    , @NamedQuery(name = "Direction.findByDireccion", query = "SELECT d FROM Direction d WHERE d.direccion = :direccion")
    , @NamedQuery(name = "Direction.findByCodigoPostal", query = "SELECT d FROM Direction d WHERE d.codigoPostal = :codigoPostal")
    , @NamedQuery(name = "Direction.updateLocal", query = "UPDATE Direction d SET d.nombre = :nombre, d.apellidos = :apellidos, d.direccion = :direccion WHERE d.users = :idCliente")
    , @NamedQuery(name = "Direction.updateDomicilio", query = "UPDATE Direction d SET d.nombre = :nombre, d.apellidos = :apellidos, d.direccion = :direccion, d.codigoPostal = :codigoPostal WHERE d.users = :idCliente")
})
public class Direction implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "USERS")
    private Integer users;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "NOMBRE")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "APELLIDOS")
    private String apellidos;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "DIRECCION")
    private String direccion;
    @Column(name = "CODIGO_POSTAL")
    private Integer codigoPostal;
    @JoinColumn(name = "PEDIDO", referencedColumnName = "ID")
    @OneToOne(optional = false)
    private Pedido pedido;

    public Direction() {
    }

    public Direction(Integer users) {
        this.users = users;
    }

    public Direction(Integer users, String nombre, String apellidos, String direccion) {
        this.users = users;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.direccion = direccion;
    }

    public Integer getUsers() {
        return users;
    }

    public void setUsers(Integer users) {
        this.users = users;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Integer getCodigoPostal() {
        return codigoPostal;
    }

    public void setCodigoPostal(Integer codigoPostal) {
        this.codigoPostal = codigoPostal;
    }

    public Pedido getPedido() {
        return pedido;
    }

    public void setPedido(Pedido pedido) {
        this.pedido = pedido;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (users != null ? users.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Direction)) {
            return false;
        }
        Direction other = (Direction) object;
        if ((this.users == null && other.users != null) || (this.users != null && !this.users.equals(other.users))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entities.Direction[ users=" + users + " ]";
    }
}