/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptechfpt.controller;

import com.aptechfpt.bean.PurchaseOrderFacadeLocal;
import com.aptechfpt.entity.PurchaseOrder;
import com.aptechfpt.entity.PurchaseOrderDetail;
import com.aptechfpt.utils.MaHoa;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.ejb.EJB;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.joda.time.DateTime;
import org.joda.time.Days;

/**
 *
 * @author ken
 */
public class PurchaseReportController extends HttpServlet {

    @EJB
    private PurchaseOrderFacadeLocal purchaseOrderFacade;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
            String date = request.getParameter("daterange");
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
            String from = LocalDate.parse(date.split("-")[0].trim(), formatter).toString();
            String to = LocalDate.parse(date.split("-")[1].trim(), formatter).toString();
            DateTime fdate = DateTime.parse(from);
            DateTime tdate = DateTime.parse(to);
            List<PurchaseOrder> list = purchaseOrderFacade.getReport(fdate, tdate);
            double doanhthu = 0, loinhuan = 0;
            int donhang = list.size();
            int hanghoa = 0, hoanthanh = 0, giaohang = 0;
            int access = 0, dress = 0, pant = 0, shirt = 0, cancel = 0;
            for (PurchaseOrder p : list) {
                if (p.getCancelInvoice()) {
                    if (p.getStatus()) {
                        doanhthu += p.getSubTotal().doubleValue();
                        hoanthanh++;
                        for (PurchaseOrderDetail pod : p.getPurchaseOrderDetailCollection()) {
                            hanghoa += pod.getQuantity();
                            loinhuan += (pod.getUnitPrice().doubleValue() - pod.getCost().doubleValue()) * pod.getQuantity();
                            if (pod.getProductId().getSubCategoryId().getCategoryId().getName().equalsIgnoreCase("Accessory")) {
                                access += pod.getQuantity();
                            }
                            if (pod.getProductId().getSubCategoryId().getCategoryId().getName().equalsIgnoreCase("Dress")) {
                                dress += pod.getQuantity();
                            }
                            if (pod.getProductId().getSubCategoryId().getCategoryId().getName().equalsIgnoreCase("Pants")) {
                                pant += pod.getQuantity();
                            }
                            if (pod.getProductId().getSubCategoryId().getCategoryId().getName().equalsIgnoreCase("Shirt")) {
                                shirt += pod.getQuantity();
                            }
                        }
                    } else {
                        giaohang++;
                    }
                } else {
                    cancel++;
                }

            }

            MaHoa mh = new MaHoa();
            for (PurchaseOrder p : list) {
                p.setName(mh.decrypt(p.getName()));
                p.setAddress(mh.decrypt(p.getAddress()));
                p.setPhone(mh.decrypt(p.getPhone()));

            }
            int days = Days.daysBetween(fdate, tdate).getDays();
//            request.setAttribute("doanhthu", doanhthu);
//            request.setAttribute("loinhuan", loinhuan);
//            request.setAttribute("hanghoa", hanghoa);
//            request.setAttribute("donhang", donhang);
//            request.setAttribute("hoanthanh", hoanthanh);
//            request.setAttribute("giaohang", giaohang);
//
//            request.setAttribute("acc", access);
//            request.setAttribute("pant", pant);
//            request.setAttribute("dress", dress);
//            request.setAttribute("shirt", shirt);
//            request.setAttribute("cancel", cancel);
//            request.setAttribute("list", list);
            
            HttpSession session = request.getSession();
            session.setAttribute("doanhthu", doanhthu);
            session.setAttribute("loinhuan", loinhuan);
            session.setAttribute("hanghoa", hanghoa);
            session.setAttribute("donhang", donhang);
            session.setAttribute("hoanthanh", hoanthanh);
            session.setAttribute("giaohang", giaohang);

            session.setAttribute("acc", access);
            session.setAttribute("pant", pant);
            session.setAttribute("dress", dress);
            session.setAttribute("shirt", shirt);
            session.setAttribute("cancel", cancel);
            session.setAttribute("list", list);
            session.setAttribute("day", days);
            request.getRequestDispatcher("WEB-INF/admin/reportprint.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
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
