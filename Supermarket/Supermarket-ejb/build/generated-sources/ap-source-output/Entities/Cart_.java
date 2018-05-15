package Entities;

import Entities.CartArticle;
import Entities.Pedido;
import Entities.Users;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-05-15T09:39:40")
@StaticMetamodel(Cart.class)
public class Cart_ { 

    public static volatile SingularAttribute<Cart, Integer> tipo;
    public static volatile CollectionAttribute<Cart, CartArticle> cartArticleCollection;
    public static volatile CollectionAttribute<Cart, Pedido> pedidoCollection;
    public static volatile SingularAttribute<Cart, Double> pvp;
    public static volatile SingularAttribute<Cart, Integer> id;
    public static volatile SingularAttribute<Cart, Users> users;

}