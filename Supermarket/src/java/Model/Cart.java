package Model;

import java.util.ArrayList;

public class Cart {

    private final ArrayList<Article> cart;
    private Article article;

    public Cart() {
        cart = new ArrayList();
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
                this.article = getArticle(article.getNombre());
                getArticle(article.getNombre()).setCantidad(this.article.getCantidad()+1);
            }
        }
    }
    
    public void removeArticle(Article article) {
        if(!isEmpty()) {
            if(repeteadArticle(article.getNombre())){
                this.article = getArticle(article.getNombre());
                this.article.setCantidad(this.article.getCantidad()-1);
            } else
                cart.remove(cart.indexOf(article.getNombre()));
        }
    }

    public boolean repeteadArticle(String name) {
        for (Article articles : cart) {
            if(articles.getNombre().equals(name))
                return true;
        }
        return false;
    }
    
    public double calculatePriceCart() {
        double price = 0;
        for (Article articles : cart) {
            price += Double.parseDouble(articles.getPvp())*articles.getCantidad();
        }
        return Math.round(price*100.0)/100.0;
    }
    
    public Article getArticle(String name) {
        for (Article articles : cart) {
            if(articles.getNombre().equals(name))
                return articles;
        }
        return null;
    }

    public Article getArticle() {
        return article;
    }
    
    public boolean isEmpty() {
        return cart.isEmpty();
    }
}