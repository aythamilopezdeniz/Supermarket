package Entities;

import Entities.CartArticle;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-05-15T20:00:37")
@StaticMetamodel(Article.class)
public class Article_ { 

    public static volatile SingularAttribute<Article, String> subtipo2;
    public static volatile SingularAttribute<Article, String> tipo;
    public static volatile SingularAttribute<Article, String> subtipo1;
    public static volatile CollectionAttribute<Article, CartArticle> cartArticleCollection;
    public static volatile SingularAttribute<Article, String> imagen;
    public static volatile SingularAttribute<Article, String> description;
    public static volatile SingularAttribute<Article, Integer> id;
    public static volatile SingularAttribute<Article, Double> pvp;
    public static volatile SingularAttribute<Article, String> nombre;

}