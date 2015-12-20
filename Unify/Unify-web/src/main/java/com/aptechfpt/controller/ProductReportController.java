/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptechfpt.controller;

import com.aptechfpt.bean.CategoryFacadeLocal;
import com.aptechfpt.bean.CommentFacadeLocal;
import com.aptechfpt.bean.ProductFacadeLocal;
import com.aptechfpt.bean.PurchaseOrderDetailFacadeLocal;
import com.aptechfpt.bean.PurchaseOrderFacadeLocal;
import com.aptechfpt.dto.HighSale;
import com.aptechfpt.entity.Category;
import com.aptechfpt.entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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
public class ProductReportController extends HttpServlet {

    @EJB
    private CommentFacadeLocal commentFacade;

    @EJB
    private PurchaseOrderFacadeLocal purchaseOrderFacade;

    @EJB
    private PurchaseOrderDetailFacadeLocal purchaseOrderDetailFacade;

    @EJB
    private CategoryFacadeLocal categoryFacade;

   

    @EJB
    private ProductFacadeLocal productFacade;

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
            productFacade = (ProductFacadeLocal) context.lookup("java:global/Unify-ear/Unify-ejb-1.0-SNAPSHOT/ProductFacade!com.aptechfpt.bean.ProductFacadeLocal");
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
            List <Product> listproduct = productFacade.findAll();
            int tongsanpham = listproduct.size();
            int spdangban =0, sphuyban=0;
            for (Product p : listproduct) {
                if (p.getAvailable()) {
                    spdangban++;
                }else
                    sphuyban++;
            }
            
            
            List <Category> listcategory= categoryFacade.findAll();
            List<Product>listtoplike= productFacade.getTop10Like();
            List<HighSale> listtopsale= purchaseOrderDetailFacade.getTop10Buy(from, to);
            int days = Days.daysBetween(fdate, tdate).getDays();
            List<String> lname= new ArrayList();
            List<Integer> lquanity= new ArrayList();
            for (HighSale i : listtopsale) {
                lname.add(i.getProductName());
                lquanity.add(i.getQuantity());
            }
            List<HighSale> listtopcomment= commentFacade.getTop10Comment(from, to);
            
            
            
            
            
            
            HttpSession s = request.getSession();
            s.setAttribute("tongsanpham", tongsanpham);
            s.setAttribute("spdangban", spdangban);
            s.setAttribute("sphuyban", sphuyban);
            s.setAttribute("listcategory", listcategory);
            s.setAttribute("listtoplike", listtoplike);
            s.setAttribute("listtopsale", listtopsale);
            s.setAttribute("listtopcomment", listtopcomment);
            s.setAttribute("from", from);
            s.setAttribute("to", to);
            s.setAttribute("day", days);
            s.setAttribute("names", lname);
            s.setAttribute("quantity", lquanity);
            request.getRequestDispatcher("WEB-INF/admin/productreportview.jsp").forward(request, response);
        }catch(Exception e){
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
