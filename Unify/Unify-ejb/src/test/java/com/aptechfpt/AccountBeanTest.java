/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptechfpt;

import com.aptechfpt.bean.AccountFacadeLocal;
import com.aptechfpt.dto.AccountDTO;
import com.aptechfpt.entity.Account;
import com.aptechfpt.enumtype.AccountGender;
import com.aptechfpt.enumtype.Role;
import java.io.File;
import java.util.List;
import javax.ejb.EJB;
import javax.inject.Inject;
import javax.validation.ConstraintViolationException;
import org.apache.commons.codec.digest.DigestUtils;
import org.jboss.arquillian.container.test.api.Deployment;
import org.jboss.arquillian.junit.Arquillian;
import org.jboss.shrinkwrap.api.Archive;
import org.jboss.shrinkwrap.api.ShrinkWrap;
import org.jboss.shrinkwrap.resolver.api.maven.Maven;
import org.junit.Test;
import static org.assertj.core.api.Assertions.*;
import org.jboss.shrinkwrap.api.asset.EmptyAsset;
import org.jboss.shrinkwrap.api.spec.JavaArchive;
import org.jboss.shrinkwrap.api.spec.WebArchive;
import org.joda.time.DateTime;
import org.junit.Rule;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;

/**
 *
 * @author Kiero
 */
@RunWith(Arquillian.class)
public class AccountBeanTest {

//    @EJB
//    private AccountFacadeLocal accountFacadeLocal;
    @Rule
    public ExpectedException thrown = ExpectedException.none();

    @Deployment
    public static Archive<?> deploy() {
        File[] libraries = Maven.resolver().loadPomFromFile("pom.xml")
                .importCompileAndRuntimeDependencies()
                .resolve("org.assertj:assertj-core")
                .withTransitivity()
                .asFile();

        WebArchive war = ShrinkWrap.create(WebArchive.class, "AccountTest.war")
                .addPackage("com.aptechfpt.bean")
                .addPackage("com.aptechfpt.entity")
                .addPackage("com.aptechfpt.converter")
                .addPackage("com.aptechfpt.dto")
                .addPackage("com.aptechfpt.enumtype")
                .addPackage("com.aptechfpt.utils")
                //                .addAsManifestResource(file,"glassfish-resources.xml")
                .addAsResource("META-INF/persistence.xml")
                .addAsLibraries(libraries);
        System.out.println("EJB folder structure: ");
        System.out.println(war.toString(true));

        return war;
    }

    @EJB
    private AccountFacadeLocal accountFacadeLocal;

    @Test
    public void should_bean_be_injected() throws Exception {
        List<Account> findAll = accountFacadeLocal.findAll();
        Account expected = new AccountDTO.Builder(1, "admin@yourstore.com").Password("123456").build().toAccount();
        System.out.println(findAll.size());
        for (Account account : findAll) {
            System.out.println("Email: " + account.getEmail());
            System.out.println("Date Of Birth: " + account.getDayOfBirth().toString());
            System.out.println("Created Date : " + account.getCreatedDate().toString());
        }
        assertAccountListNotNull(findAll);
        assertThat(findAll).doesNotContain(expected);
        assertThat(findAll).isNotNull();
    }

    @Test
    public void Find_Person_By_Email() throws Exception {
        String email = "user@gmail.com";
        Account account = accountFacadeLocal.findByEmail(email);
        assertThat(account.getAccountId()).isEqualTo(3);
        assertThat(account.getEmail()).isEqualTo(email);
        assertThat(account.getPassword()).isEqualTo(DigestUtils.sha512Hex("123456"));
        assertThat(account.getPurchaseOrderCollection().size()).isEqualTo(8);
    }

    @Test
    public void Get_Without_Admin_And_SalePerson() throws Exception {
        List<Account> accounts = accountFacadeLocal.GetOnlyUsers();
        assertAccountListNotNull(accounts);
        assertThat(accounts.size()).isEqualTo(98);
    }

    @Test
    public void Existed_Email() throws Exception {
        boolean expected1 = accountFacadeLocal.isExistedEmail("kieron2208@gmail.com");
        boolean expected2 = accountFacadeLocal.isExistedEmail("thanhThao1987@gmail.com");
        assertThat(expected1).isTrue();
        assertThat(expected2).isFalse();
    }

    @Test
    public void hello() {
        thrown.expect(ConstraintViolationException.class);
        Account a = new AccountDTO.Builder("kieron2208@gmail.com")
                .Password("123456")
                .FirstName(null)
                .LastName(null)
                .Phone("0907701007")
                .Address("123 Le Duong. Quan 1. TP HCM")
                .DateOfBirth(new DateTime("1992-08-22"))
                .Gender(AccountGender.Male)
                .Role(Role.USER)
                .build()
                .toAccount();

    }

    private void assertAccountListNotNull(List<Account> list) {
        assertThat(list).isNotNull();
        assertThat(list.size()).isGreaterThan(0);
        for (Account a : list) {
            assertThat(a.getAccountId()).isNotNull();
            assertThat(a.getEmail()).isNotNull();
            assertThat(a.getPassword()).isNotNull();
            assertThat(a.getFirstName()).isNotNull();
            assertThat(a.getLastName()).isNotNull();
            assertThat(a.getImageLink()).isNotNull();
            assertThat(a.getGender()).isNotNull();
            assertThat(a.getAddress()).isNotNull();
            assertThat(a.getPhone()).isNotNull();
            assertThat(a.getDayOfBirth()).isNotNull();
            assertThat(a.getCreatedDate()).isNotNull();
            assertThat(a.isAvailable()).isNotNull();
            assertThat(a.getRoles().size()).isGreaterThan(0);
        }
    }
}
