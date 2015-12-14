package com.aptechfpt.controller;

import com.aptechfpt.bean.PurchaseOrderFacadeLocal;
import com.aptechfpt.entity.PurchaseOrder;
import com.aptechfpt.utils.MaHoa;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.ejb.EJB;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ken
 */
public class PurchaseController extends HttpServlet {

    @EJB
    private PurchaseOrderFacadeLocal purchaseOrderFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            InitialContext context = new InitialContext();
            purchaseOrderFacade = (PurchaseOrderFacadeLocal) context.lookup("java:global/Unify-ear/Unify-ejb-1.0-SNAPSHOT/PurchaseOrderFacade!com.aptechfpt.bean.PurchaseOrderFacadeLocal");
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            List<PurchaseOrder> list = purchaseOrderFacade.findAll();
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
            request.getRequestDispatcher("WEB-INF/admin/purchase.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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

}
