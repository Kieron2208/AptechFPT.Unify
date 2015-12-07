package com.aptechfpt.bean;

import com.aptechfpt.entity.Product;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Kiero
 */
@Stateless
public class ProductFacade extends AbstractFacade<Product> implements ProductFacadeLocal {
    @PersistenceContext(unitName = "Unify-PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProductFacade() {
        super(Product.class);
    }
    
//thuat
    @Override
    public List<Product> findLatest() {
        List<Product> list = new ArrayList<>();
        Query q = em.createQuery("SELECT  p FROM Product p WHERE p.available = TRUE ORDER BY p.productId DESC");
        q.setMaxResults(6);
        list = q.getResultList();
        return list;
    }

    @Override
    public List<Product> findMostLike() {
        List<Product> list = new ArrayList<>();
        Query q = em.createQuery("SELECT  p FROM Product p WHERE p.available = TRUE ORDER BY p.like DESC");
        q.setMaxResults(3);
        list = q.getResultList();
        return list;
    }
}
