<%-- 
    Document   : purchaseprint
    Created on : Dec 16, 2015, 10:50:10 AM
    Author     : ken
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

        <!-- CSS Global Compulsory -->
        <link rel="stylesheet" href="<c:url value="/plugins/bootstrap/css/bootstrap.min.css"/>">
        <link rel="stylesheet" href="<c:url value="/css/shop.style.css"/>">
        <!-- CSS Header and Footer -->
        <link rel="stylesheet" href="<c:url value="/css/headers/header-v6.css"/>">
        <link rel="stylesheet" href="<c:url value="/css/footers/footer-v4.css"/>">

        <!-- CSS Implementing Plugins -->
        <link rel="stylesheet" href="<c:url value="/plugins/animate.css"/>">    
        <link rel="stylesheet" href="<c:url value="/plugins/line-icons/line-icons.css"/>">
        <link rel="stylesheet" href="<c:url value="/plugins/font-awesome/css/font-awesome.min.css"/>">
        <link rel="stylesheet" href="<c:url value="/plugins/scrollbar/css/jquery.mCustomScrollbar.css"/>">
     
    </head>
    <body onload="window.print();">
        <div class="content-md margin-bottom-30">
            <div class="container">
                <div class="col-md-7 md-margin-bottom-60">
                    <div class="headline-left margin-bottom-20">
                        <h2 class="headline-brd">UIShop, Inc - CUSTOMER PURCHASE</h2>
                        <c:set var="now" value="<%=new java.util.Date()%>" />
                        <p style="font-size: 20px;">Date: <fmt:formatDate type="both" 
                                        value="${now}" /></p>
                    </div><!--/end Headline Left-->

                    <div class="row">
                        <div class="col-sm-10">

                            <ul class="list-unstyled checked-list" style="font-size: 20px;">
                                <li><i class="fa fa-check"></i>  Customer Name: <strong>${o.name}</strong></li>
                                <li><i class="fa fa-check"></i>  Phone number: <strong>${o.phone}</strong></li>
                                <li><i class="fa fa-check"></i>  Address:<strong> ${o.address}</strong></li>
                                <li><i class="fa fa-check"></i>  Serial:# <strong>${o.purchaseOrderId}</strong></li>
                            </ul>

                        </div>

                    </div>
                </div>
                <div class="table-search-v2 panel panel-dark margin-bottom-50">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-globe"></i> UI Shops . Inc</h3>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    

                                    <th>Price</th><th>Quantity</th>
                                    <th>SubTotal</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${o.purchaseOrderDetailCollection}" var="p">
                                    <tr>
                                        <td>

                                            <c:forEach items="${p.productId.imageCollection}" var="i">
                                                <c:if test="${i.displayOrder==1}">
                                                    <img class="rounded-x" src="${i.imagePath}" width="70" height="70" alt="">
                                                </c:if>
                                            </c:forEach>

                                        </td>
                                       
                                        <td>
                                            <strong>
                                                <c:set var="total" value="${p.unitPrice}"/>
                                                <fmt:setLocale value="en-US"/>
                                                <fmt:formatNumber value="${total}" 
                                                                  type="currency"/>
                                            </strong>
                                        </td>
                                        <td><strong>
                                                <p>${p.quantity}</p>
                                            </strong>
                                        </td>
                                        <td>
                                            <strong>
                                                <c:set var="t" value="${p.subtotal}"/>
                                                <fmt:setLocale value="en-US"/>
                                                <fmt:formatNumber value="${t}" 
                                                                  type="currency"/>
                                            </strong>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="col-md-4 md-margin-bottom-40"></div> 
                <div class="col-md-4 md-margin-bottom-40">

                </div><!--/col-md-3-->

                <div class="col-md-4 map-img md-margin-bottom-40">
                    <div class="headline"><h2 style="font-weight: bolder">Total</h2></div>
                    <address class="md-margin-bottom-40" style="font-size: 20px;">

                        Sub Total: <c:set var="xtotal" value="${o.subTotal/1.12}"/>
                        <fmt:setLocale value="en-US"/>
                        <strong style="float: right">
                            <fmt:formatNumber value="${xtotal}" maxFractionDigits="0"
                                              type="currency"/>.00
                        </strong>
                        <br />
                        Tax (10%): <c:set var="tax" value="${(o.subTotal/1.12)*0.1}"/>
                        <fmt:setLocale value="en-US"/>
                        <strong style="float: right">
                            <fmt:formatNumber value="${tax}"  maxFractionDigits="2"
                                              type="currency"/>
                        </strong>
                        <br />
                        Shipping (2%): <c:set var="ship" value="${(o.subTotal/1.12)*0.02}"/>
                        <fmt:setLocale value="en-US"/>
                        <strong style="float: right"><fmt:formatNumber value="${ship}"  maxFractionDigits="2"
                                          type="currency"/> </strong>
                        <br />
                        Total:<c:set var="total" value="${o.subTotal}"/>
                        <fmt:setLocale value="en-US"/>
                        <strong style="float: right">
                            <fmt:formatNumber value="${total}"  maxFractionDigits="2"
                                              type="currency"/> 
                        </strong>
                        <br />

                    </address>
                </div><!--/col-md-3-->
                <!-- End Address -->
                <div class="headline-center margin-bottom-60">
                    <h2>Thank you for your support, <strong>UIShop.Inc</strong></h2>
                    <p>
                        <c:url value="/" var="home"/>
                        <a href="${home}">
                            <img src="<c:url value="/img/logo1-default.png"/>" alt="There is no item in your shopping cart"/>
                        </a>
                    </p>
                </div>
            </div>
        </div><!--/end container-->
        
    </body>
</html>
