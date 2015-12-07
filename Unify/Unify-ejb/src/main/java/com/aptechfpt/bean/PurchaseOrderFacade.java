package com.aptechfpt.bean;

import com.aptechfpt.entity.PurchaseOrder;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author ken
 */
@Stateless
public class PurchaseOrderFacade extends AbstractFacade<PurchaseOrder> implements PurchaseOrderFacadeLocal {

    @PersistenceContext(unitName = "Unify-PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PurchaseOrderFacade() {
        super(PurchaseOrder.class);
    }

    @Override
    public PurchaseOrder getID() {
         Query q = em.createNamedQuery("PurchaseOrder.findByPurchaseOrderId");
         PurchaseOrder po = (PurchaseOrder) q.setMaxResults(1).getSingleResult();
         return po;
    }
    
}
