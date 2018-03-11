package Model;

public class Article {
    private String nombre;
    private String image;
    private String pvp;
    private int cantidad;
    private final String type;
    private final String subtype1;
    private final String subtype2;
    private final String description;
    private final int id;
    private static int idUnique = 0;

    /*public Article(String nombre, String image, String pvp) {
        this.nombre = nombre;
        this.image = image;
        this.cantidad = 1;
        this.pvp = pvp;
        this.id = getUniqueId();
    }*/

    public Article(String nombre, String image, String pvp, String type, String subtype1, String subtype2, String description) {
        this.nombre = nombre;
        this.image = image;
        this.cantidad = 1;
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

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
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
    
    public double calculatePrice(String pvpArticle, int cantidad) {
        return (Double.parseDouble(pvp)*Math.round(cantidad*100)/100);
    }
}