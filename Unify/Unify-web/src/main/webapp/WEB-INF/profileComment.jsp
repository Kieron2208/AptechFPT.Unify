<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:defaultLayout title="Shop UI - Profile">
    <jsp:attribute name="pagecss">
        <link href="<c:url value="/css/pages/profile.css"/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/plugins/sky-forms-pro/skyforms/css/sky-forms.css"/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css"/>" rel="stylesheet" type="text/css"/>
    </jsp:attribute>
    <jsp:body>
        <!--=== Breadcrumbs v4 ===-->
        <div class="breadcrumbs-v4">
            <div class="container">
                <div class="filter"></div>
                <span class="page-name">&nbsp;</span>
                <h1>Maecenas <span class="shop-green">enim</span> sapien</h1>
                <ul class="breadcrumb-v4-in">
                    <c:url value="/" var="home"/>
                    <li><a href="${home}">Home</a></li>
                    <li><a href="">Product</a></li>
                    <li class="active">Product Filter Page</li>
                </ul>
            </div><!--/end container-->
        </div> 
        <!--=== End Breadcrumbs v4 ===-->

        <!--=== Profile ===-->
        <div class="container content profile">
            <div class="row">
                <jsp:include page="profileMenu.jsp">
                    <jsp:param name="active" value="comment"/>
                </jsp:include>

                <!-- Profile Content -->
                <div class="col-md-9">
                    <div class="profile-body margin-bottom-20">
                        
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="box">
                                    <div class="box-header">
                                        <h3 class="box-title">Data Table With Full Features</h3>
                                    </div><!-- /.box-header -->
                                    <div class="box-body">
                                        <table id="example1" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th>Product Name</th>
                                                    <th>Like</th>
                                                    <th>Content</th>
                                                    <th>Created Date</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="p" items="${list.commentCollection}" varStatus="loop">
                                                    <tr>
                                                        <td>${loop.index + 1}</td>
                                                        <td>${p.productId.name}</td>
                                                        <td>${p.like}</td>
                                                        <td>${p.comment}</td>
                                                        <td>${p.createdDate.toString('MMMM-dd-yyyy')}                                        
                                                        </td>
                                                        <td>${p.modifiedDate.toString('MMMM-dd-yyyy')}                                        
                                                        </td>
<!--                                                <td>

                                                    <a class="btn btn-success" href data-toggle="modal" data-target="#myModal${loop.index}">
                                                        <i class="glyphicon glyphicon-zoom-in icon-white"></i>
                                                    </a>
                                                </td>-->
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div><!-- /.box-body -->
                                </div>
                            </div>
                        </div>
<!--
                        Modal
                        <c:forEach var="p" items="${list}" varStatus="loop">
                            <div class="modal fade" id="myModal${loop.index}" role="dialog">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">INVOICE INFORMATION</h4>
                                        </div>
                                        <div class="modal-body">
                                            <section class="invoice">
                                                 title row 
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                        <h2 class="page-header">
                                                            <i class="fa fa-globe"></i> UIShop, Inc.
                                                            <c:set var="now" value="<%=new java.util.Date()%>" />
                                                            <small class="pull-right">Date: <fmt:formatDate type="both" 
                                                                                                            value="${now}" />
                                                            </small>
                                                        </h2>
                                                    </div> /.col 
                                                </div>
                                                 info row 
                                                <div class="row invoice-info">
                                                    <div class="col-sm-4 invoice-col">
                                                        Customer infomation
                                                        <address>
                                                            <strong>${p.name}</strong><br>
                                                            ${p.address}<br>
                                                            Phone: ${p.phone}<br>

                                                        </address>
                                                    </div> /.col 
                                                    <div class="col-sm-4 invoice-col">

                                                    </div> /.col 
                                                    <div class="col-sm-4 invoice-col">
                                                        <b>Invoice #${p.purchaseOrderId}</b><br>

                                                        <b>Status:</b>
                                                        <c:if test="${p.status.equals(true)}">
                                                            Done
                                                        </c:if>
                                                        <c:if test="${p.status.equals(false)}">
                                                            On Progress
                                                        </c:if>                                        

                                                        <br>
                                                        <b>Payment Due:</b>${p.createdDate}<br>
                                                        <b>Account:</b> #${p.accountId.accountId}
                                                    </div> /.col 
                                                </div> /.row 

                                                 Table row 
                                                <div class="row">
                                                    <div class="col-xs-12 table-responsive">
                                                        <table class="table table-striped">
                                                            <thead>
                                                                <tr>
                                                                    <th>Serial #</th>
                                                                    <th>Product</th>
                                                                    <th>Quantity</th>
                                                                    <th>Price</th>
                                                                    <th>Description</th>
                                                                    <th>Subtotal</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach items="${p.purchaseOrderDetailCollection}" var="item">
                                                                    <tr>
                                                                        <td>${item.productId.productId}</td>
                                                                        <td>${item.productId.name}</td>
                                                                        <td>${item.quantity}</td>
                                                                        <td>
                                                                            <c:set var="price" value="${item.unitPrice}"/>
                                                                <fmt:setLocale value="en-US"/>
                                                                <fmt:formatNumber value="${price}" 
                                                                                  type="currency"/>
                                                                </td>
                                                                <td>${item.productId.description}</td>
                                                                <td>
                                                                    <c:set var="subtotal" value="${item.subtotal}"/>
                                                                <fmt:setLocale value="en-US"/>
                                                                <fmt:formatNumber value="${subtotal}" 
                                                                                  type="currency"/>
                                                                </td>
                                                                </tr>
                                                            </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div> /.col 
                                                </div> /.row 

                                                <div class="row">
                                                    <div class="col-xs-6">

                                                    </div>
                                                    <div class="col-xs-6">
                                                        <p class="lead">Amount Due ${p.createdDate}</p>
                                                        <div class="table-responsive">
                                                            <table class="table">
                                                                <tr>
                                                                    <th style="width:50%">Subtotal:</th>
                                                                    <td>
                                                                        <c:set var="xtotal" value="${p.subTotal/1.12}"/>
                                                                <fmt:setLocale value="en-US"/>
                                                                <fmt:formatNumber value="${xtotal}" maxFractionDigits="0"
                                                                                  type="currency"/>.00                                                        
                                                                </td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Tax(10%):</th>
                                                                    <td>
                                                                        <c:set var="tax" value="${(p.subTotal/1.12)*0.1}"/>
                                                                <fmt:setLocale value="en-US"/>
                                                                <fmt:formatNumber value="${tax}"  maxFractionDigits="2"
                                                                                  type="currency"/>
                                                                </td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Shipping(2%):</th>
                                                                    <td>
                                                                        <c:set var="ship" value="${(p.subTotal/1.12)*0.02}"/>
                                                                <fmt:setLocale value="en-US"/>
                                                                <fmt:formatNumber value="${ship}"  maxFractionDigits="2"
                                                                                  type="currency"/>
                                                                </td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Total:</th>
                                                                    <td>
                                                                        <c:set var="total" value="${p.subTotal}"/>
                                                                <fmt:setLocale value="en-US"/>
                                                                <fmt:formatNumber value="${total}"  maxFractionDigits="2"
                                                                                  type="currency"/>
                                                                </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>

                                                </div>
                                            </section>
                                            <div class="modal-footer">                                
                                                <button type="button" class="btn btn-success btn-flat" data-dismiss="modal">Close</button>                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        End Modal-->
                    </div>
                </div>
                <!-- End Profile Content -->
            </div>
        </div><!--/container-->
        <!--=== End Profile ===-->

    </jsp:body>
</t:defaultLayout>