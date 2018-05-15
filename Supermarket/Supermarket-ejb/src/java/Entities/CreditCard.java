package Entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "CREDIT_CARD")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CreditCard.findAll", query = "SELECT c FROM CreditCard c")
    , @NamedQuery(name = "CreditCard.findByUsers", query = "SELECT c FROM CreditCard c WHERE c.users = :users")
    , @NamedQuery(name = "CreditCard.exist", query = "SELECT c FROM CreditCard c WHERE c.users = :users")
    , @NamedQuery(name = "CreditCard.findByNumber", query = "SELECT c FROM CreditCard c WHERE c.number = :number")
    , @NamedQuery(name = "CreditCard.findByFechaCaducidad", query = "SELECT c FROM CreditCard c WHERE c.fechaCaducidad = :fechaCaducidad")})
public class CreditCard implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "USERS")
    private Integer users;
    @Basic(optional = false)
    @NotNull
    @Column(name = "NUMBER")
    private int number;
    @Basic(optional = false)
    @NotNull
    @Column(name = "FECHA_CADUCIDAD")
    @Temporal(TemporalType.DATE)
    private Date fechaCaducidad;

    public CreditCard() {
    }

    public CreditCard(Integer users) {
        this.users = users;
    }

    public CreditCard(Integer users, int number, Date fechaCaducidad) {
        this.users = users;
        this.number = number;
        this.fechaCaducidad = fechaCaducidad;
    }

    public Integer getUsers() {
        return users;
    }

    public void setUsers(Integer users) {
        this.users = users;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public Date getFechaCaducidad() {
        return fechaCaducidad;
    }

    public void setFechaCaducidad(Date fechaCaducidad) {
        this.fechaCaducidad = fechaCaducidad;
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
        if (!(object instanceof CreditCard)) {
            return false;
        }
        CreditCard other = (CreditCard) object;
        if ((this.users == null && other.users != null) || (this.users != null && !this.users.equals(other.users))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "StatelessFacade.CreditCard[ users=" + users + " ]";
    }
}