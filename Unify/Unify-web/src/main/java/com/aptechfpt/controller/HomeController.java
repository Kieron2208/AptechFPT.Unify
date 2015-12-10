package com.aptechfpt.controller;

import com.aptechfpt.bean.ProductFacadeLocal;
import com.aptechfpt.bean.PurchaseOrderDetailFacadeLocal;
import com.aptechfpt.entity.Product;
import com.aptechfpt.entity.PurchaseOrderDetail;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class HomeController extends HttpServlet {

    @Inject
    private PurchaseOrderDetailFacadeLocal purchaseOrderDetailFacade;

    @Inject
    private ProductFacadeLocal productFacade;
    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
//        try {
//            InitialContext context = new InitialContext();
//            productFacade = (ProductFacadeLocal) context.lookup("java:global/Unify-ear/Unify-ejb-1.0-SNAPSHOT/ProductFacadejava:global/Unify-ear/Unify-ejb-1.0-SNAPSHOT/ProductFacade");
//            purchaseOrderDetailFacade = (PurchaseOrderDetailFacadeLocal) context.lookup("java:global/Unify-ear/Unify-ejb-1.0-SNAPSHOT/PurchaseOrderDetailFacade!com.aptechfpt.bean.PurchaseOrderDetailFacadeLocal");
//        } catch (NamingException ex) {
//            Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
//        }
        List<Product> listNew = productFacade.findLatest();
        request.setAttribute("Listnew", listNew);
        
        List<Product> listLike = productFacade.findMostLike();
        request.setAttribute("Listlike", listLike);
        
        List<Product> list = productFacade.findAll();
        List<Product> listRandom = new ArrayList<>();
        Collections.shuffle(list);
        for (int i = 0; i < 3; i++) {
            Product p = list.get(i);
            listRandom.add(p);
        }
        request.setAttribute("Listrandom", listRandom);
        
        List<Product> listMostBuy = new ArrayList<>();
        List<PurchaseOrderDetail> listPurchase = purchaseOrderDetailFacade.findMostBuy();
        for (PurchaseOrderDetail p : listPurchase) {
            Product pro = p.getProductId();
            listMostBuy.add(pro);
        }
        request.setAttribute("Listbuy", listMostBuy);
        
        
        
        request.getRequestDispatcher("WEB-INF/index.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
