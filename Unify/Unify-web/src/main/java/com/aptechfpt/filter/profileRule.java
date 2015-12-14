package com.aptechfpt.filter;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.tuckey.web.filters.urlrewrite.extend.RewriteMatch;
import org.tuckey.web.filters.urlrewrite.extend.RewriteRule;
import org.tuckey.web.filters.urlrewrite.utils.Log;

/**
 *
 * @author Kiero
 */
public class profileRule extends RewriteRule {

    private static Log log = Log.getLog(profileRule.class);

    @Override
    public RewriteMatch matches(HttpServletRequest request, HttpServletResponse response) {
        String uri = request.getRequestURI();
        String contextPath = request.getContextPath();
        if (log.isDebugEnabled()) {
            log.debug("run called with " + uri);
        }
        if (uri.startsWith(contextPath + "/profile") && request.getMethod().equalsIgnoreCase("GET")) {
            if (request.getRemoteUser() != null) {
                if (uri.equals(contextPath + "/profile/currentorder")) {
                    if (log.isDebugEnabled()) {
                        log.debug(contextPath + "/profile/currentorder matched");
                    }
                    return new RewriteMatch() {
                        @Override
                        public boolean execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                            request.getRequestDispatcher("/WEB-INF/profileCurrentOrder.jsp").forward(request, response);
                            return true;
                        }
                    };
                }
                if (uri.equals(contextPath + "/profile/orderhistory")) {
                    if (log.isDebugEnabled()) {
                        log.debug(contextPath + "/profile/orderhistory matched");
                    }
                    return new RewriteMatch() {
                        @Override
                        public boolean execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                            request.getRequestDispatcher("/WEB-INF/profileHistory.jsp").forward(request, response);
                            return true;
                        }
                    };
                }
                if (uri.equals(contextPath + "/profile/feedback")) {
                    if (log.isDebugEnabled()) {
                        log.debug(contextPath + "/profile/feedback matched");
                    }
                    return new RewriteMatch() {
                        @Override
                        public boolean execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                            request.getRequestDispatcher("/WEB-INF/profileFeedBack.jsp").forward(request, response);
                            return true;
                        }
                    };
                }
                if (uri.equals(contextPath + "/profile/mycomment")) {
                    if (log.isDebugEnabled()) {
                        log.debug(contextPath + "/profile/mycomment matched");
                    }
                    return new RewriteMatch() {
                        @Override
                        public boolean execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                            request.getRequestDispatcher("/WEB-INF/profileComment.jsp").forward(request, response);
                            return true;
                        }
                    };
                }
                if (log.isDebugEnabled()) {
                    log.debug(contextPath + "/profile matched");
                }
                return new RewriteMatch() {
                    @Override
                    public boolean execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                        request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
                        return true;
                    }
                };
            } else {
                return new RewriteMatch() {
                    @Override
                    public boolean execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                        response.sendRedirect(request.getContextPath() + "/");
                        return true;
                    }
                };
            }
        }
        return null;
    }

}
