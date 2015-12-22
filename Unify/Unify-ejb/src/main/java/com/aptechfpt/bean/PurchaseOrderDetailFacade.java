/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptechfpt.bean;

import com.aptechfpt.dto.HighSale;
import com.aptechfpt.entity.Product;
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

    @Override
    public List<HighSale> getTop10Buy(String f, String t) {
        List<HighSale> list = new ArrayList();
        try {
            String sql = "SELECT TOP 10 SUM(r.Quantity) AS Quantity, r.Name AS ProductName \n"
                    + "  FROM (SELECT p.Name, pod.Quantity, pod.PurchaseOrderId FROM [Unify].[dbo].[Product] p INNER JOIN [Unify].[dbo].[PurchaseOrderDetail] pod ON p.ProductId = pod.ProductId) r \n"
                    + "  INNER JOIN [Unify].[dbo].[PurchaseOrder] po ON r.PurchaseOrderId = po.PurchaseOrderId WHERE po.CreatedDate >= ?1 AND po.CreatedDate <= ?2 GROUP BY r.Name ORDER BY Quantity DESC";
            Query q = em.createNativeQuery(sql);
            q.setParameter(1, f);
            q.setParameter(2, t);
            List<Object[]> result = q.getResultList();

            for (Object[] col : result) {

                HighSale sale = new HighSale();
                sale.quantity = (Integer) col[0];
                sale.productName = (String) col[1];
                list.add(sale);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Product> findMost() {
        List<Product> list = new ArrayList();
        Query q = em.createQuery("SELECT p.productId FROM PurchaseOrderDetail p GROUP BY p.productId ORDER BY sum(p.quantity) DESC");
        q.setMaxResults(3);
        list = q.getResultList();
        return list;
    }

}
