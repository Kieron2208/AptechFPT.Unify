package com.aptechfpt.controller;

import com.aptechfpt.bean.ImageFacadeLocal;
import com.aptechfpt.bean.PriceHistoryFacadeLocal;
import com.aptechfpt.bean.ProductFacadeLocal;
import com.aptechfpt.bean.SubCategoryFacadeLocal;
import com.aptechfpt.entity.Image;
import com.aptechfpt.entity.PriceHistory;
import com.aptechfpt.entity.Product;
import com.aptechfpt.entity.SubCategory;
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
        String name = request.getParameter("txtName");
        BigDecimal importPrice = new BigDecimal(request.getParameter("txtImport"));
        BigDecimal price = new BigDecimal(request.getParameter("txtPrice"));
        int gender = Integer.parseInt(request.getParameter("txtGender"));
        String des = request.getParameter("txtDes");
        int subID = Integer.parseInt(request.getParameter("txtSub"));
        SubCategory sub = subCategoryFacade.find(subID);
        String[] imglist = ImageGet(request);
        boolean avai = Boolean.parseBoolean(request.getParameter("txtAvailable"));
        Product pro = new Product();
        pro.setName(name);
        pro.setUnitPrice(price);
        pro.setGender(gender);
        pro.setDescription(des);
        pro.setLike(0);
        pro.setSubCategoryId(sub);
        pro.setAvailable(avai);
        productFacade.create(pro);
        for (int i = 0; i < imglist.length; i++) {
            if (i == 0) {
                Image img = new Image();
                img.setDisplayOrder(1);
                img.setProductId(pro);
                img.setImagePath(imglist[i]);
                imageFacade.create(img);
            } else {
                Image img = new Image();
                img.setDisplayOrder(0);
                img.setProductId(pro);
                img.setImagePath(imglist[i]);
                imageFacade.create(img);
            }
//            File source = new File("C:\\Users\\thuat_000\\Desktop\\Img\\" + imglist[i]);
//            File dest = new File("E:\\Aptech\\Sem 4\\Project\\AptechFPT.Unify-master\\Unify\\Unify-web\\src\\main\\webapp\\img\\product\\" + imglist[i]);
//            copyFileUsingFileStreams(source, dest);

        }
        PriceHistory priceHistory = new PriceHistory();
        priceHistory.setProductId(pro);
        priceHistory.setCost(importPrice);
        priceHistory.setPrice(price);
        priceHistoryFacade.create(priceHistory);
        viewPro(request, response);
    }

    private static void copyFileUsingFileStreams(File source, File dest)
            throws IOException {
        InputStream input = null;
        OutputStream output = null;
        try {
            input = new FileInputStream(source);
            output = new FileOutputStream(dest);
            byte[] buf = new byte[1024];
            int bytesRead;
            while ((bytesRead = input.read(buf)) > 0) {
                output.write(buf, 0, bytesRead);
            }
        } finally {
            input.close();
            output.close();
        }
    }

    public void updatePro(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("txtId"));
        String name = request.getParameter("txtName");
        BigDecimal importPrice = new BigDecimal(request.getParameter("txtImport"));
        BigDecimal price = new BigDecimal(request.getParameter("txtPrice"));
        int gender = Integer.parseInt(request.getParameter("txtGender"));
        String des = request.getParameter("txtDes");
        int subID = Integer.parseInt(request.getParameter("txtSub"));
        SubCategory sub = subCategoryFacade.find(subID);
        String[] imglist = ImageGet(request);
        boolean avai = Boolean.parseBoolean(request.getParameter("txtAvailable"));
        Product pro = productFacade.find(id);
        pro.setName(name);
        pro.setUnitPrice(price);
        pro.setGender(gender);
        pro.setDescription(des);
        pro.setSubCategoryId(sub);
        pro.setAvailable(avai);
        productFacade.edit(pro);
        for (int i = 0; i < imglist.length; i++) {
            Image img = new Image();
            img.setDisplayOrder(0);
            img.setProductId(pro);
            img.setImagePath(imglist[i]);
            imageFacade.create(img);
//            File source = new File("C:\\Users\\thuat_000\\Desktop\\Img\\" + imglist[i]);
//            File dest = new File("E:\\Aptech\\Sem 4\\Project\\AptechFPT.Unify-master\\Unify\\Unify-web\\src\\main\\webapp\\img\\product\\" + imglist[i]);
//            copyFileUsingFileStreams(source, dest);
        }
        PriceHistory priceHistory = priceHistoryFacade.getNew(pro);
        if (importPrice != priceHistory.getCost() || price != priceHistory.getPrice()) {
            priceHistory.setProductId(pro);
            priceHistory.setCost(importPrice);
            priceHistory.setPrice(price);
            priceHistoryFacade.create(priceHistory);
        }
        viewPro(request, response);
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

    private String[] ImageGet(HttpServletRequest request) {
        try {
            boolean isMultipartContext = ServletFileUpload.isMultipartContent(request);
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> fields = upload.parseRequest(request);
            if (isMultipartContext) {
                String[] itemDir = null;
                int count = 0;
                for (FileItem fieldItem : fields) {
                    if (!fieldItem.isFormField()) {
                        String realPath = getServletContext().getRealPath("/");
                        File uploadDir = new File(realPath + "img/product/" + fieldItem.getName());
                        itemDir[count] = "/img/product/" + fieldItem.getName();
                        count++;
//                    File file = File.createTempFile("img", ".jpg", uploadDir);
                        System.out.println("file real parth: " + uploadDir.getAbsolutePath());
                        try {
                            fieldItem.write(uploadDir);
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    }
                }
                return itemDir;
            }
            return null;
        } catch (FileUploadException ex) {
            Logger.getLogger(AdminProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
