
package com.aptechfpt.controller;

import com.aptechfpt.bean.CategoryFacadeLocal;
import com.aptechfpt.bean.SubCategoryFacadeLocal;
import com.aptechfpt.entity.Category;
import com.aptechfpt.entity.SubCategory;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author thuat_000
 */
public class AdminSubCategoryController extends HttpServlet {

    @EJB
    private CategoryFacadeLocal categoryFacade;

    @EJB
    private SubCategoryFacadeLocal subCategoryFacade;

    public AdminSubCategoryController() {
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
            switch (action){
                case "view":
                    List<SubCategory> sublist = subCategoryFacade.findAll();
                    request.setAttribute("sublist", sublist);
                    request.getRequestDispatcher("WEB-INF/admin/viewSubCategory.jsp").forward(request, response);
                    break;
                case "reAdd":
                    List<Category> categorylist = categoryFacade.findAll();
                    request.setAttribute("categorylist", categorylist);
                    request.getRequestDispatcher("WEB-INF/admin/addSubCategory.jsp").forward(request, response);
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
    }// </editor-fold>

}
