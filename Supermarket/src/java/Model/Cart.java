package Model;

import java.util.ArrayList;

public class Cart {

    private ArrayList<Article> cart;
    private double priceCart;

    public Cart() {
        cart = new ArrayList();
        this.priceCart = 0;
    }

    public ArrayList<Article> getCart() {
        return cart;
    }
    
    public void addArticle(Article article) {
        if(isEmpty())
            cart.add(new Article(article.getNombre(),article.getImage(),article.getPvp(),article.getType(), article.getSubtype1(),article.getSubtype2(), article.getDescription()));
        else {
            if(!repeteadArticle(article.getNombre())) 
                cart.add(new Article(article.getNombre(), article.getImage(), article.getPvp(), article.getType(), article.getSubtype1(), article.getSubtype2(), article.getDescription()));
            else {
                Article product = getArticle(article.getNombre());
                product.setCantidad(product.getCantidad()+1);
            }
        }
    }
    
    public void removeArticle(Article article, int id) {
        if(!isEmpty()) {
            if(repeteadArticle(article.getNombre())){
                Article product = getArticle(article.getNombre());
                article.setCantidad(product.getCantidad()-1);
            } else
                cart.remove(id);
        }
    }

    public boolean repeteadArticle(String name) {
        for (Article articles : cart) {
            if(articles.getNombre().equals(name) && articles.getCantidad() > 0)
                return true;
        }
        return false;
    }
    
    public double calculatePriceCart() {
        double price = 0;
        for (Article articles : cart) {
            price += Double.parseDouble(articles.getPvp())*articles.getCantidad();
        }
        setPriceCart(Math.round(price*100.0)/100.0);
        return Math.round(price*100.0)/100.0;
    }
    
    public Article getArticle(String name) {
        for (Article articles : cart) {
            if(articles.getNombre().equals(name))
                return articles;
        }
        return null;
    }

    public double getPriceCart() {
        return priceCart;
    }

    public void setPriceCart(double priceCart) {
        this.priceCart = priceCart;
    }
    
    public boolean isEmpty() {
        return cart.isEmpty();
    }
}