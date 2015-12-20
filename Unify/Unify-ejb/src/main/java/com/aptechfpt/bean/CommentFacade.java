/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptechfpt.bean;

import com.aptechfpt.dto.HighSale;
import com.aptechfpt.entity.Comment;
import com.aptechfpt.entity.PriceHistory;
import com.aptechfpt.entity.Product;
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
public class CommentFacade extends AbstractFacade<Comment> implements CommentFacadeLocal {

    @PersistenceContext(unitName = "Unify-PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CommentFacade() {
        super(Comment.class);
    }

    @Override
    public List<Comment> getListCommet(Product p) {
        Query q = em.createNamedQuery("Comment.findByProductID");
        q.setParameter("productId", p);
        List<Comment> list = q.getResultList();
        
        return list;
    }

    @Override
    public List<HighSale> getTop10Comment(String f, String t) {
        List<HighSale> list = new ArrayList();
        try{
        String sql = "SELECT TOP 10 COUNT(r.ProductId) AS Quantity, r.Name AS ProductName \n"
                    + "  FROM (SELECT p.Name, c.ProductId, c.CreatedDate FROM [Unify].[dbo].[Product] p INNER JOIN [Unify].[dbo].[Comment] c ON p.ProductId = c.ProductId) r \n"
                    + "  WHERE r.CreatedDate >= ?1 AND r.CreatedDate <= ?2 GROUP BY r.Name ORDER BY Quantity DESC";
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
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
    
}
