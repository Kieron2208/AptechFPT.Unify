/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptechfpt.test;

import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.HttpMethod;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.WebRequest;
import com.gargoylesoftware.htmlunit.WebResponse;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import java.net.URL;
import static org.assertj.core.api.Assertions.*;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

/**
 *
 * @author Kiero
 */
public class AccountServletTest {

    private static String base = "http://localhost:8080/Unify-web";
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
    public void Login_to_Page_Test() throws Exception {
        String body = "txtEmail=admin@yourstore.com&txtPassword=123456";
        WebRequest request = new WebRequest(new URL(base + "/login"), HttpMethod.POST);
        request.setRequestBody(body);
        WebResponse response = webClient.getWebConnection().getResponse(request);
        String responseText = response.getContentAsString();
        System.out.println("Response: " + responseText);
        assertThat(response.getStatusCode()).isEqualTo(200);
    }

    @Test
    public void Login_Failed_test() throws Exception {
        String body = "txtEmail=admin@yourstore.com&txtPassword=12345";
        WebRequest request = new WebRequest(new URL(base + "/login"), HttpMethod.POST);
        request.setRequestBody(body);
        WebResponse response = webClient.getWebConnection().getResponse(request);
        String responseText = response.getContentAsString();
        System.out.println("Response: " + responseText);
        assertThat(response.getStatusCode()).isEqualTo(200);
    }

    @Test
    public void Login_Failed_to_Admin_Page_test() throws Exception {
        HtmlPage page = webClient.getPage(base + "/admin");
        String title = page.getTitleText();
        System.out.println("Response: " + title);
        assertThat(page.getWebResponse().getStatusCode()).isEqualTo(200);
        assertThat(page.getUrl().toString()).isEqualTo(base + "/admin/login");

    }
}
