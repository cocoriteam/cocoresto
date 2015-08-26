package ejb;

import entities.Dish;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class ejbDish implements ejbDishLocal {

    @PersistenceContext(unitName = "cocoresto-ejbPU")
    private EntityManager em;

    @Override
    public void create(Dish dish) {
        em.persist(dish);

    }

    @Override
    public void update(Dish dish) {
        em.merge(dish);

    }

    @Override
    public void delete(Dish dish) {
        Dish d = em.find(Dish.class, dish.getId());
        em.remove(d);
    }

    @Override
    public Dish findById(Long id) {
        Dish d = em.find(Dish.class, id);
        return d;
    }

    @Override
    public List<Dish> findAll() {
        String sq = "select d from Dish d";
        Query q = em.createQuery(sq);
        return q.getResultList();
    }

    public void persist(Object object) {
        em.persist(object);
    }

}