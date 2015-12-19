package com.aptechfpt.bean;

import com.aptechfpt.entity.Account;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import org.apache.commons.codec.digest.DigestUtils;
import org.eclipse.persistence.jpa.JpaQuery;

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
    public List<Account> findAll() {
        TypedQuery<Account> q = getEntityManager().createQuery("SELECT a FROM Account a WHERE a.accountId NOT IN (1)", Account.class);
        return q.getResultList();
    }

    @Override
    public Account findById(int id) {
        return super.find(id);
    }

    @Override
    public Account findByEmail(String email) {
        try {
            TypedQuery<Account> q = getEntityManager().createNamedQuery("Account.findByEmail", Account.class);
            q.setParameter("email", email);
            return (Account) q.getSingleResult();
        } catch (NoResultException ex) {
            return null;
        }
    }

    @Override
    public List<Account> GetOnlyUsers() {
        List<Account> accounts = new ArrayList<>();
        String sqlString = "SELECT [AccountId],a.[Email],[Password],[ImageLink],[FirstName],[LastName],[Phone],[Address],[Gender],[DayOfBirth],[CreatedDate],[isAvailable]"
                + "FROM [Unify].[dbo].[Account] a INNER JOIN [Unify].[dbo].[AccountRole] r ON a.[Email] = r.[Email] WHERE [AccountId] IN\n"
                + "(SELECT [AccountId] FROM [Unify].[dbo].[Account] a INNER JOIN [Unify].[dbo].[AccountRole] r ON a.[Email] = r.[Email] EXCEPT\n"
                + "(SELECT [AccountId] FROM [Unify].[dbo].[Account] a INNER JOIN [Unify].[dbo].[AccountRole] r ON a.[Email] = r.[Email] \n"
                + "WHERE r.Role = 'SALEPERSON' OR r.Role = 'ADMINISTRATOR'))";
        Query q = em.createNativeQuery(sqlString, Account.class);
        accounts = q.getResultList();
        return accounts;
    }

    @Override
    public boolean isExistedEmail(String email) {
        try {
            Query q = em.createQuery("SELECT a.accountId FROM Account a WHERE a.email = :email");
            q.setParameter("email", email);
            return q.getSingleResult() != null;
        } catch (NoResultException e) {
            return false;
        }
    }

    @Override
    public boolean checkPassword(int accountId, String password) {
        try {
            if (password != null) {
                Query q = em.createQuery("SELECT a.password FROM Account a WHERE a.accountId = :accountId");
                q.setParameter("accountId", accountId);
                String dbpass = (String) q.getSingleResult();
                return dbpass.equals(DigestUtils.sha512Hex(password));
            } else {
                return false;
            }
        } catch (NoResultException e) {
            return false;
        }
    }

}
