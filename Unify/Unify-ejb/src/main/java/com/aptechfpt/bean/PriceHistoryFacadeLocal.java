package com.aptechfpt.bean;

import com.aptechfpt.entity.PriceHistory;
import com.aptechfpt.entity.Product;
import java.math.BigDecimal;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Kiero
 */
@Local
public interface PriceHistoryFacadeLocal {

    void create(PriceHistory priceHistory);

    void edit(PriceHistory priceHistory);

    void remove(PriceHistory priceHistory);

    PriceHistory find(Object id);

    List<PriceHistory> findAll();

    List<PriceHistory> findRange(int[] range);

    int count();

    BigDecimal getCost(Product product);
    
}
