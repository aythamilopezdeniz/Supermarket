package Entities;

import Entities.Pedido;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-05-15T11:36:38")
@StaticMetamodel(Direction.class)
public class Direction_ { 

    public static volatile SingularAttribute<Direction, String> apellidos;
    public static volatile SingularAttribute<Direction, Integer> codigoPostal;
    public static volatile SingularAttribute<Direction, String> direccion;
    public static volatile SingularAttribute<Direction, Pedido> pedido;
    public static volatile SingularAttribute<Direction, String> nombre;
    public static volatile SingularAttribute<Direction, Integer> users;

}