/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptechfpt.listener;

import com.aptechfpt.controller.ProductController;
import java.util.EnumSet;
import javax.servlet.DispatcherType;
import javax.servlet.FilterRegistration;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletRegistration;
import javax.servlet.annotation.WebListener;
import org.tuckey.web.filters.urlrewrite.UrlRewriteFilter;
import org.tuckey.web.filters.urlrewrite.gzip.GzipFilter;

/**
 * Web application lifecycle listener.
 *
 * @author Kiero
 */
public class InitContextServletListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        FilterRegistration urlrewrite = context.addFilter("UrlRewriteFilter", UrlRewriteFilter.class);
        urlrewrite.addMappingForUrlPatterns(EnumSet.of(DispatcherType.REQUEST, DispatcherType.FORWARD), true, "/*");
        urlrewrite.setInitParameter("confPath", "WEB-INF/urlrewrite.xml");
        urlrewrite.setInitParameter("logLevel", "DEBUG");
        ServletRegistration.Dynamic servlet = context.addServlet("ProductController", ProductController.class);
        String realPath = context.getRealPath("");
        servlet.setMultipartConfig(new MultipartConfigElement(realPath + ""));
        FilterRegistration gzip = context.addFilter("GZipFilter", GzipFilter.class);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        
    }
}
