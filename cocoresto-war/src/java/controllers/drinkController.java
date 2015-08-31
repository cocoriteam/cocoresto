package controllers;

import entities.Category;
import entities.Discount;
import entities.Drink;
import entities.Format;
import entities.Price;
import entities.Tax;
import java.util.ArrayList;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.beanDrink;
import models.beanFormat;
import models.beanPrice;
import models.beanRate;

public class drinkController implements IController {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();

        Drink drink;
        Category category;
        Tax tax;
        Discount discount;
        Price price;
        ArrayList<Format> formats;
        ArrayList<Category> categories;
        ArrayList<Discount> discounts;
        ArrayList<Tax> taxes;
        ArrayList<Price> prices;
        Format format;

        beanDrink bDrink = (beanDrink) session.getAttribute("bDrink");
        beanRate bRate = (beanRate) session.getAttribute("bRate");
        beanPrice bPrice = (beanPrice) session.getAttribute("bPrice");
        beanFormat bFormat = (beanFormat) session.getAttribute("bFormat");

        if (bDrink == null) {
            bDrink = new beanDrink();
            drink = new Drink();
            category = new Category();
            formats = new ArrayList();
            format = new Format();
            price = new Price();
            tax = new Tax();
            discount = new Discount();
            drink.setFormats(formats);
            bDrink.setDrink(drink);
            session.setAttribute("bDrink", bDrink);
        } else {
            drink = bDrink.getDrink();
            format = bDrink.getFormat();
            category = bDrink.getCategory();
            price = bDrink.getPrice();
            tax = bDrink.getTax();
            discount = bDrink.getDiscount();
        }
        if (bRate == null) {
            bRate = new beanRate();
            drink = new Drink();
            format = new Format();
            category = new Category();
            session.setAttribute("bRate", bRate);
        }
        if (bPrice == null) {
            bPrice = new beanPrice();
            price = new Price();
            drink = new Drink();
            format = new Format();
            category = new Category();
            session.setAttribute("bPrice", bPrice);
        }
        if (bFormat == null) {
            bFormat = new beanFormat();
            session.setAttribute("bFormat", bFormat);
        }

        formats = bDrink.findFormats();
        categories = bDrink.findCategories();
        discounts = bRate.findAllDiscounts();
        taxes = bRate.findAllTaxes();
        prices = bPrice.findAll();

        if ("edit".equals(request.getParameter("task"))) {
            session.setAttribute("formats", formats);
            session.setAttribute("categories", categories);
            session.setAttribute("discounts", discounts);
            session.setAttribute("taxes", taxes);
            session.removeAttribute("drink");
            return "/WEB-INF/admin/drinkEdit.jsp";
        }

        if ("modify".equals(request.getParameter("task"))) {
            drink = bDrink.findById(Long.valueOf(request.getParameter("id")));
            ArrayList<Format> uncheckedFormats = new ArrayList();
            for (Format fo : formats) {
                if (!drink.getFormats().contains(fo)) {
                    uncheckedFormats.add(fo);
                }
            }
            session.setAttribute("uncheckedFormats", uncheckedFormats);
            session.setAttribute("category", drink.getCategory());
            session.setAttribute("formats", formats);
            session.setAttribute("categories", categories);
            session.setAttribute("discounts", discounts);
            session.setAttribute("taxes", taxes);
            session.setAttribute("drink", drink);

            return "/WEB-INF/admin/drinkEdit.jsp";
        }

        if ("deleteDiscountDrink".equals(request.getParameter("task"))) {
            drink = bDrink.findById(Long.valueOf(request.getParameter("id")));
            drink.setDiscount(null);
            session.setAttribute("drink", drink);
            return "/WEB-INF/admin/drinkEdit.jsp";
        }

        if ("delete".equals(request.getParameter("task"))) {
            drink = bDrink.findById(Long.valueOf(request.getParameter("id")));
            drink.setActive(false);
            bDrink.delete(drink);
        }

        if (request.getParameter("cancelIt") != null) {
            session.removeAttribute("drink");
            session.removeAttribute("category");
            session.removeAttribute("formats");
            session.removeAttribute("discounts");
            session.removeAttribute("taxes");
            session.removeAttribute("categories");
            session.removeAttribute("uncheckedFormats");
        }

        if (request.getParameter("createIt") != null) {
            drink = new Drink();
            drink.setActive(true);
            drink.setFormats(new ArrayList());
            for (int i = 0; i < formats.size(); i++) {
                if (request.getParameter("formatsList" + i) != null) {
                    Long id = Long.valueOf(request.getParameter("formatsList" + i));
                    Format f = bFormat.findById(id);
                    drink.getFormats().add(f);
                }
            }
            System.out.println(request.getParameter("comboDiscount"));
            if (!"empty".equals(request.getParameter("comboDiscount"))) {
                for (Discount di : discounts) {
                    if (di.getId().equals(Long.valueOf(request.getParameter("comboDiscount")))) {
                        discount = di;
                        drink.setDiscount(discount);
                        break;
                    }
                }
            }
            for (Tax ta : taxes) {
                if (ta.getRate().equals(Double.valueOf(request.getParameter("comboTax")))) {
                    tax = ta;
                    break;
                }
            }
            for (Category ca : categories) {
                if (ca.getName().equals(request.getParameter("comboCategory"))) {
                    category = ca;
                    break;
                }
            }

            drink.setTax(tax);
            drink.setCategory(category);
            drink.setDescription(request.getParameter("description"));
            drink.setName(request.getParameter("name"));
            drink.setInventory(Integer.valueOf(request.getParameter("inventory")));
            drink.setImage(request.getParameter("image"));
            if (drink.getPrice() != null) {
                if (!drink.getPrice().getPrice().equals(Double.valueOf(request.getParameter("price")))) {
                    for (Price p : prices) {
                        if (p.getPrice().equals(Double.valueOf(request.getParameter("price")))) {
                            price = p;
                            break;
                        } else {
                            price = null;
                        }
                    }
                    if (price == null) {
                        price = new Price();
                        price.setPrice(Double.valueOf(request.getParameter("price")));
                        bPrice.create(price);
                        price = bPrice.findLastInserted();
                        drink.setPrice(price);
                    } else {
                        drink.setPrice(price);
                    }
                }
            } else {
                
            }
            bDrink.create(drink);
            session.setAttribute("drink", drink);
        }

        if (request.getParameter("modifyIt") != null) {
            drink = (Drink) session.getAttribute("drink");
            ArrayList<Format> uncheckedFormats = (ArrayList) session.getAttribute("uncheckedFormats");
            ArrayList<Format> drinkFormats = new ArrayList();
            for (Format fo : drink.getFormats()) {
                drinkFormats.add(fo);
            }
            drink.setFormats(new ArrayList());
            for (int i = 0; i < uncheckedFormats.size(); i++) {
                if (request.getParameter("listUncheck" + i) != null) {
                    Long id = Long.valueOf(request.getParameter("listUncheck" + i));
                    Format f = bFormat.findById(id);
                    drink.getFormats().add(f);
                }
            }
            for (int i = 0; i < drinkFormats.size(); i++) {
                if (request.getParameter("listCheck" + i) != null) {
                    Long id = Long.valueOf(request.getParameter("listCheck" + i));
                    Format f = bFormat.findById(id);
                    drink.getFormats().add(f);
                }
            }
            for (Discount di : discounts) {
                if (di.getId().equals(Long.valueOf(request.getParameter("comboDiscount")))) {
                    discount = di;
                    break;
                }
            }
            for (Tax ta : taxes) {
                if (ta.getRate().equals(Double.valueOf(request.getParameter("comboTax")))) {
                    tax = ta;
                    break;
                }
            }
            for (Category ca : categories) {
                if (ca.getName().equals(request.getParameter("comboCategory"))) {
                    category = ca;
                    break;
                }
            }
            drink.setDiscount(discount);
            drink.setTax(tax);
            drink.setCategory(category);
            drink.setDescription(request.getParameter("description"));
            drink.setName(request.getParameter("name"));
            drink.setInventory(Integer.valueOf(request.getParameter("inventory")));
            drink.setImage(request.getParameter("image"));
            if (!drink.getPrice().getPrice().equals(Double.valueOf(request.getParameter("price")))) {
                for (Price p : prices) {
                    if (p.getPrice().equals(Double.valueOf(request.getParameter("price")))) {
                        price = p;
                        break;
                    } else {
                        price = null;
                    }
                }
                if (price == null) {
                    price = new Price();
                    price.setPrice(Double.valueOf(request.getParameter("price")));
                    bPrice.create(price);
                    price = bPrice.findLastInserted();
                    drink.setPrice(price);
                } else {
                    drink.setPrice(price);
                }
            }
            bDrink.update(drink);
            session.setAttribute("uncheckedFormats", uncheckedFormats);
            session.setAttribute("drink", drink);
        }

        if ("drink".equals(request.getParameter("option"))) {
            ArrayList<Drink> drinks = bDrink.findAll();
            session.setAttribute("drinks", drinks);
            return "/WEB-INF/admin/drinkList.jsp";
        }

        return "/WEB-INF/admin/drinkEdit.jsp";
    }

    @Override
    public String execute(HttpServlet servlet, HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
