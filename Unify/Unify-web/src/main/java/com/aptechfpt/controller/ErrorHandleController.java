package com.aptechfpt.controller;

import com.aptechfpt.enumtype.Role;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kiero
 */
public class ErrorHandleController extends HttpServlet {

    private static final Logger logger = Logger.getLogger(ErrorHandleController.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        logger.log(Level.INFO, "Error 404: cannot found path{0}", request.getAttribute("javax.servlet.error.request_uri"));
        int statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
        switch (statusCode) {
            case 404:
                catch404status(request, response);
                break;
            case 500:
                catch500status(request, response);
                break;
        }
    }

    private void catch404status(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String errorURI = (String) request.getAttribute("javax.servlet.error.request_uri");
        String contextPath = request.getContextPath();
//        throw new RuntimeException("Testing 500");
        if (errorURI.startsWith(contextPath + "/administrator")) {
            adminErrorHandler(request, response);
        }
        if (errorURI.startsWith(contextPath)) {
            request.getRequestDispatcher("/WEB-INF/404.jsp").forward(request, response);
        }
    }

    private void adminErrorHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.isUserInRole(Role.ADMINISTRATOR.name())
                || request.isUserInRole(Role.SALEPERSON.name())) {
            request.getRequestDispatcher("/WEB-INF/admin/404.jsp").forward(request, response);
        } else {
            String des = request.getContextPath() + "/administrator/login";
            response.sendRedirect(des);
        }
    }

    private void catch500status(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String errorURI = (String) request.getAttribute("javax.servlet.error.request_uri");
        String contextPath = request.getContextPath();
        if (errorURI.startsWith(contextPath + "/administrator")) {
            request.getRequestDispatcher("/WEB-INF/admin/500.jsp").forward(request, response);
        }
        if (errorURI.startsWith(contextPath)) {
            request.getRequestDispatcher("/WEB-INF/500.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
