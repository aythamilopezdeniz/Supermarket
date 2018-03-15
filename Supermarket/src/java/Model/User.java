package Model;

public class User {
    private String name;
    private String surnames;
    private String born;
    private String user;
    private String email;
    private String password;
    private CreditCard creditCardNumber;
    private final String type;

    public User(String name, String surnames, String born, String user, String email, String password, String type) {
        this.name = name;
        this.surnames = surnames;
        this.born = born;
        this.user = user;
        this.email = email;
        this.password = password;
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurnames() {
        return surnames;
    }

    public void setSurnames(String surnames) {
        this.surnames = surnames;
    }

    public String getBorn() {
        return born;
    }

    public void setBorn(String born) {
        this.born = born;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getType() {
        return type;
    }

    public CreditCard getCreditCardNumber() {
        return creditCardNumber;
    }

    public void setCreditCardNumber(String creditCardNumber, String expiration) {
        this.creditCardNumber = new CreditCard(creditCardNumber, expiration);
    }
}