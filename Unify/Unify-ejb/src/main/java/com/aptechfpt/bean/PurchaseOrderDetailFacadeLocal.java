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
import javax.ejb.Local;

/**
 *
 * @author ken
 */
@Local
public interface PurchaseOrderDetailFacadeLocal {

    void create(PurchaseOrderDetail purchaseOrderDetail);

    void edit(PurchaseOrderDetail purchaseOrderDetail);

    void remove(PurchaseOrderDetail purchaseOrderDetail);

    PurchaseOrderDetail find(Object id);

    List<PurchaseOrderDetail> findAll();

    List<PurchaseOrderDetail> findRange(int[] range);

    int count();
    
    List<HighSale> getTop10Buy(String f, String t);
    
    List<PurchaseOrderDetail> findMostBuy();

    List<Product> findMost();


}
