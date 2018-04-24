package Entities;

public class Article implements Cloneable {
    private String nombre;
    private String image;
    private String pvp;
    private int cantidad;
    private final String type;
    private final String subtype1;
    private final String subtype2;
    private final String description;
    private final int id;
    private static int idUnique = 1;

    public Article(String nombre, String image, String pvp, String type, String subtype1, String subtype2, String description) {
        this.nombre = nombre;
        this.image = image;
        this.cantidad = 0;
        this.pvp = pvp;
        this.type = type;
        this.subtype1 = subtype1;
        this.subtype2 = subtype2;
        this.description = description;
        this.id = getUniqueId();
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getPvp() {
        return pvp;
    }

    public void setPvp(String pvp) {
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

    public String getType() {
        return type;
    }

    public String getSubtype1() {
        return subtype1;
    }

    public String getSubtype2() {
        return subtype2;
    }

    public String getDescription() {
        return description;
    }

    public static int getUniqueId() {
        return idUnique++;
    }

    public int getId() {
        return id;
    }

    @Override
    public Article clone(){
        Article clon=null;
        try{
            clon=(Article) super.clone();
        }catch(CloneNotSupportedException ex){
            System.out.println(" no se puede duplicar");
        }
        return clon;
    }
    
    public double calculatePrice(String pvpArticle, int cantidad) {
        return (Double.parseDouble(pvp)*Math.round(cantidad*100)/100);
    }
}