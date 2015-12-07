
package com.aptechfpt.controller;

import com.aptechfpt.bean.ProductFacadeLocal;
import com.aptechfpt.bean.SubCategoryFacadeLocal;
import com.aptechfpt.entity.Image;
import com.aptechfpt.entity.Product;
import com.aptechfpt.entity.SubCategory;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


public class AdminProductController extends HttpServlet {

    @EJB
    private SubCategoryFacadeLocal subCategoryFacade;

    @EJB
    private ProductFacadeLocal productFacade;

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
        }
    }
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action){
            case "view":
                viewPro(request, response);
                break;
            case "reAdd":
                reAdd(request, response);
                break;
        }
        
    }

    public void addPro(HttpServletRequest request) throws IOException, ServletException {
        String name = request.getParameter("txtName");
        BigDecimal price = new BigDecimal(request.getParameter("txtPrice"));
        int gender = Integer.parseInt(request.getParameter("txtGender"));
        String des = request.getParameter("txtDes");
        int subID = Integer.parseInt(request.getParameter("txtSub"));
        SubCategory sub = subCategoryFacade.find(subID);
        List<Image> imglist = new ArrayList<>();
        Collection<Part> parts = request.getParts();
        for (Part part : parts) {
            part.getName();
        }
        boolean avai = Boolean.parseBoolean(request.getParameter("txtAvailable"));
        Product pro = new Product();
        pro.setName(name);
        pro.setUnitPrice(price);
        pro.setGender(gender);
        pro.setDescription(des);
        pro.setLike(0);
        pro.setSubCategoryId(sub);
        
    }

    public void reAdd(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<SubCategory> sublist = subCategoryFacade.findAll();
        request.setAttribute("sublist", sublist);
        request.getRequestDispatcher("WEB-INF/admin/addProduct.jsp").forward(request, response);
    }

    public void viewPro(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<Product> prolist = productFacade.findAll();
        request.setAttribute("prolist", prolist);
        request.getRequestDispatcher("WEB-INF/admin/viewProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action){
            case "add":
                String[] list = request.getParameterValues("txtImg");
                for (String string : list) {
                    PrintWriter out = response.getWriter();
                    out.println(string);
                }
                //addPro(request);
                break;
        }
    }
    
    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
