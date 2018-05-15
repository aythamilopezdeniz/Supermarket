package Entities;

import Entities.Categoria;
import Entities.Subcategoria2;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-05-15T09:39:40")
@StaticMetamodel(Subcategoria1.class)
public class Subcategoria1_ { 

    public static volatile CollectionAttribute<Subcategoria1, Subcategoria2> subcategoria2Collection;
    public static volatile SingularAttribute<Subcategoria1, Categoria> categoria;
    public static volatile SingularAttribute<Subcategoria1, Integer> id;
    public static volatile SingularAttribute<Subcategoria1, String> nombre;

}