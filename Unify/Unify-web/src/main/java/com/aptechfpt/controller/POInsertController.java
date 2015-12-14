package com.aptechfpt.controller;

import com.aptechfpt.utils.MaHoa;
import com.aptechfpt.bean.AccountFacadeLocal;
import com.aptechfpt.bean.PriceHistoryFacadeLocal;
import com.aptechfpt.bean.ProductFacadeLocal;
import com.aptechfpt.bean.PurchaseOrderDetailFacadeLocal;
import com.aptechfpt.bean.PurchaseOrderFacadeLocal;
import com.aptechfpt.dto.AccountDTO;
import com.aptechfpt.dto.PurchaseOrderDTO;
import com.aptechfpt.entity.Account;
import com.aptechfpt.entity.Product;
import com.aptechfpt.entity.PurchaseOrder;
import com.aptechfpt.entity.PurchaseOrderDetail;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ken
 */
public class POInsertController extends HttpServlet {

    @EJB
    private PurchaseOrderFacadeLocal purchaseOrderFacade;

    @EJB
    private AccountFacadeLocal accountFacade;

    @EJB
    private PriceHistoryFacadeLocal priceHistoryFacade;

    @EJB
    private ProductFacadeLocal productFacade;

    @EJB
    private PurchaseOrderDetailFacadeLocal purchaseOrderDetailFacade;

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            AccountDTO account = (AccountDTO) session.getAttribute("Account");

            String cname = request.getParameter("fname");
            String cphone = request.getParameter("phone");
            String cadd = request.getParameter("address");

            String xx = request.getParameter("total");
            BigDecimal ct = new BigDecimal(xx);

//            String [] cart = request.getParameterValues("cart");
            String cart = request.getParameter("cart");
            MaHoa mh = new MaHoa();
            int pid = 0, quantity = 0;

            List<PurchaseOrderDetail> listpod = new ArrayList<>();
            PurchaseOrder po = new PurchaseOrder();

            Gson gson = new Gson();

            Type collectionType = new TypeToken<ArrayList<PurchaseOrderDTO>>() {
            }.getType();
            List<PurchaseOrderDTO> PODTO = new Gson().fromJson(cart, collectionType);

            Object object = null;
            for (PurchaseOrderDTO o : PODTO) {
                pid = o.id;
                Product p = productFacade.find(pid);
                quantity = o.quantity;
                BigDecimal price = o.price;
                BigDecimal total = o.total;
                BigDecimal cost = priceHistoryFacade.getCost(p);
                PurchaseOrderDetail pod = new PurchaseOrderDetail();
                pod.setCost(cost);
                pod.setProductId(p);
                pod.setQuantity(quantity);
                pod.setUnitPrice(price);
                pod.setSubtotal(total);
                pod.setPurchaseOrderId(po);
                listpod.add(pod);
            }
            if (account != null) {
                Integer id = account.getAccountId();
                Account acc = accountFacade.findById(id);
                po.setAccountId(acc);
            }

            po.setSubTotal(ct);
            po.setAddress(mh.encrypt(cadd));
            po.setName(mh.encrypt(cname));
            po.setPhone(mh.encrypt(cphone));
            po.setStatus(false);
            //po.setCreatedDate((new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(new Date())).toString());
            po.setPurchaseOrderDetailCollection(listpod);
            purchaseOrderFacade.create(po);
            po.setName(cname);
            po.setAddress(cadd);
            po.setPhone(cphone);
            request.setAttribute("o", po);
            request.getRequestDispatcher("WEB-INF/cartinfor.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

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
    }// </edit

}
