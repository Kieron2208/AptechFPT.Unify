package com.aptechfpt.bean;

import com.aptechfpt.entity.PurchaseOrder;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import org.joda.time.DateTime;

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

    @Override
    public List<PurchaseOrder> getReport(DateTime f, DateTime t) {
        Query q = em.createNamedQuery("PurchaseOrder.findByCreatedDate");
        q.setParameter("fDate", f);
        q.setParameter("toDate", t);
        List<PurchaseOrder> list = q.getResultList();
        return list;
    }

    @Override
    public List<PurchaseOrder> getListByAccountId(int AccountId) {
        TypedQuery<PurchaseOrder> q = em.createNamedQuery("PurchaseOrder.findByAccount", PurchaseOrder.class);
        q.setParameter("accountId", AccountId);
        return q.getResultList();
    }

}
