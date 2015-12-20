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
        switch (action) {
            case "view":
                viewSub(request, response);
                break;
            case "reAdd":
                List<Category> categorylist = categoryFacade.findAll();
                request.setAttribute("categorylist", categorylist);
                request.getRequestDispatcher("WEB-INF/admin/addSubCategory.jsp").forward(request, response);
                break;
            case "reUpdate":
                int id = Integer.parseInt(request.getParameter("id"));
                SubCategory sub = subCategoryFacade.find(id);
                request.setAttribute("sub", sub);
                List<Category> category = categoryFacade.findAll();
                request.setAttribute("categorylist", category);
                request.getRequestDispatcher("WEB-INF/admin/updateSubCategory.jsp").forward(request, response);
                break;
        }

    }

    public void viewSub(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<SubCategory> sublist = subCategoryFacade.findAll();
        request.setAttribute("sublist", sublist);
        request.getRequestDispatcher("WEB-INF/admin/viewSubCategory.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "add":
                String name = request.getParameter("txtName");
                int categoryID = Integer.parseInt(request.getParameter("txtCategory"));
                SubCategory sub = new SubCategory();
                Category cate = categoryFacade.find(categoryID);
                sub.setName(name);
                sub.setCategoryId(cate);
                subCategoryFacade.create(sub);
                viewSub(request, response);
                break;
            case "update":
                int id = Integer.parseInt(request.getParameter("txtId"));
                String subname = request.getParameter("txtName");
                int cateID = Integer.parseInt(request.getParameter("txtCategory"));
                Category category = categoryFacade.find(cateID);
                SubCategory subcategory = subCategoryFacade.find(id);
                subcategory.setName(subname);
                subcategory.setCategoryId(category);
                subCategoryFacade.edit(subcategory);
                viewSub(request, response);
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
