
package ejb;

import entities.Category;
import entities.Drink;
import entities.Format;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Local;

@Local
public interface ejbDrinkLocal {
    
    public void create(Drink drink);

    public void delete(Drink drink);

    public void update(Drink drink);

    public Drink findById(Long id);

    public void persist(Object object);

    public ArrayList<Drink> findAll();

    public List<Drink> findAllByRange(int firstResult, int maxResults);
    
    public ArrayList<Format> findFormats();
    
    public ArrayList<Category> findCategories();
    
    public int count();
      
}
