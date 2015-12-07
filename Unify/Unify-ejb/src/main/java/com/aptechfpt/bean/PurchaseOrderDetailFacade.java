/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptechfpt.bean;

import com.aptechfpt.entity.PurchaseOrderDetail;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author ken
 */
@Stateless
public class PurchaseOrderDetailFacade extends AbstractFacade<PurchaseOrderDetail> implements PurchaseOrderDetailFacadeLocal {

    @PersistenceContext(unitName = "Unify-PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PurchaseOrderDetailFacade() {
        super(PurchaseOrderDetail.class);
    }
    
    @Override
    public List<PurchaseOrderDetail> findMostBuy() {
        List<PurchaseOrderDetail> list = new ArrayList<>();
        Query q = em.createQuery("SELECT p FROM PurchaseOrderDetail p ORDER BY p.quantity DESC");
        q.setMaxResults(3);
        list = q.getResultList();
        return list;
    }
    
}
