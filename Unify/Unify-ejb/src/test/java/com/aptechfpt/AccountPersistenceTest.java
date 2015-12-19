/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptechfpt;

import com.aptechfpt.converter.JodaDateTimeConverter;
import com.aptechfpt.dto.AccountDTO;
import com.aptechfpt.entity.Account;
import java.io.File;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;
import javax.persistence.Column;
import javax.persistence.ColumnResult;
import javax.persistence.ConstructorResult;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityResult;
import javax.persistence.FieldResult;
import javax.persistence.Id;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.SqlResultSetMapping;
import javax.persistence.TypedQuery;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;
import org.eclipse.persistence.jpa.JpaQuery;
import org.jboss.arquillian.container.test.api.Deployment;
import org.jboss.arquillian.junit.Arquillian;
import org.jboss.shrinkwrap.api.Archive;
import org.jboss.shrinkwrap.api.GenericArchive;
import org.jboss.shrinkwrap.api.ShrinkWrap;
import org.jboss.shrinkwrap.api.importer.ExplodedImporter;
import org.jboss.shrinkwrap.api.spec.WebArchive;
import org.jboss.shrinkwrap.resolver.api.maven.Maven;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.assertj.core.api.Assertions.*;
import org.joda.time.DateTime;
import org.junit.runner.RunWith;

/**
 *
 * @author Kiero
 */
@RunWith(Arquillian.class)
public class AccountPersistenceTest implements Serializable {

    private static final String WEBAPP_SRC = "src/main/webapp";

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
                .addClass(HighSale.class)
                //                .addAsManifestResource(file,"glassfish-resources.xml")
                .addAsResource("META-INF/persistence.xml")
                .addAsLibraries(libraries);
        System.out.println("EJB folder structure: ");
        System.out.println(war.toString(true));

        return war;
    }
    @PersistenceContext
    private EntityManager em;

    @Inject
    private UserTransaction utx;

    @Test
    public void Get_All_List() throws Exception {
        String JpqlString = "SELECT a FROM Account a WHERE a.accountId NOT IN (1)";
        List<Account> accounts = queryResultList(JpqlString);
        System.out.println("Found " + accounts.size() + " accounts (using JPQL):");
        assertAccountListNotNull(accounts);
    }

    @Test
    public void Get_Without_Admin_And_SalePerson() throws Exception {
        String JpqlString = "SELECT a FROM Account a WHERE a.accountId IN (SELECT a.accountId FROM Account a WHERE a.roles = 'ADMINISTRATOR' OR a.roles = 'SALEPERSON')";
        String sqlString = "SELECT [AccountId]\n"
                + "      ,a.[Email]\n"
                + "      ,[Password]\n"
                + "      ,[ImageLink]\n"
                + "      ,[FirstName]\n"
                + "      ,[LastName]\n"
                + "      ,[Phone]\n"
                + "      ,[Address]\n"
                + "      ,[Gender]\n"
                + "      ,[DayOfBirth]\n"
                + "      ,[CreatedDate]\n"
                + "      ,[isAvailable] FROM [Account] a INNER JOIN [AccountRole] r ON a.[Email] = r.[Email] WHERE [AccountId] IN\n"
                + "  (SELECT [AccountId] FROM [Account] a INNER JOIN [AccountRole] r ON a.[Email] = r.[Email] EXCEPT\n"
                + "  (SELECT [AccountId] FROM [Account] a INNER JOIN [AccountRole] r ON a.[Email] = r.[Email] \n"
                + "  WHERE r.Role = 'SALEPERSON' OR r.Role = 'ADMINISTRATOR'))";
        List<Account> accounts = nativeQueryResultList(sqlString);
        System.out.println("Found " + accounts.size() + " accounts (using JPQL):");
        assertAccountListNotNull(accounts);
        assertThat(accounts.size()).isEqualTo(98);
    }

    @Test
    public void Get_Without_Admin_And_SalePerson_2() throws Exception {
        String JpqlString = "SELECT a FROM Account a WHERE a.accountId IN (SELECT a.accountId FROM Account a WHERE a.roles = 'ADMINISTRATOR' OR a.roles = 'SALEPERSON')";
        em.createQuery("SELECT a FROM Account a WHERE a.email NOT IN (SELECT a.email FROM a.roles AS r WHERE r.)");
        List<Account> accounts = nativeQueryResultList(JpqlString);
        System.out.println("Found " + accounts.size() + " accounts (using JPQL):");
        assertAccountListNotNull(accounts);
        assertThat(accounts.size()).isEqualTo(98);
    }

    private List<Account> queryResultList(String JpqlString) {
        List<Account> accounts = new ArrayList<>();
        try {
            utx.begin();
            em.joinTransaction();
            long start = System.currentTimeMillis();
            System.out.println("Selecting (using JPQL)...");
            TypedQuery<Account> q = em.createQuery(JpqlString, Account.class);
            String sql = q.unwrap(JpaQuery.class).getDatabaseQuery().getSQLString();
            System.out.println("JPA Query String: " + sql);
            accounts = q.getResultList();
            long end = System.currentTimeMillis();
            utx.commit();
            em.clear();
            DateTime elapsed = new DateTime(end - start);
            System.out.println("Total time run: " + elapsed.toString("mm:ss.SSS"));
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
        return accounts;
    }

    private List<Account> nativeQueryResultList(String JpqlString) {
        List<Account> accounts = new ArrayList<>();
        try {
            utx.begin();
            em.joinTransaction();
            long start = System.currentTimeMillis();
            System.out.println("Selecting (using JPQL)...");
            Query q = em.createNativeQuery(JpqlString, Account.class);
            String sql = q.unwrap(JpaQuery.class).getDatabaseQuery().getSQLString();
            System.out.println("JPA Query String: " + sql);
            accounts = q.getResultList();
            long end = System.currentTimeMillis();
            utx.commit();
            em.clear();
            DateTime elapsed = new DateTime(end - start);
            System.out.println("Total time run: " + elapsed.toString("mm:ss.SSS"));
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
        return accounts;
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
//    private static GenericArchive metaInfFolder() {
//        return ShrinkWrap.create(GenericArchive.class)
//                .as(ExplodedImporter.class)
//                .importDirectory(WEBAPP_SRC + "/WEB-INF")
//                .as(GenericArchive.class);
//    }

    @Test
    public void Get_Highest_Sale() {
        List<HighSale> list = new ArrayList<>();
        try {
            utx.begin();
            em.joinTransaction();
            long start = System.currentTimeMillis();
            System.out.println("Selecting (using JPQL)...");
            String sql = "SELECT TOP 10 SUM(r.Quantity) AS Quantity, r.Name AS ProductName \n"
                    + "  FROM (SELECT p.Name, pod.Quantity, pod.PurchaseOrderId FROM [Unify].[dbo].[Product] p INNER JOIN [Unify].[dbo].[PurchaseOrderDetail] pod ON p.ProductId = pod.ProductId) r \n"
                    + "  INNER JOIN [Unify].[dbo].[PurchaseOrder] po ON r.PurchaseOrderId = po.PurchaseOrderId WHERE po.CreatedDate >= ?1 AND po.CreatedDate <= ?2 GROUP BY r.Name ORDER BY Quantity DESC";
            Query q = em.createNativeQuery(sql);
            q.setParameter(1, "2015-12-01");
            q.setParameter(2, "2015-12-30");
            List<Object[]> result = q.getResultList();
            for (Object[] col : result) {
                System.out.println("Col 1: " + col[0].toString());
                System.out.println("Col 2: " + col[1].toString());
                HighSale sale = new HighSale();
                sale.quantity = (Integer) col[0];
                sale.productName = (String) col[1];
                list.add(sale);
            }
//            Query q = em.createNativeQuery(sql, HighSale.class);
//            list = q.getResultList();
            System.out.println("Number of result found: " + list.size());
            long end = System.currentTimeMillis();
            utx.commit();
            em.clear();
            DateTime elapsed = new DateTime(end - start);
            System.out.println("Total time run: " + elapsed.toString("mm:ss.SSS"));
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
        for (HighSale s : list) {
            System.out.println("ProductId: " + s.productName);
            System.out.println("Quantity: " + s.quantity);
        }

        assertThat(list.size()).isEqualTo(10);
    }

}
