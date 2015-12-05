package com.aptechfpt.controller;

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
public class AuthenticateController extends HttpServlet {

    private static final Logger logger = Logger.getLogger(AuthenticateController.class.getName());

    //TODO: Make a log out method here
    //TODO: Register new account here
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = (String) request.getAttribute("action");
        switch (action) {
            case "logout":
                logger.log(Level.INFO, "Go to: {0} method.", action);
                logout(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = (String) request.getAttribute("action");
        switch (action) {
            case "login":
                login(request, response);
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Use for authentication and authorization service";
    }

    private void logout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        logger.log(Level.INFO, "User Principal: {0}", request.getUserPrincipal().getName());
        if (request.getUserPrincipal() == null) {
            try {
                request.logout();
                logger.log(Level.INFO, "{0} logout successfully", request.getUserPrincipal().getName());
            } catch (ServletException ex) {
                ex.printStackTrace(System.err);
                logger.info("Loggout failed.");
            }
        } else {
            logger.log(Level.INFO, "User hadn't login yet.");
        }
    }

    //TODO: complete request login here
    private void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("txtEmail");
        String password = request.getParameter("txtPassword");
        logger.log(Level.INFO, "Login with UserName: {0} Password: {1}", new Object[]{username, password});
        if (request.getUserPrincipal() == null) {
            try {
                request.login(username, password);
                logger.log(Level.INFO, "{0} User: {1} login successfull", new Object[]{AuthenticateController.class.getName(), username});
                response.sendRedirect(request.getContextPath() + "/admin");
            } catch (ServletException ex) {
                request.setAttribute("msg", "Login Failed");
                logger.log(Level.INFO, "{0} User: {1} login failed.", new Object[]{AuthenticateController.class.getName(), username});
                request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("msg", "User Already Login");
            logger.log(Level.INFO, "{0} User: {1} login Existed.", new Object[]{AuthenticateController.class.getName(), username});
            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
        }
    }
}
