package com.aptechfpt.controller;

import com.aptechfpt.bean.ImageFacadeLocal;
import com.aptechfpt.bean.PriceHistoryFacadeLocal;
import com.aptechfpt.bean.ProductFacadeLocal;
import com.aptechfpt.bean.SubCategoryFacadeLocal;
import com.aptechfpt.dto.AccountDTO;
import com.aptechfpt.entity.Image;
import com.aptechfpt.entity.PriceHistory;
import com.aptechfpt.entity.Product;
import com.aptechfpt.entity.SubCategory;
import com.aptechfpt.enumtype.AccountGender;
import com.aptechfpt.enumtype.Role;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.joda.time.DateTime;

public class AdminProductController extends HttpServlet {

    @EJB
    private PriceHistoryFacadeLocal priceHistoryFacade;

    @EJB
    private ImageFacadeLocal imageFacade;

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
        switch (action) {
            case "view":
                viewPro(request, response);
                break;
            case "reAdd":
                reAdd(request, response);
                break;
            case "reUpdate":
                reUpdate(request, response);
                break;
            case "disProduct":
                disPro(request, response);
                break;
            case "enProduct":
                enPro(request, response);
                break;
        }
    }

    public void disPro(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product pro = productFacade.findByID(id);
        pro.setAvailable(false);
        productFacade.edit(pro);
        viewPro(request, response);
    }

    public void enPro(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product pro = productFacade.findByID(id);
        pro.setAvailable(true);
        productFacade.edit(pro);
        viewPro(request, response);
    }

    public void addPro(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            //boolean isMultipartContext = ServletFileUpload.isMultipartContent(request);
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> fields = upload.parseRequest(request);
            String name = null;
            BigDecimal importPrice = null;
            BigDecimal price = null;
            int gender = 0;
            String des = null;
            int subID = 0;
            String imglist = null;
            boolean avai = false;
            for (FileItem fileItem : fields) {
                switch (fileItem.getFieldName()) {
                    case "txtName":
                        System.out.println("txtName: " + fileItem.getString());
                        name = fileItem.getString();
                        continue;
                    case "txtImport":
                        System.out.println("txtImport: " + fileItem.getString());
                        importPrice = new BigDecimal(fileItem.getString());
                        continue;
                    case "txtPrice":
                        System.out.println("txtPrice: " + fileItem.getString());
                        price = new BigDecimal(fileItem.getString());
                        continue;
                    case "txtGender":
                        System.out.println("txtGender: " + fileItem.getString());
                        gender = Integer.parseInt(fileItem.getString());
                        continue;
                    case "txtDes":
                        System.out.println("txtDes: " + fileItem.getString());
                        des = fileItem.getString();
                        continue;
                    case "txtSub":
                        System.out.println("txtSub: " + fileItem.getString());
                        subID = Integer.parseInt(fileItem.getString());
                        continue;
                        case "txtAvailable":
                        System.out.println("txtAvailable: " + fileItem.getString());
                        avai = Boolean.parseBoolean(fileItem.getString());
                        continue;
                    case "txtImg":
                        System.out.println("txtImg: " + fileItem.toString());
                        imglist = ImageGet(fileItem);
                }
            }
            SubCategory sub = subCategoryFacade.find(subID);
            Product pro = new Product();
            pro.setName(name);
            pro.setUnitPrice(price);
            pro.setGender(gender);
            pro.setDescription(des);
            pro.setSubCategoryId(sub);
            pro.setAvailable(avai);
            productFacade.create(pro);
            Image img = new Image();
            img.setDisplayOrder(1);
            img.setProductId(pro);
            img.setImagePath(imglist);
            imageFacade.create(img);
            PriceHistory priceHistory = new PriceHistory();
            priceHistory.setProductId(pro);
            priceHistory.setCost(importPrice);
            priceHistory.setPrice(price);
            priceHistoryFacade.create(priceHistory);
            response.sendRedirect(request.getContextPath() + "/administrator/viewProduct");
        } catch (Exception ex) {
            ex.printStackTrace();
            Logger.getLogger(AdminProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updatePro(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            boolean isMultipartContext = ServletFileUpload.isMultipartContent(request);
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> fields = upload.parseRequest(request);
            int id = 0;
            String name = null;
            BigDecimal importPrice = null;
            BigDecimal price = null;
            int gender = 0;
            String des = null;
            int subID = 0;
            String imglist = null;
            for (FileItem fileItem : fields) {
                switch (fileItem.getFieldName()) {
                    case "txtId":
                        System.out.println("txtId: " + fileItem.getString());
                        id = Integer.parseInt(fileItem.getString());
                        continue;
                    case "txtName":
                        System.out.println("txtName: " + fileItem.getString());
                        name = fileItem.getString();
                        continue;
                    case "txtImport":
                        System.out.println("txtImport: " + fileItem.getString());
                        importPrice = new BigDecimal(fileItem.getString());
                        continue;
                    case "txtPrice":
                        System.out.println("txtPrice: " + fileItem.getString());
                        price = new BigDecimal(fileItem.getString());
                        continue;
                    case "txtGender":
                        System.out.println("txtGender: " + fileItem.getString());
                        gender = Integer.parseInt(fileItem.getString());
                        continue;
                    case "txtDes":
                        System.out.println("txtDes: " + fileItem.getString());
                        des = fileItem.getString();
                        continue;
                    case "txtSub":
                        System.out.println("txtSub: " + fileItem.getString());
                        subID = Integer.parseInt(fileItem.getString());
                        continue;
                    case "txtImg":
                        System.out.println("txtImg: " + fileItem.getString());
                        if (ImageGet(fileItem)!=null) {
                            imglist = ImageGetUpdate(fileItem);
                        }
                }
            }
            SubCategory sub = subCategoryFacade.find(subID);
            Product pro = productFacade.find(id);
            pro.setName(name);
            pro.setUnitPrice(price);
            pro.setGender(gender);
            pro.setDescription(des);
            pro.setSubCategoryId(sub);
            productFacade.edit(pro);
            if (imglist!=null) {
                Image img = new Image();
                img.setDisplayOrder(0);
                img.setProductId(pro);
                img.setImagePath(imglist);
                imageFacade.create(img);
            }
            
            PriceHistory priceHistory = priceHistoryFacade.getNew(pro);
            if (importPrice != priceHistory.getCost() || price != priceHistory.getPrice()) {
                priceHistory.setProductId(pro);
                priceHistory.setCost(importPrice);
                priceHistory.setPrice(price);
                priceHistoryFacade.create(priceHistory);
            }
            response.sendRedirect(request.getContextPath() + "/administrator/viewProduct");
        } catch (Exception ex) {
            ex.printStackTrace();
            Logger.getLogger(AdminProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
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

    public void reUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product pro = productFacade.find(id);
        BigDecimal imp = priceHistoryFacade.getCost(pro);
        request.setAttribute("imp", imp);
        request.setAttribute("pro", pro);
        List<SubCategory> sublist = subCategoryFacade.findAll();
        request.setAttribute("sublist", sublist);
        request.getRequestDispatcher("WEB-INF/admin/updateProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "add":
                addPro(request, response);
                break;
            case "update":
                updatePro(request, response);
                break;
        }
    }

//    private String[] ImageGet(FileItem fields) {
//        try {
////            boolean isMultipartContext = ServletFileUpload.isMultipartContent(request);
////            FileItemFactory factory = new DiskFileItemFactory();
////            ServletFileUpload upload = new ServletFileUpload(factory);
////            List<FileItem> fields = upload.parseRequest(request);
////            if (isMultipartContext) {
//                String[] itemDir = null;
//                int count = 0;
////                for (FileItem fieldItem : fields) {
//                    if (!fieldItem.isFormField()) {
//                        String realPath = getServletContext().getRealPath("/");
//                        File uploadDir = new File(realPath + "img/product/" + fieldItem.getName());
//                        itemDir[count] = "/img/product/" + fieldItem.getName();
//                        count++;
////                    File file = File.createTempFile("img", ".jpg", uploadDir);
//                        System.out.println("file real parth: " + uploadDir.getAbsolutePath());
//                        try {
//                            fieldItem.write(uploadDir);
//                        } catch (Exception ex) {
//                            ex.printStackTrace();
//                        }
//                    }
//                }
////            }
//        } catch (FileUploadException ex) {
//            Logger.getLogger(AdminProductController.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
    private String ImageGet(FileItem fileItem) {
        if (fileItem.getName() != null) {
            String realPath = getServletContext().getRealPath("/");
            File uploadDir = new File(realPath + "img/product/" + fileItem.getName());
//                    File file = File.createTempFile("img", ".jpg", uploadDir);
            try {
                fileItem.write(uploadDir);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            return "/img/product/" + fileItem.getName();
        } else {
            return "/img/product/img32-md.jpg";
        }
    }
    private String ImageGetUpdate(FileItem fileItem) {
        if (fileItem.getName() != null) {
            String realPath = getServletContext().getRealPath("/");
            File uploadDir = new File(realPath + "img/product/" + fileItem.getName());
//                    File file = File.createTempFile("img", ".jpg", uploadDir);
            try {
                fileItem.write(uploadDir);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            return "/img/product/" + fileItem.getName();
        } else {
            return null;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
