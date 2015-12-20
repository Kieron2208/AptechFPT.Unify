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
        context.log(this.getClass().getName() + " initial is called");
        context.setAttribute("initMsg", "Testing Listenter");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        
    }
}
