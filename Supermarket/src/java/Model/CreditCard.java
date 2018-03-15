package Model;

public class CreditCard {
    private String credirCardNumber;
    private String expiration;

    public CreditCard(String creditCardNumber, String expiration) {
        this.credirCardNumber = creditCardNumber;
        this.expiration = expiration;
    }

    public String getCreditCardNumber() {
        return credirCardNumber;
    }

    public void setCreditCardNumber(String creditCardNumber) {
        this.credirCardNumber = creditCardNumber;
    }

    public String getExpiration() {
        return expiration;
    }

    public void setExpiration(String expiration) {
        this.expiration = expiration;
    }
}