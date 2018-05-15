package Entities;

import Entities.Article;
import Entities.Cart;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-05-15T11:36:38")
@StaticMetamodel(CartArticle.class)
public class CartArticle_ { 

    public static volatile SingularAttribute<CartArticle, Integer> id;
    public static volatile SingularAttribute<CartArticle, Double> pvp;
    public static volatile SingularAttribute<CartArticle, Integer> cantidad;
    public static volatile SingularAttribute<CartArticle, Article> article;
    public static volatile SingularAttribute<CartArticle, Cart> cart;

}