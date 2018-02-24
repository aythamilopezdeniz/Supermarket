package Model;

public class Article {
    private String nombre;
    private String image;
    private String pvp;
    private int cantidad;

    public Article(String nombre, String image, String pvp) {
        this.nombre = nombre;
        this.image = image;
        this.pvp = pvp;
        this.cantidad = 1;
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
    
    public double calculatePrice(String pvpArticle, int cantidad) {
        return (Double.parseDouble(pvp)*cantidad);
    }
}