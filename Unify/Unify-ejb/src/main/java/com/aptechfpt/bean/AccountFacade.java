package com.aptechfpt.bean;

import com.aptechfpt.entity.Account;
import com.aptechfpt.enumtype.AccountGender;
import com.aptechfpt.enumtype.Role;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import org.apache.commons.codec.digest.DigestUtils;
import org.joda.time.format.DateTimeFormat;

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
    public boolean comparePassword(int accountId, String password) {
        try {
            if (password != null) {
                TypedQuery<Account> q = em.createQuery("SELECT a FROM Account a WHERE a.accountId = :accountId", Account.class);
                q.setParameter("accountId", accountId);
                Account a = q.getSingleResult();
                return a.getPassword().equals(DigestUtils.sha512Hex(password));
            } else {
                return false;
            }
        } catch (NoResultException e) {
            return false;
        }
    }

    @Override
    public void updateProfile(Account a) {
//        String sql = getRoleQuery(a);
//        System.out.println("Query 2: " + sql);
//        Account update = this.findById(a.getAccountId());
        Query q = em.createNativeQuery("UPDATE Account SET "
                + "ImageLink = ?1,"
                + "FirstName = ?2,"
                + "LastName = ?3,"
                + "Phone = ?4,"
                + "Address = ?5,"
                + "Gender = ?6,"
                + "DayOfBirth = ?7"
                + " WHERE AccountId = ?8 ");
        q.setParameter(1, a.getImageLink());
        q.setParameter(2, a.getFirstName());
        q.setParameter(3, a.getLastName());
        q.setParameter(4, a.getPhone());
        q.setParameter(5, a.getAddress());
        q.setParameter(6, convertGender(a.getGender()));
        q.setParameter(7, a.getDayOfBirth().toString(DateTimeFormat.forPattern("yyyy-MM-dd'T'HH:mm:ss'Z")));
        q.setParameter(8, a.getAccountId());
        q.executeUpdate();
//        if (sql != null) {
//            System.out.println("Prepare update: " + sql);
//            Query q2 = em.createNativeQuery(sql);
//            q2.executeUpdate();
//        }
    }

    private String convertGender(AccountGender a) {
        switch (a) {
            case Male:
                return "M";
            case Female:
                return "F";
            default:
                return null;
        }
    }

    private String getRoleQuery(Account a) {
        Set<Role> roles = this.find(a.getAccountId()).getRoles();
        long diff = roles.size() - a.getRoles().size();
        String insertadmin = "INSERT INTO AccountRole (Email,Role) VALUES('" + a.getEmail() + "','" + Role.ADMINISTRATOR.name() + "')";
        String insertsaleperson = "INSERT INTO AccountRole (Email,Role) VALUES('" + a.getEmail() + "','" + Role.SALEPERSON.name() + "')";
        String deleteadmin = "  DELETE FROM [Unify].[dbo].[AccountRole] WHERE ( Email = '" + a.getEmail() + "' AND Role = '" + Role.ADMINISTRATOR.name() + "')";
        String deletesaleperson = "  DELETE FROM [Unify].[dbo].[AccountRole] WHERE ( Email = '" + a.getEmail() + "' AND Role = '" + Role.SALEPERSON.name() + "')";
        if (diff > 0) {
            boolean isAdmin = false;
            for (Role role : roles) {
                if (role == Role.ADMINISTRATOR) {
                    isAdmin = true;
                }
            }
            if (diff == 1 && isAdmin) {
                return deleteadmin;
            } else if (diff == 1 && !isAdmin) {
                return deletesaleperson;
            } else if (diff == 2) {
                return deleteadmin + " " + deletesaleperson;
            }
        } else if (diff < 0) {
            boolean isAdmin = false;
            for (Role role :  a.getRoles()) {
                if (role == Role.ADMINISTRATOR) {
                    isAdmin = true;
                }
            }
            if (diff == -1 && isAdmin) {
                return insertadmin;
            } else if (diff == -1 && !isAdmin) {
                return insertsaleperson;
            } else if (diff == -2) {
                return insertadmin + " " + insertsaleperson;
            }
        }
        return null;
    }

    @Override
    public boolean banAccount(int accountId) {
        Account a = this.findById(accountId);
        Query q = em.createQuery("UPDATE Account a SET a.available = :available WHERE a.accountId = :accountId");
        q.setParameter("available", !a.isAvailable());
        q.setParameter("accountId", a.getAccountId());
        q.executeUpdate();
        return !a.isAvailable();
    }

    @Override
    public void editPassword(int accountId, String password) {
        TypedQuery<Account> q = em.createQuery("UPDATE Account a SET a.password = :password WHERE a.accountId = :accountId",Account.class);
        q.setParameter("password", DigestUtils.sha512Hex(password));
        q.setParameter("accountId", accountId);
        q.executeUpdate();
    }
    
}
