package com.aptechfpt.controller;

import com.aptechfpt.bean.AccountFacadeLocal;
import com.aptechfpt.bean.PurchaseOrderFacadeLocal;
import com.aptechfpt.dto.AccountDTO;
import com.aptechfpt.entity.Account;
import com.aptechfpt.entity.PurchaseOrder;
import com.aptechfpt.enumtype.AccountGender;
import com.aptechfpt.utils.MaHoa;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;

/**
 *
 * @author Kiero
 */
public class ProfileController extends HttpServlet {

    @EJB
    private PurchaseOrderFacadeLocal purchaseOrderFacade;

    @EJB
    private AccountFacadeLocal accountFacade;

    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        if (accountFacade == null) {
            try {
                InitialContext context = new InitialContext();
                accountFacade = (AccountFacadeLocal) context.lookup("java:global/Unify-ear/Unify-ejb-1.0-SNAPSHOT/AccountFacade!com.aptechfpt.bean.AccountFacadeLocal");
                purchaseOrderFacade = (PurchaseOrderFacadeLocal) context.lookup("java:global/Unify-ear/Unify-ejb-1.0-SNAPSHOT/PurchaseOrderFacade!com.aptechfpt.bean.PurchaseOrderFacadeLocal");
            } catch (Exception e) {
                e.printStackTrace(System.err);
            }
        }
        super.service(req, res); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "profile":
                profile(request, response);
                break;
            case "currentOrder":
                currentOrder(request, response);
                break;
            case "detail":
                detail(request, response);
                break;
            case "comment":
                comment(request, response);
                break;
        }
    }

    private void profile(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        AccountDTO dto = (AccountDTO) session.getAttribute("Account");
        Account account = accountFacade.findById(dto.getAccountId());
        request.setAttribute("account", account);
        request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
    }

    private void detail(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        AccountDTO dto = (AccountDTO) session.getAttribute("Account");
        Account ac = accountFacade.findById(dto.getAccountId());
        StringBuilder builder = new StringBuilder();
        builder.append("{")
                .append("\"id\":\"").append(ac.getAccountId()).append("\",")
                .append("\"email\":\"").append(ac.getEmail()).append("\",")
                .append("\"firstName\":\"").append(ac.getFirstName()).append("\",")
                .append("\"lastName\":\"").append(ac.getLastName()).append("\",")
                .append("\"avatar\":").append("null").append(",")
                .append("\"imgLink\":\"").append(request.getContextPath()).append(ac.getImageLink()).append("\",")
                .append("\"phone\":\"").append(ac.getPhone()).append("\",")
                .append("\"gender\":\"").append(ac.getGender()).append("\",")
                .append("\"address\":\"").append(ac.getAddress()).append("\",")
                .append("\"dateOfBirth\":\"").append(ac.getDayOfBirth().toString(DateTimeFormat.forPattern("yyyy-MM-dd'T'HH:mm:ss'Z"))).append("\"");
//
//        if (request.isUserInRole("ADMINISTRATOR")) {
//            builder.append("\"role\":\"").append("ADMINISTRATOR").append("\"");
//        } else if (request.isUserInRole("SALEPERSON")) {
//            builder.append("\"role\":\"").append("SALEPERSON").append("\"");
//        } else if (request.isUserInRole("USER")) {
//            builder.append("\"role\":\"").append("USER").append("\"");
//        }

        builder.append("}");
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(builder.toString());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "profile":
                UpdateAccount(request, response);
                break;
            case "password":
                ChangePassword(request, response);
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private void UpdateAccount(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            boolean isMultipartContext = ServletFileUpload.isMultipartContent(request);
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> fields = upload.parseRequest(request);
            AccountDTO.Builder builder = new AccountDTO.Builder();
            for (FileItem fileItem : fields) {
                switch (fileItem.getFieldName()) {
                    case "id":
                        System.out.println("id: " + fileItem.getString());
                        builder.Id(Integer.parseInt(fileItem.getString()));
                        continue;
                    case "email":
                        System.out.println("email: " + fileItem.getString());
                        builder.Email(fileItem.getString());
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
            System.out.println();
            accountFacade.updateProfile(dto.toAccount());
            StringBuilder jsonRes = new StringBuilder();
            jsonRes.append("{\"message\":")
                    .append("\"Account ").append(dto.getEmail()).append(" update successfull.")
                    .append("\"}");
            Account account = accountFacade.findById(dto.getAccountId());
            HttpSession session = request.getSession();
            AccountDTO sessiondto = new AccountDTO.Builder(account.getAccountId(), account.getEmail())
                    .FirstName(account.getFirstName())
                    .LastName(account.getLastName())
                    .ImageLink(account.getImageLink())
                    .isAvalaible(account.isAvailable())
                    .Gender(account.getGender())
                    .build();
            session.setAttribute("Account", sessiondto);
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
        if (!fileItem.isFormField()) {
            if (fileItem.getName() != null) {
                String realPath = getServletContext().getRealPath("/");
                File uploadDir = new File(realPath + "img/user/" + fileItem.getName());
//                    File file = File.createTempFile("img", ".jpg", uploadDir);
                try {
                    fileItem.write(uploadDir);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            } else {
                return "/img/user/user.jpg";
            }
        } else {
            return fileItem.getString();
        }
        return "/img/user/" + fileItem.getName();
    }

    private void ChangePassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        AccountDTO dto = (AccountDTO) session.getAttribute("Account");
        String password = request.getParameter("newPassword");
        accountFacade.editPassword(dto.getAccountId(), password);
        StringBuilder jsonRes = new StringBuilder();
        jsonRes.append("{\"message\":")
                .append("\"Change Password for ").append(dto.getEmail()).append(" successfull.")
                .append("\"}");
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(jsonRes.toString());
        out.close();
    }

    private void currentOrder(HttpServletRequest request, HttpServletResponse response) {
        try {
            HttpSession session = request.getSession();
            AccountDTO dto = (AccountDTO) session.getAttribute("Account");
            List<PurchaseOrder> list = purchaseOrderFacade.getListByAccountId(dto.getAccountId());
            MaHoa mh = new MaHoa();

            for (Iterator<PurchaseOrder> it = list.iterator(); it.hasNext();) {
                PurchaseOrder p = it.next();
                p.setName(mh.decrypt(p.getName()));
                p.setAddress(mh.decrypt(p.getAddress()));
                p.setPhone(mh.decrypt(p.getPhone()));
                if (!p.getCancelInvoice()) {
                    it.remove();
                }
            }

            request.setAttribute("list", list);
            request.getRequestDispatcher("WEB-INF/profileCurrentOrder.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void comment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        AccountDTO dto = (AccountDTO) session.getAttribute("Account");
        Account account = accountFacade.findById(dto.getAccountId());
        request.setAttribute("account", account);
        request.getRequestDispatcher("/WEB-INF/profileComment.jsp").forward(request, response);
    }
}
