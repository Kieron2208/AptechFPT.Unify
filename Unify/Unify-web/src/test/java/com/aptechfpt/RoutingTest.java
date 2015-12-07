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
//Chạy test không cần Arquillian
public class RoutingTest {
    private static String base = "http://localhost:8080/Unify-web-test";
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
    public void should_go_to_Homepage() throws Exception{
        //Arrange
        System.out.println("Testing Homepage Routing.");
        //Act
        HtmlPage page = webClient.getPage(base);
        String title = page.getTitleText();
        //Assert
        assertThat(page.getWebResponse().getStatusCode()).isEqualTo(200);
        assertThat(title).isEqualTo("Shop UI");
    }
    
    @Test
    public void should_go_to_SignIn()throws Exception{
        //Arrange
        System.out.println("Testing Login Routing.");
        //Act
        HtmlPage page = webClient.getPage(base + "/login");
        String title = page.getTitleText();
        //Assert
        assertThat(page.getWebResponse().getStatusCode()).isEqualTo(200);
        assertThat(title).isEqualTo("Shop UI - Login Page");
    }
    
    @Test
    public void should_go_to_SignUp()throws Exception{
        //Arrange
        System.out.println("Testing Register Routing.");
        //Act
        HtmlPage page = webClient.getPage(base + "/register");
        String title = page.getTitleText();
        //Assert
        assertThat(page.getWebResponse().getStatusCode()).isEqualTo(200);
        assertThat(title).isEqualTo("Shop-UI Register");
    }

    @Test
    public void should_go_to_Profile_Page()throws Exception{
        //Arrange
        System.out.println("Testing ProfilePage Routing.");
        //Act
        HtmlPage page = webClient.getPage(base + "/profile");
        String title = page.getTitleText();
        //Assert
        assertThat(page.getWebResponse().getStatusCode()).isEqualTo(200);
        assertThat(title).isEqualTo("Shop UI - Profile");
    }

    @Test
    public void should_go_to_ProductGrid()throws Exception{
        //Arrange
        System.out.println("Testing ProductGrid Routing.");
        //Act
        HtmlPage page = webClient.getPage(base + "/product");
        String title = page.getTitleText();
        //Assert
        assertThat(page.getWebResponse().getStatusCode()).isEqualTo(200);
        assertThat(title).isEqualTo("Shop UI - Product Grid");
    }
    
    @Test
    public void should_go_to_ProductDetail()throws Exception{
        //Arrange
        System.out.println("Testing Product Detail Routing.");
        //Act
        HtmlPage page = webClient.getPage(base + "/product/1");
        String title = page.getTitleText();
        //Assert
        assertThat(page.getWebResponse().getStatusCode()).isEqualTo(200);
        assertThat(title).isEqualTo("Shop UI - Product Detail");
    }

    @Test
    public void should_go_to_CheckOut()throws Exception{
        //Arrange
        System.out.println("Testing checkout Routing.");
        //Act
        HtmlPage page = webClient.getPage(base + "/checkout");
        String title = page.getTitleText();
        //Assert
        assertThat(page.getWebResponse().getStatusCode()).isEqualTo(200);
        assertThat(title).isEqualTo("Shop UI - Checkout");
    }
}
