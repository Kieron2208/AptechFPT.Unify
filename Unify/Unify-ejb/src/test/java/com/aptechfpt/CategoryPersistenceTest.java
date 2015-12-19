/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptechfpt;

import com.aptechfpt.entity.Account;
import com.aptechfpt.entity.Category;
import com.aptechfpt.entity.SubCategory;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.UserTransaction;
import org.eclipse.persistence.jpa.JpaQuery;
import org.jboss.arquillian.container.test.api.Deployment;
import org.jboss.arquillian.junit.Arquillian;
import org.jboss.shrinkwrap.api.Archive;
import org.jboss.shrinkwrap.api.ShrinkWrap;
import org.jboss.shrinkwrap.api.spec.WebArchive;
import org.jboss.shrinkwrap.resolver.api.maven.Maven;
import org.joda.time.DateTime;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.runner.RunWith;

/**
 *
 * @author Kiero
 */
@RunWith(Arquillian.class)
public class CategoryPersistenceTest {

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
    public void hello() {
        String JpqlString = "SELECT a FROM Category a";
        List<Category> categories = queryResultList(JpqlString);
        System.out.println("MEN: ");
        for (Category c : categories) {
            System.out.println("\tCategory");
            System.out.println("\tId: " + c.getCategoryId());
            System.out.println("\tName: " + c.getName());
            for (SubCategory sub : c.getSubCategoryCollection()) {
                System.out.println("\t\tSubcategory: ");
                System.out.println("\t\tId: "+ sub.getSubCategoryId());
                System.out.println("\t\tName: " + sub.getName());
            }
        }
    }
    
    private List<Category> queryResultList(String JpqlString) {
        List<Category> categories = new ArrayList<>();
        try {
            utx.begin();
            em.joinTransaction();
            long start = System.currentTimeMillis();
            System.out.println("Selecting (using JPQL)...");
            TypedQuery<Category> q = em.createQuery(JpqlString, Category.class);
            String sql = q.unwrap(JpaQuery.class).getDatabaseQuery().getSQLString();
            System.out.println("JPA Query String: " + sql);
            categories = q.getResultList();
            long end = System.currentTimeMillis();
            utx.commit();
            em.clear();
            DateTime elapsed = new DateTime(end - start);
            System.out.println("Total time run: " + elapsed.toString("mm:ss.SSS"));
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
        return categories;
    }
}
