package com.aptechfpt.controller;

import com.aptechfpt.bean.AccountFacadeLocal;
import com.aptechfpt.dto.AccountDTO;
import com.aptechfpt.entity.Account;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Kiero
 */
public class AuthenticateController extends HttpServlet {

    @EJB
    private AccountFacadeLocal accountFacade;

    private static final Logger logger = Logger.getLogger(AuthenticateController.class.getName());

    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        if (accountFacade == null) {
            try {
                InitialContext context = new InitialContext();
                accountFacade = (AccountFacadeLocal) context.lookup("java:global/Unify-ear/Unify-ejb-1.0-SNAPSHOT/AccountFacade!com.aptechfpt.bean.AccountFacadeLocal");
            } catch (Exception e) {
                e.printStackTrace(System.err);
            }
        }
        super.service(req, res); //To change body of generated methods, choose Tools | Templates.
    }

    //TODO: Make a log out method here
    //TODO: Register new account here
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
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
        String action = request.getParameter("action");
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
        String uri = (String) request.getAttribute("javax.servlet.forward.request_uri");
        System.out.println("Request URI: " + uri);
        logger.log(Level.INFO, "User Principal: {0}", request.getRemoteUser());
        if (request.getUserPrincipal() != null) {
            try {
                String email = request.getUserPrincipal().getName();
                request.logout();
                logger.log(Level.INFO, "{0} logout successfully", email);
                String homepage = request.getContextPath() + "/";
                response.sendRedirect(homepage);
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
                AccountDTO dto = setDTO(username);
                HttpSession session = request.getSession();
                session.setAttribute("Account", dto);
                String context = request.getContextPath() + "/";
                response.sendRedirect(context);
            } catch (ServletException ex) {
                request.setAttribute("msg", "Login Failed");
                logger.log(Level.INFO, "{0} User: {1} login failed.", new Object[]{AuthenticateController.class.getName(), username});
                request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("msg", "User Already Login");
            logger.log(Level.INFO, "{0} User: {1} login Existed.", new Object[]{AuthenticateController.class.getName(), username});
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        }
    }

    private AccountDTO setDTO(String email) {
        Account account = accountFacade.findByEmail(email);
        AccountDTO dto = new AccountDTO.Builder(account.getAccountId(),account.getEmail())
                .FirstName(account.getFirstName())
                .LastName(account.getLastName())
                .ImageLink(account.getImageLink())
                .build();
        return dto;
    }
}
