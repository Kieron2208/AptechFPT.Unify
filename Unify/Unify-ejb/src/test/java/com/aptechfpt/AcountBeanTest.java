/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptechfpt;

import com.aptechfpt.bean.AccountFacadeLocal;
import com.aptechfpt.entity.Account;
import java.io.File;
import java.util.List;
import javax.ejb.EJB;
import javax.inject.Inject;
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
import org.junit.runner.RunWith;

/**
 *
 * @author Kiero
 */
@RunWith(Arquillian.class)
public class AcountBeanTest {
    
//    @EJB
//    private AccountFacadeLocal accountFacadeLocal;
    
    @Deployment
    public static Archive<?> deploy() {
        File[] libraries = Maven.resolver().loadPomFromFile("pom.xml")
                .resolve("com.microsoft.sqlserver:sqljdbc4"
                        ,"org.assertj:assertj-core")
                .withTransitivity()
                .asFile();
//        File file =new File("src/main/setup/glassfish-resources.xml");
//        System.out.println("file existed: " + file.exists());
//        System.out.println("file dir: " + file.getAbsolutePath());
        WebArchive war = ShrinkWrap.create(WebArchive.class)
                .addPackage("com.aptechfpt.bean")
                .addPackage("com.aptechfpt.entity")
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
    public void should_bean_be_injected() throws Exception{
        List<Account> findAll = accountFacadeLocal.findAll();
        System.out.println(findAll.size());
        assertThat(findAll).isNotNull();
    }
    
}
