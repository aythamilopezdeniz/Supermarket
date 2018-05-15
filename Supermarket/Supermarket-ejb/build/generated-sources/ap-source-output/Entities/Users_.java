package Entities;

import Entities.Cart;
import Entities.Pedido;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-05-15T09:39:40")
@StaticMetamodel(Users.class)
public class Users_ { 

    public static volatile CollectionAttribute<Users, Cart> cartCollection;
    public static volatile SingularAttribute<Users, String> apellidos;
    public static volatile SingularAttribute<Users, Date> fecha;
    public static volatile SingularAttribute<Users, String> password;
    public static volatile SingularAttribute<Users, String> tipo;
    public static volatile SingularAttribute<Users, String> usuario;
    public static volatile CollectionAttribute<Users, Pedido> pedidoCollection;
    public static volatile SingularAttribute<Users, Integer> id;
    public static volatile SingularAttribute<Users, String> nombre;
    public static volatile SingularAttribute<Users, String> email;

}