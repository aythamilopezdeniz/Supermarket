package Entities;

import Entities.Cart;
import Entities.Direction;
import Entities.Users;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-05-15T11:36:38")
@StaticMetamodel(Pedido.class)
public class Pedido_ { 

    public static volatile SingularAttribute<Pedido, String> estado;
    public static volatile CollectionAttribute<Pedido, Direction> directionCollection;
    public static volatile SingularAttribute<Pedido, String> hora;
    public static volatile SingularAttribute<Pedido, Integer> id;
    public static volatile SingularAttribute<Pedido, Double> pvp;
    public static volatile SingularAttribute<Pedido, String> dia;
    public static volatile SingularAttribute<Pedido, Cart> cart;
    public static volatile SingularAttribute<Pedido, Users> users;

}