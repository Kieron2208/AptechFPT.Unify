package com.aptechfpt.controller;

import com.aptechfpt.bean.AccountFacadeLocal;
import com.aptechfpt.dto.AccountDTO;
import com.aptechfpt.entity.Account;
import com.aptechfpt.enumtype.Role;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Set;
import javax.ejb.EJB;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.joda.time.format.DateTimeFormat;

/**
 *
 * @author Kiero
 */
public class AdminProfileController extends HttpServlet {

    @EJB
    private AccountFacadeLocal accountFacade;

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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "profile":
                profile(request, response);
                break;
            case "detail":
                detail(request, response);
                break;
        }
    }

    private void profile(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        AccountDTO dto = (AccountDTO) session.getAttribute("Account");
        Account account = accountFacade.findById(dto.getAccountId());
        request.setAttribute("account", account);
        request.getRequestDispatcher("/WEB-INF/admin/userprofile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void detail(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        AccountDTO dto = (AccountDTO) session.getAttribute("Account");
        Account ac = accountFacade.findById(dto.getAccountId());
        StringBuilder builder = new StringBuilder();
        builder.append("{")
                .append("\"id\":\"").append(ac.getAccountId()).append("\",")
                .append("\"email\":\"").append(ac.getEmail()).append("\",")
                .append("\"firstName\":\"").append(ac.getFirstName()).append("\",")
                .append("\"lastName\":\"").append(ac.getLastName()).append("\",")
                .append("\"avatar\":").append("null").append(",")
                .append("\"imgLink\":\"").append(request.getContextPath()).append(ac.getImageLink()).append("\",")
                .append("\"phone\":\"").append(ac.getPhone()).append("\",")
                .append("\"gender\":\"").append(ac.getGender()).append("\",")
                .append("\"address\":\"").append(ac.getAddress()).append("\",")
                .append("\"dateOfBirth\":\"").append(ac.getDayOfBirth().toString(DateTimeFormat.forPattern("yyyy-MM-dd'T'HH:mm:ss'Z"))).append("\",");

        if (request.isUserInRole("ADMINISTRATOR")) {
            builder.append("\"role\":\"").append("ADMINISTRATOR").append("\"");
        }else if (request.isUserInRole("SALEPERSON")) {
            builder.append("\"role\":\"").append("SALEPERSON").append("\"");
        }else if (request.isUserInRole("USER")) {
            builder.append("\"role\":\"").append("USER").append("\"");
        }

        builder.append("}");
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(builder.toString());
    }

}
