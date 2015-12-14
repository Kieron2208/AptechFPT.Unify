package com.aptechfpt.bean;

import com.aptechfpt.entity.PurchaseOrder;
import java.util.List;
import javax.ejb.Local;
import org.joda.time.DateTime;

/**
 *
 * @author ken
 */
@Local
public interface PurchaseOrderFacadeLocal {

    void create(PurchaseOrder purchaseOrder);

    void edit(PurchaseOrder purchaseOrder);

    void remove(PurchaseOrder purchaseOrder);

    PurchaseOrder find(Object id);

    List<PurchaseOrder> findAll();

    List<PurchaseOrder> findRange(int[] range);

    int count();

    PurchaseOrder getID();
    
    List<PurchaseOrder> getReport(DateTime f, DateTime t);

    List<PurchaseOrder> getListByAccountId(int AccountId);
}
