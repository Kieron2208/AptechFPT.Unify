/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptechfpt;

import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.Page;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.assertj.core.api.Assertions.*;

/**
 *
 * @author Kiero
 */
public class AdminRoutingTest {

    private static String base = "http://localhost:8080/Unify-web/administrator";
    private static WebClient webClient;

    @BeforeClass
    public static void setUpClass() {
        webClient = new WebClient(BrowserVersion.CHROME);
        webClient.getOptions().setThrowExceptionOnScriptError(false);
        webClient.getOptions().setCssEnabled(false);
        webClient.getOptions().setAppletEnabled(false);
    }

    @AfterClass
    public static void tearDownClass() {
        webClient.close();
    }

    @Test
    public void should_go_to_Admin_Homepage() throws Exception{
        //Arrange
        System.out.println("Testing Admin Homepage Routing.");
        //Act
        HtmlPage page = webClient.getPage(base);
        String title = page.getTitleText();
        //Assert
        assertThat(page.getWebResponse().getStatusCode()).isEqualTo(200);
        assertThat(title).isEqualTo("Shop UI - AdminPage");
    }

    @Test
    public void should_go_to_Admin_Login() throws Exception{
        //Arrange
        System.out.println("Testing Admin Login Routing.");
        //Act
        HtmlPage page = webClient.getPage(base + "/login");
        String title = page.getTitleText();
        //Assert
        assertThat(page.getWebResponse().getStatusCode()).isEqualTo(200);
        assertThat(title).isEqualTo("Shop UI - Admin Login");
    }

    @Test
    public void should_go_to_Admin_User() throws Exception{
        //Arrange
        System.out.println("Testing Admin User Routing.");
        //Act
        HtmlPage page = webClient.getPage(base + "/user");
        String title = page.getTitleText();
        //Assert
        assertThat(page.getWebResponse().getStatusCode()).isEqualTo(200);
        assertThat(title).isEqualTo("Shop UI - AdminPage - User Management");
    }
    
    @Test
    public void should_go_to_Admin_CreateUser() throws Exception{
        //Arrange
        System.out.println("Testing Admin User Routing.");
        //Act
        HtmlPage page = webClient.getPage(base + "/user/new");
        String title = page.getTitleText();
        //Assert
        assertThat(page.getWebResponse().getStatusCode()).isEqualTo(200);
        assertThat(title).isEqualTo("Shop UI - AdminPage - Create New User");
    }
}
