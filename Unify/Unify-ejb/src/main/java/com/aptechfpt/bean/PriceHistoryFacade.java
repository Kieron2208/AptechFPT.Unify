package com.aptechfpt.bean;

import com.aptechfpt.entity.PriceHistory;
import com.aptechfpt.entity.Product;
import java.math.BigDecimal;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Kiero
 */
@Stateless
public class PriceHistoryFacade extends AbstractFacade<PriceHistory> implements PriceHistoryFacadeLocal {
    @PersistenceContext(unitName = "Unify-PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PriceHistoryFacade() {
        super(PriceHistory.class);
    }

    @Override
    public BigDecimal getCost(Product product) {
        Query q = em.createNamedQuery("PriceHistory.findByCost");
        q.setParameter("productId", product);
        PriceHistory ph=(PriceHistory) q.setMaxResults(1).getSingleResult();
        return ph.getCost();
    }

    @Override
    public PriceHistory getNew(Product product) {
        Query q = em.createNamedQuery("PriceHistory.findByCost");
        q.setParameter("productId", product);
        PriceHistory ph=(PriceHistory) q.setMaxResults(1).getSingleResult();
        return ph;
    }
}
