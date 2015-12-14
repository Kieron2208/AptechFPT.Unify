package com.aptechfpt.bean;

import com.aptechfpt.entity.Account;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Kiero
 */
@Local
public interface AccountFacadeLocal {

    void create(Account account);

    void edit(Account account);

    void remove(Account account);

    Account findById(int id);

    List<Account> findAll();

    List<Account> findRange(int[] range);

    int count();

    Account findByEmail(String email);
    
}
