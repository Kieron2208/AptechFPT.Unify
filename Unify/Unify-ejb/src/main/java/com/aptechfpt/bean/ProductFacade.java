package com.aptechfpt.bean;

import com.aptechfpt.entity.Product;
import com.aptechfpt.entity.SubCategory;
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

    @Override
    public List<Product> getTop10Like() {
        List<Product> list = new ArrayList<>();
        Query q = em.createQuery("SELECT  p FROM Product p WHERE p.available = TRUE ORDER BY p.like DESC");
        q.setMaxResults(10);
        list = q.getResultList();
        return list;
    }
    @Override
    public Product findByID(int id) {
        Query q = em.createNamedQuery("Product.findByProductId");
        q.setParameter("productId", id);
        Product pro=(Product) q.setMaxResults(1).getSingleResult();
        return pro;
    }

    @Override
    public List<Product> findBySub(SubCategory id) {
        List<Product> list = new ArrayList<>();
        Query q = em.createQuery("SELECT  p FROM Product p WHERE p.available = TRUE AND p.subCategoryId = :subCategoryId ORDER BY p.like DESC");
        q.setParameter("subCategoryId", id);
        list = q.getResultList();
        return list;
    }

    @Override
    public List<Product> findBySubGen(SubCategory id, int gender) {
        List<Product> list = new ArrayList<>();
        Query q = em.createQuery("SELECT  p FROM Product p WHERE p.available = TRUE AND p.subCategoryId = :subCategoryId AND p.gender = :gender ORDER BY p.like DESC");
        q.setParameter("subCategoryId", id);
        q.setParameter("gender", gender);
        list = q.getResultList();
        return list;
    }
}
