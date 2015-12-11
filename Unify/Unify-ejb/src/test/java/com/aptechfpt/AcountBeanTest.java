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
                .importCompileAndRuntimeDependencies()
                .resolve("org.assertj:assertj-core")
                .withTransitivity()
                .asFile();
                
        WebArchive war = ShrinkWrap.create(WebArchive.class,"AccountTest.war")
                .addPackage("com.aptechfpt.bean")
                .addPackage("com.aptechfpt.entity")
                .addPackage("com.aptechfpt.converter")
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
        for (Account account : findAll) {
            System.out.println("Email: " + account.getEmail());
            System.out.println("Date Of Birth: " + account.getDayOfBirth().toString());
            System.out.println("Created Date : " + account.getCreatedDate().toString());
        }
        assertThat(findAll).isNotNull();
    }
    
}
