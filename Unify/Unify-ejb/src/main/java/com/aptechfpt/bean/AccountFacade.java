package com.aptechfpt.bean;

import com.aptechfpt.entity.Account;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

/**
 *
 * @author Kiero
 */
@Stateless
public class AccountFacade extends AbstractFacade<Account> implements AccountFacadeLocal {
    @PersistenceContext(unitName = "Unify-PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AccountFacade() {
        super(Account.class);
    }

    @Override
    public List<Account> findAll(){
        TypedQuery<Account> q = getEntityManager().createNamedQuery("Account.findAll", Account.class);
        return q.getResultList();
    }

    @Override
    public Account findById(int id) {
        return super.find(id);
    }

    @Override
    public Account findByEmail(String email) {
        TypedQuery<Account> q = getEntityManager().createNamedQuery("Account.findByEmail",Account.class);
        q.setParameter("email", email);
        return (Account) q.getSingleResult();
    }
    
    
}
