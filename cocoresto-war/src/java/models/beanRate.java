
package models;

import ejb.ejbRateLocal;
import entities.Discount;
import entities.Tax;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class beanRate implements Serializable {
    
    ejbRateLocal ejbRate = lookupejbRateLocal();
    
    Tax tax;
    Discount discount;

    public beanRate() {
        tax = new Tax();
        discount = new Discount();
    }

    public Tax getTax() {
        return tax;
    }

    public void setTax(Tax tax) {
        this.tax = tax;
    }

    public Discount getDiscount() {
        return discount;
    }

    public void setDiscount(Discount discount) {
        this.discount = discount;
    }
    
    public void create(Tax tax) {
        ejbRate.create(tax);
    }
    
    public void create(Discount discount) {
        ejbRate.create(discount);
    }

    public void delete(Tax tax) {
        ejbRate.delete(tax);
    }
    
    public void delete(Discount discount){
        ejbRate.delete(discount);
    }

    public void update(Tax tax) {
        ejbRate.update(tax);
    }
    
    public void update(Discount discount) {
        ejbRate.update(discount);
    }

    public Tax findTaxById(Long id) {
        return ejbRate.findTaxById(id);
    }
    
    public Discount findDiscountById(Long id) {
        return ejbRate.findDiscountById(id);
    }

    public ArrayList<Tax> findAllTaxes() {
        return ejbRate.findAllTaxes();
    }
    
    public ArrayList<Discount> findAllDiscounts() {
        return ejbRate.findAllDiscounts();
    }

    
    
    
    
    
    private ejbRateLocal lookupejbRateLocal() {
        try {
            Context c = new InitialContext();
            return (ejbRateLocal) c.lookup("java:global/cocoresto/cocoresto-ejb/ejbRate!ejb.ejbRateLocal");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
    
    
    
}