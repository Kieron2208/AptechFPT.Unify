package com.aptechfpt.controller;

import com.aptechfpt.bean.AccountFacadeLocal;
import com.aptechfpt.entity.Account;
import com.aptechfpt.entity.PurchaseOrder;
import com.aptechfpt.enumtype.Role;
import com.aptechfpt.utils.MaHoa;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.NoSuchPaddingException;
import javax.ejb.EJB;
import javax.inject.Inject;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kiero
 */
public class AdminUserController extends HttpServlet {

    @EJB
    private AccountFacadeLocal accountFacade;

    private static final Logger logger = Logger.getLogger(AdminUserController.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch(action){
            case "list":
        list(request, response);
                break;
            case "ban":
        ban(request, response);
                break;
        }
    }

    private void list(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //        try {
//            InitialContext context = new InitialContext();
//            accountFacade = (AccountFacadeLocal) context.lookup("java:global/Unify-ear/Unify-ejb-1.0-SNAPSHOT/AccountFacade!com.aptechfpt.bean.AccountFacadeLocal");
//        } catch (NamingException ex) {
//            Logger.getLogger(AdminUserController.class.getName()).log(Level.SEVERE, null, ex);
//        }
        logger.info("AdminUserController was called");
        final boolean isAdmin = request.isUserInRole(Role.ADMINISTRATOR.name());
        List<Account> list;
        if (isAdmin) {
            list = accountFacade.findAll();
        } else {
            list = accountFacade.GetOnlyUsers();
        }
        try {
            MaHoa mh = new MaHoa();
            for (int i = 0; i < list.size(); i++) {
                Account get = list.get(i);
                for (Iterator<PurchaseOrder> it = get.getPurchaseOrderCollection().iterator(); it.hasNext();) {
                    PurchaseOrder p = it.next();
                    p.setName(mh.decrypt(p.getName()));
                    p.setAddress(mh.decrypt(p.getAddress()));
                    p.setPhone(mh.decrypt(p.getPhone()));
                    if (!p.getCancelInvoice()) {
                        it.remove();
                    }
                }
            }
        } catch (NoSuchPaddingException | InvalidKeyException | InvalidAlgorithmParameterException | IOException ex) {
            ex.printStackTrace();
        }
        request.setAttribute("list", list);
        request.getRequestDispatcher("/WEB-INF/admin/users.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private void ban(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int accountId = Integer.parseInt(request.getParameter("accountId"));
        accountFacade.banAccount(accountId);
        response.sendRedirect(request.getContextPath() + "/administrator/user");
    }

}
