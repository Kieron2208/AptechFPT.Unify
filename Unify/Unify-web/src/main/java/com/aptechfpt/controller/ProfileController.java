package com.aptechfpt.controller;

import com.aptechfpt.bean.AccountFacadeLocal;
import com.aptechfpt.bean.PurchaseOrderFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kiero
 */
public class ProfileController extends HttpServlet {

    @EJB
    private PurchaseOrderFacadeLocal purchaseOrderFacade;

    @EJB
    private AccountFacadeLocal accountFacade;

    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        if (accountFacade == null) {
            try {
                InitialContext context = new InitialContext();
                accountFacade = (AccountFacadeLocal) context.lookup("java:global/Unify-ear/Unify-ejb-1.0-SNAPSHOT/AccountFacade!com.aptechfpt.bean.AccountFacadeLocal");
                purchaseOrderFacade = (PurchaseOrderFacadeLocal) context.lookup("java:global/Unify-ear/Unify-ejb-1.0-SNAPSHOT/PurchaseOrderFacade!com.aptechfpt.bean.PurchaseOrderFacadeLocal");
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
        switch(action){
            case "orderHistory":
                orderHistory(request,response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private void orderHistory(HttpServletRequest request, HttpServletResponse response) {
        
    }
}
