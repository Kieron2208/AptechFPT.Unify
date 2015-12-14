/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptechfpt;

import com.aptechfpt.bean.AbstractFacade;
import com.aptechfpt.bean.AccountFacade;
import com.aptechfpt.bean.AccountFacadeLocal;
import com.aptechfpt.entity.Account;
import java.io.File;
import javax.annotation.Resource;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.sql.DataSource;
import javax.transaction.UserTransaction;
import org.jboss.arquillian.container.test.api.Deployment;
import org.jboss.arquillian.junit.Arquillian;
import org.jboss.shrinkwrap.api.Archive;
import org.jboss.shrinkwrap.api.ShrinkWrap;
import org.jboss.shrinkwrap.api.spec.JavaArchive;
import org.jboss.shrinkwrap.api.spec.WebArchive;
import org.jboss.shrinkwrap.resolver.api.maven.Maven;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.assertj.core.api.Assertions.*;
import org.jboss.shrinkwrap.api.ArchivePath;
import org.jboss.shrinkwrap.api.importer.ZipImporter;
import org.junit.runner.RunWith;

/**
 *
 * @author Kiero
 */
@RunWith(Arquillian.class)
public class DataResourcesTest {

    private static String RESOURCES_DIR = "src/main/resources";

    @Deployment
    public static Archive<?> deploy() {
        File[] libraries = Maven.resolver().loadPomFromFile("pom.xml")
                .resolve("com.microsoft.sqlserver:sqljdbc4")
                .withTransitivity()
                .asFile();
        JavaArchive war = ShrinkWrap.create(JavaArchive.class, "ejbTest.jar")
                .addAsResource("META-INF/persistence.xml");
        mergeDependencies(war, libraries);
        System.out.println("EJB folder structure: ");
        System.out.println(war.toString(true));

        return war;
    }

    @Resource
    private DataSource dataSource;

    @Test
    public void should_bean_be_injected() throws Exception {
        assertNotNull(dataSource);
        assertNotNull(dataSource.getConnection());
    }

    private static void mergeDependencies(JavaArchive archive, File... dependencies) {
        for (File file : dependencies) {
            archive.merge(ShrinkWrap.createFromZipFile(JavaArchive.class, file));
        }
    }
}
