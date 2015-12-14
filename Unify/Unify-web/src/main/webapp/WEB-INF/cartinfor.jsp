<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<t:defaultLayout title="Shop UI - Checkout">
    <jsp:attribute name="pagecss">
        <link rel="stylesheet" href="<c:url value="/css/pages/log-reg-v3.css"/>">
        <link rel="stylesheet" href="<c:url value="/plugins/jquery-steps/css/custom-jquery.steps.css"/>">
    </jsp:attribute>
    <jsp:attribute name="pagejs">
        <script src="<c:url value="/plugins/sky-forms-pro/skyforms/js/jquery.validate.min.js"/>"></script>
        <!--<script src="<c:url value="/plugins/jquery-steps/build/jquery.steps.js"/>"></script>-->
        <script src="<c:url value="/plugins/jquery-steps/build/jquery.steps.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/js/forms/page_login.js"/>"></script>
        <script src="<c:url value="/js/plugins/stepWizard.js"/>"></script>
        <script src="<c:url value="/js/forms/product-quantity.js"/>"></script>
        <script src="<c:url value="/plugins/angular.min.js"/>"></script>
        <script src="<c:url value="/js/shoppingcart.js"/>"></script>
        <script src="<c:url value="/plugins/jquery/jquery.min.js"/>"></script>

        <script>
            jQuery(document).ready(function () {
                App.init();
                Login.initLogin();
                App.initScrollBar();
                StepWizard.initStepWizard();
                //        StyleSwitcher.initStyleSwitcher();      
            });
        </script>
    </jsp:attribute>
    <jsp:body>

        <!--=== Breadcrumbs v4 ===-->
        <div class="breadcrumbs-v4">
            <div class="container">
                <div class="filter"></div>
                <span class="page-name">Check Out</span>
                <h1>Maecenas <span class="shop-green">enim</span> sapien</h1>
                <ul class="breadcrumb-v4-in">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="">Product</a></li>
                    <li><a href="">Shopping cart</a></li>
                    <li class="active"><a href="">Shopping cart information</a></li>
                </ul>
            </div><!--/end container-->
        </div> 
        <!--=== End Breadcrumbs v4 ===-->

        <!--=== Content Medium Part ===-->
        <div class="content-md margin-bottom-30">
            <div class="container">
                <div class="col-md-7 md-margin-bottom-60">
                    <div class="headline-left margin-bottom-20">
                        <h2 class="headline-brd">YOUR SHOPPING CART INFORMATION</h2>
                        <c:set var="now" value="<%=new java.util.Date()%>" />
                        <p style="font-size: 20px;">Date: <fmt:formatDate type="both" 
                                        value="${now}" /></p>
                    </div><!--/end Headline Left-->

                    <div class="row">
                        <div class="col-sm-10">

                            <ul class="list-unstyled checked-list" style="font-size: 20px;">
                                <li><i class="fa fa-check"></i>  Name: <strong>${o.name}</strong></li>
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
                                    <th class="hidden-sm">Description</th>

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
                                        <td class="td-width">

                                            <p>${p.productId.description}</p>

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
            </div><!--/end container-->
            <!--=== End Content Medium Part ===-->     

        </jsp:body>
    </t:defaultLayout>