/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptechfpt.controller;

import com.aptechfpt.bean.AccountFacadeLocal;
import com.aptechfpt.dto.AccountDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Kiero
 */
public class AcountUtilController extends HttpServlet {
    @EJB
    private AccountFacadeLocal accountFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch(action){
            case "checkemail":
                checkEmail(request,response);
                break;
            case "checkoldpassword":
                checkOldPassword(request,response);
                break;
            case "checknewpassword":
                checkNewPassword(request,response);
                break;
        }
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

    private void checkEmail(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("value");
        boolean isExisted = accountFacade.isExistedEmail(email);
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(!isExisted);
        out.close();
    }

    private void checkOldPassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        String password = request.getParameter("value");
        AccountDTO dto = (AccountDTO) session.getAttribute("Account");
        boolean isExisted = accountFacade.comparePassword(dto.getAccountId(),password);
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(isExisted);
        out.close();
    }

    private void checkNewPassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        String password = request.getParameter("value");
        AccountDTO dto = (AccountDTO) session.getAttribute("Account");
        boolean isExisted = accountFacade.comparePassword(dto.getAccountId(),password);
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(!isExisted);
        out.close();
    }

}
