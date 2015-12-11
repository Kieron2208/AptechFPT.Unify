
package com.aptechfpt.controller;

import com.aptechfpt.bean.ProductFacadeLocal;
import com.aptechfpt.entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kiero
 */
public class ProductController extends HttpServlet {

    @EJB
    private ProductFacadeLocal productFacade;
    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            InitialContext context = new InitialContext();
            productFacade = (ProductFacadeLocal) context.lookup("java:global/Unify-ear/Unify-ejb-1.0-SNAPSHOT/ProductFacade!com.aptechfpt.bean.ProductFacadeLocal");
        } catch (Exception e) {
            e.printStackTrace();
        }
        String action = request.getParameter("action");
        switch (action){
            case "grid":
                request.getRequestDispatcher("WEB-INF/productgrid.jsp").forward(request, response);
                break;
            case "detail":
                int id = Integer.parseInt(request.getParameter("id"));
                List<Product> prolist = productFacade.findAll();
                Product pro  = productFacade.find(id);
                request.setAttribute("pro", pro);
                request.getRequestDispatcher("WEB-INF/productdetail.jsp").forward(request, response);
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
