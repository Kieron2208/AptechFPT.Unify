package com.aptechfpt.controller;

import com.aptechfpt.bean.AccountFacadeLocal;
import com.aptechfpt.bean.PurchaseOrderFacadeLocal;
import com.aptechfpt.dto.AccountDTO;
import com.aptechfpt.entity.PurchaseOrder;
import com.aptechfpt.utils.MaHoa;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
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
            case "currentOrder":
                currentOrder(request,response);
                break;
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

    private void currentOrder(HttpServletRequest request, HttpServletResponse response) {
        try{
            HttpSession session = request.getSession();
            AccountDTO dto = (AccountDTO) session.getAttribute("Account");
            List<PurchaseOrder> list = purchaseOrderFacade.getListByAccountId(dto.getAccountId());
            MaHoa mh = new MaHoa();

            for (Iterator<PurchaseOrder> it = list.iterator(); it.hasNext(); ) {
                PurchaseOrder p = it.next();
                p.setName(mh.decrypt(p.getName()));
                p.setAddress(mh.decrypt(p.getAddress()));
                p.setPhone(mh.decrypt(p.getPhone()));
                if (!p.getCancelInvoice()) {
                    it.remove();
                }
            }

            request.setAttribute("list", list);
            request.getRequestDispatcher("WEB-INF/profileCurrentOrder.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
