package com.aptechfpt.test;

import com.aptechfpt.bean.AccountFacadeLocal;
import com.aptechfpt.controller.AuthenticateController;
import com.aptechfpt.converter.JodaDateTimeConverter;
import com.aptechfpt.dto.AccountDTO;
import com.aptechfpt.entity.Account;
import com.aptechfpt.enumtype.Role;
import com.aptechfpt.mock.AccountFacadeMock;
import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import java.io.File;
import java.net.URL;
import java.util.Enumeration;
import java.util.logging.Level;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.assertj.core.api.Assertions.*;
import org.assertj.core.description.Description;
import org.jboss.arquillian.container.test.api.Deployment;
import org.jboss.arquillian.junit.Arquillian;
import org.jboss.arquillian.test.api.ArquillianResource;
import org.jboss.shrinkwrap.api.Archive;
import org.jboss.shrinkwrap.api.GenericArchive;
import org.jboss.shrinkwrap.api.ShrinkWrap;
import org.jboss.shrinkwrap.api.importer.ExplodedImporter;
import org.jboss.shrinkwrap.api.spec.WebArchive;
import org.jboss.shrinkwrap.resolver.api.maven.Maven;
import org.joda.time.DateTime;
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
    
    @Inject
    private HttpServletRequest request;
    
    @Test
    public void finished_Build() throws Exception{
        assertThat(accountFacade.findById(1).getAccountId()).isEqualTo(1);
    }
    
    @Test
    public void Test_Login() throws Exception {
        request.login("kieron2208@gmail.com", "123456");
        System.out.println("Principal.getName() :" + request.getUserPrincipal().getName());
        System.out.println("getRemoteUser() :" + request.getRemoteUser());
        System.out.println("getAuthType() :" + request.getAuthType());
        System.out.println("User: " + request.isUserInRole(Role.USER.name()));
        System.out.println("SalePerson :" + request.isUserInRole(Role.SALEPERSON.name()));
        System.out.println("Administrator: " + request.isUserInRole(Role.ADMINISTRATOR.name()));
        assertThat(request.isUserInRole(Role.USER.name())).isTrue().as("Is User:");
        assertThat(request.isUserInRole(Role.SALEPERSON.name())).isTrue().as("Is SalePerson:");
        assertThat(request.isUserInRole(Role.ADMINISTRATOR.name())).isFalse().as("Not Admin");
    }

    @Test
    public void Session_Test()throws Exception{
        request.login("kieron2208@gmail.com", "123456");
        HttpSession session = request.getSession();
        AccountDTO dto = setDTO("kieron2208@gmail.com");
        session.setAttribute("Account", dto);
        System.out.println("Creation Time :" + new DateTime(session.getCreationTime()).toString());
        Enumeration<String> attributeNames = session.getAttributeNames();
        while (attributeNames.hasMoreElements()) {
            System.out.println("GetAttributeNames :" + attributeNames.nextElement());
        }
        System.out.println("GetLastAccessTime :" + new DateTime(session.getLastAccessedTime()).toString());
        System.out.println("GetID :" + session.getId());
        System.out.println("getMaxINactiveInternal :" + session.getMaxInactiveInterval());
    }
    private static GenericArchive metaInfFolder() {
        return ShrinkWrap.create(GenericArchive.class)
                .as(ExplodedImporter.class)
                .importDirectory(WEBAPP_SRC)
                .as(GenericArchive.class);
    }
    
    private AccountDTO setDTO(String email) {
        Account account = accountFacade.findByEmail(email);
        AccountDTO dto = new AccountDTO.Builder(account.getAccountId(),account.getEmail())
                .ImageLink(account.getImageLink())
                .build();
        return dto;
    }
}
