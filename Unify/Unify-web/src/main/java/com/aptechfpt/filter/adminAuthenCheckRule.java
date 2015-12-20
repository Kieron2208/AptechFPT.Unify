package com.aptechfpt.filter;

import com.aptechfpt.enumtype.Role;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.tuckey.web.filters.urlrewrite.extend.RewriteMatch;
import org.tuckey.web.filters.urlrewrite.extend.RewriteRule;
import org.tuckey.web.filters.urlrewrite.utils.Log;

/**
 *
 * @author Kiero
 */
public class adminAuthenCheckRule extends RewriteRule{

    private static Log log = Log.getLog(adminAuthenCheckRule.class);
    
    @Override
    public RewriteMatch matches(HttpServletRequest request, HttpServletResponse response) {
        String uri = request.getRequestURI();
        String contextPath = request.getContextPath();
        if (log.isDebugEnabled()) {
            log.debug("run called with " + uri);
        }
        if (checkUser(uri, request)) {
            
        }
        return null;
    }

    private static boolean checkUser(String uri, HttpServletRequest request) {
        boolean isAuthenticate = false;
        
        if (uri.startsWith(request.getContextPath() + "/administrator")) {
            
        }
        if (request.isUserInRole(Role.ADMINISTRATOR.name())) {
            
        }
        if (request.isUserInRole(Role.SALEPERSON.name())) {
            
        }
        return isAuthenticate;
    }
    
}
