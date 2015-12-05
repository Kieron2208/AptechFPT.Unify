package com.aptechfpt.test;

import com.aptechfpt.bean.AccountFacadeLocal;
import com.aptechfpt.converter.JodaDateTimeConverter;
import com.aptechfpt.dto.AccountDTO;
import com.aptechfpt.mock.AccountFacadeMock;
import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import java.io.File;
import java.net.URL;
import javax.inject.Inject;
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
@RunWith(Arquillian.class)
public class AccountControllerTest {

    private static final String WEBAPP_SRC = "src/main/webapp";

    @Deployment
    public static Archive<?> deploy() {
        File[] libraries = Maven.resolver().loadPomFromFile("pom.xml")
                .importCompileAndRuntimeDependencies()
                .resolve("org.assertj:assertj-core")
                .withTransitivity()
                .asFile();

        WebArchive war = ShrinkWrap.create(WebArchive.class, "Unify-web-test.war")
                .addClass(AccountFacadeLocal.class)
                .addClass(AccountFacadeMock.class)
                .addClass(JodaDateTimeConverter.class)
                .addClass(AccountDTO.class)
                .addPackage("com.aptechfpt.entity")
                .addPackage("com.aptechfpt.controller")
                //                .addAsManifestResource(file,"glassfish-resources.xml")
                .merge(metaInfFolder())
                .addAsLibraries(libraries);
        System.out.println("Unify-web-test War folder structure: ");
        System.out.println(war.toString(true));

        return war;
    }
    @ArquillianResource
    private URL url;
    
    @Inject
    private AccountFacadeLocal accountFacade;
    
    @Test
    public void finished_Build() throws Exception{
        assertThat(accountFacade.findById(1).getAccountId()).isEqualTo(1);
    }
    
    @Test
    public void Test_Mocking_EJB() throws Exception{
        assertThat(1).isEqualTo(1);
    }

    private static GenericArchive metaInfFolder() {
        return ShrinkWrap.create(GenericArchive.class)
                .as(ExplodedImporter.class)
                .importDirectory(WEBAPP_SRC)
                .as(GenericArchive.class);
    }
}
