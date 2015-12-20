/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptechfpt.controller;

import com.aptechfpt.bean.AccountFacadeLocal;
import com.aptechfpt.dto.AccountDTO;
import com.aptechfpt.enumtype.AccountGender;
import com.aptechfpt.enumtype.Role;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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

/**
 *
 * @author Kiero
 */
public class InsertSalePerson extends HttpServlet {
    @EJB
    private AccountFacadeLocal accountFacade;

    protected void Register(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            boolean isMultipartContext = ServletFileUpload.isMultipartContent(request);
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> fields = upload.parseRequest(request);
            AccountDTO.Builder builder = new AccountDTO.Builder();
            for (FileItem fileItem : fields) {
                switch (fileItem.getFieldName()) {
                    case "email":
                        System.out.println("email: " + fileItem.getString());
                        builder.Email(fileItem.getString());
                        continue;
                    case "password":
                        System.out.println("password: " + fileItem.getString());
                        builder.Password(fileItem.getString());
                        continue;
                    case "image":
                        System.out.println("image: " + fileItem.getName());
                        builder.ImageLink(writeFile(fileItem));
                        continue;
                    case "firstName":
                        System.out.println("firstName: " + fileItem.getString());
                        builder.FirstName(fileItem.getString());
                        continue;
                    case "lastName":
                        System.out.println("lastName: " + fileItem.getString());
                        builder.LastName(fileItem.getString());
                        continue;
                    case "phone":
                        System.out.println("phone: " + fileItem.getString());
                        builder.Phone(fileItem.getString());
                        continue;
                    case "address":
                        System.out.println("address: " + fileItem.getString());
                        builder.Address(fileItem.getString());
                        continue;
                    case "gender":
                        System.out.println("gender: " + fileItem.getString());
                        builder.Gender(AccountGender.valueOf(fileItem.getString()));
                        continue;
                    case "dateOfBirth":
                        System.out.println("dateOfBirth: " + fileItem.getString());
                        builder.DateOfBirth(new DateTime(fileItem.getString()));
                    case "role":
                        System.out.println("role: " + fileItem.getString());
                        builder.Role(Role.valueOf(fileItem.getString()));
                }
            }
            AccountDTO dto = builder.build();
            System.out.println("Email: " + dto.getEmail());
            System.out.println("Password: " + dto.getPassword());
            System.out.println("Image Link: " + dto.getImageLink());
            System.out.println("First Name: " + dto.getFirstName());
            System.out.println("Last Name: " + dto.getLastName());
            System.out.println("Gender: " + dto.getGender());
            System.out.println("Phone: " + dto.getPhone());
            System.out.println("Address: " + dto.getAddress());
            System.out.println("Date Of Birth: " + dto.getDateOfBirth());
            accountFacade.create(dto.toAccount());
            StringBuilder jsonRes = new StringBuilder();
            jsonRes.append("{\"message\":")
                    .append("\"Account ").append(dto.getEmail()).append(" create successfull.")
                    .append("\"}");

            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print(jsonRes.toString());
            out.close();
        } catch (FileUploadException ex) {
            ex.printStackTrace();
            Logger.getLogger(InsertSalePerson.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private String writeFile(FileItem fileItem) {
        if (fileItem.getName() != null) {
            String realPath = getServletContext().getRealPath("/");
            File uploadDir = new File(realPath + "img/user/" + fileItem.getName());
//                    File file = File.createTempFile("img", ".jpg", uploadDir);
            try {
                fileItem.write(uploadDir);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            return "/img/user/" + fileItem.getName();
        }else {
            return "/img/user/user.jpg";
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "checkMail":
                checkEmail(request, response);
                break;
        }
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
        String action = request.getParameter("action");
        switch (action){
            case "register":
                Register(request,response);
                break;
        }
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

    private void checkEmail(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("value");
        boolean isExisted = accountFacade.isExistedEmail(email);
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(!isExisted);
        out.close();
    }

}
