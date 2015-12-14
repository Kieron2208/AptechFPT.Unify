package com.aptechfpt.mock;

import com.aptechfpt.bean.AccountFacadeLocal;
import com.aptechfpt.dto.AccountDTO;
import com.aptechfpt.entity.Account;
import com.aptechfpt.enumtype.AccountGender;
import com.aptechfpt.enumtype.Role;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.Stateless;
import javax.inject.Inject;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

/**
 *
 * @author Kiero
 */
@Stateless
public class AccountFacadeMock implements AccountFacadeLocal {

    private ArrayList<Account> list;

    @PostConstruct
    public void init() {
        DateTimeFormatter format = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss.SSSSSSS");
        list = new ArrayList<>();
        list.add(new AccountDTO.Builder(1, "admin@yourstore.com")
                .Password("123456")
                .Gender(AccountGender.Male)
                .ImageLink("/img/user/user.jpg")
                .FirstName("Arthur")
                .LastName("Gonzalez")
                .Phone("7-(126)589-8660")
                .Address("74374 Cottonwood Parkway")
                .DateOfBirth(format.parseDateTime("2015-12-04 12:17:28.300"))
                .CreatedDate(format.parseDateTime("2015-11-30 18:47:31.877"))
                .Role(Role.USER)
                .Role(Role.SALEPERSON)
                .Role(Role.ADMINISTRATOR)
                .build()
                .toAccount());

        list.add(new AccountDTO.Builder(2, "kieron2208@gmail.com")
                .Password("123456")
                .Gender(AccountGender.Male)
                .ImageLink("/img/user/user.jpg")
                .FirstName("Henry")
                .LastName("Ruiz")
                .Phone("509-(330)258-7565")
                .Address("8752 Oakridge Hill")
                .DateOfBirth(format.parseDateTime("2015-12-04 12:17:28.300"))
                .CreatedDate(format.parseDateTime("2015-11-30 18:47:31.877"))
                .Role(Role.USER)
                .Role(Role.SALEPERSON)
                .build()
                .toAccount());

        list.add(new AccountDTO.Builder(3, "user@yahoo.com")
                .Password("123456")
                .Gender(AccountGender.Male)
                .ImageLink("/img/user/user.jpg")
                .FirstName("Timothy")
                .LastName("Coleman")
                .Phone("46-(197)374-5560")
                .Address("0 Sundown Court")
                .DateOfBirth(format.parseDateTime("2015-12-04 12:17:28.300"))
                .CreatedDate(format.parseDateTime("2015-11-30 18:47:31.877"))
                .Role(Role.USER)
                .build()
                .toAccount());
    }

    private Logger logger = Logger.getLogger(AccountFacadeMock.class.getName());

    @Override
    public void create(Account account) {
        list.add(account);
        logger.log(Level.INFO, "{0} has been created.", account.getEmail());
    }

    @Override
    public void edit(Account account) {
        int index = list.indexOf(account);
        list.set(index, account);
        logger.log(Level.INFO, "{0} has been edited.", account.getEmail());
    }

    @Override
    public void remove(Account account) {
        list.remove(account);
        logger.log(Level.INFO, "{0} has been removed.", account.getEmail());
    }

    @Override
    public Account findById(int id) {
        logger.info("An account founded.");
        return list.get(id-1);
    }

    @Override
    public List<Account> findAll() {
        return list;
    }

    @Override
    public List<Account> findRange(int[] range) {
        List<Account> founds = new ArrayList<>();
        for (int a : range) {
            founds.add(list.get(a));
        }
        return founds;
    }

    @Override
    public int count() {
        return list.size();
    }

    @Override
    public Account findByEmail(String email) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
