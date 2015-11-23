/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptechfpt;

import com.aptechfpt.controller.HomeController;
import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.Page;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import java.io.File;
import java.net.URL;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.assertj.core.api.Assertions.*;
import org.jboss.arquillian.container.test.api.Deployment;
import org.jboss.arquillian.junit.Arquillian;
import org.jboss.arquillian.test.api.ArquillianResource;
import org.jboss.shrinkwrap.api.Archive;
import org.jboss.shrinkwrap.api.GenericArchive;
import org.jboss.shrinkwrap.api.ShrinkWrap;
import org.jboss.shrinkwrap.api.importer.ExplodedImporter;
import org.jboss.shrinkwrap.api.spec.WebArchive;
import org.jboss.shrinkwrap.resolver.api.maven.Maven;
import org.junit.runner.RunWith;

/**
 *
 * @author Kiero
 */
//Run Glassfish server trước khi chạy test
@RunWith(Arquillian.class)
public class RoutingtoPageTest {

    private static final String WEBAPP_SRC = "src/main/webapp";

    @ArquillianResource
    private URL base;

    private static WebClient webClient;

    @Deployment(testable = false)
    public static Archive<?> createDeployment() {
        //NOTE: Unify-ejb cần có trong maven local repository. Để giải quyết deploy Unify-ejb trước
        File[] libs = Maven.resolver()
                .loadPomFromFile("pom.xml")
                .resolve("org.tuckey:urlrewritefilter",
                         "net.sourceforge.htmlunit:htmlunit",
                         "org.assertj:assertj-core")
                .withTransitivity()
                .asFile();

        WebArchive war = ShrinkWrap.create(WebArchive.class, "UnifyTest.war")
                .addClass(HomeController.class)
                .merge(metaInfFolder(),"WEB-INF")
                .addAsLibraries(libs);

        System.out.println("Folder Structure: ");
        System.out.println(war.toString(true));
        return war;
    }

    @BeforeClass
    public static void setUpClass() {
        webClient = new WebClient(BrowserVersion.CHROME);
    }

    @AfterClass
    public static void tearDownClass() {
        webClient.close();
    }

    @Test
    public void should_go_to_Homepage() throws Exception{
        //Arrange
        System.out.println("Testing Homepage Routing.");
        //Act
        HtmlPage page = webClient.getPage(base);
        //Assert
        assertThat(page.getWebResponse().getStatusCode()).isEqualTo(200);
    }

    @Test
    public void should_go_to_LoginPage()throws Exception{
        //Arrange
        System.out.println("go to route http://localhost/login");
        //Act
        HtmlPage page = webClient.getPage(base + "/login");
        //Assert
        assertThat(page.getWebResponse().getStatusCode()).isEqualTo(200);
    }

    private static GenericArchive metaInfFolder() {
        return ShrinkWrap.create(GenericArchive.class)
            .as(ExplodedImporter.class)
            .importDirectory(WEBAPP_SRC + "/WEB-INF")
            .as(GenericArchive.class);
    }
}
