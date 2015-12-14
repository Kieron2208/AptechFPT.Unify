<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<t:adminLayout title="Shop UI - AdminPage - User Management">
    <jsp:attribute name="pagecss">
        <link href="<c:url value="/plugins/datatables/dataTables.bootstrap.css"/>" type="text/css"  rel="stylesheet"/>
    </jsp:attribute>
    <jsp:attribute name="pagejs">
        <script src="<c:url value="/plugins/datatables/jquery.dataTables.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/plugins/datatables/dataTables.bootstrap.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/plugins/slimScroll/jquery.slimscroll.min.js"/>" type="text/javascript"></script>
        <script>
            $(function () {
                $('#example1').DataTable();
            });
        </script>
    </jsp:attribute>
    <jsp:body>
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
                                    <th>ID</th>

                                    <th>Name</th>
                                    <th>Address</th>
                                    <th>Phone</th>
                                    <th>Status</th>
                                    <th>Date</th>
                                    <th>Subtotal</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="p" items="${list}">
                                    <tr>
                                        <td>${p.purchaseOrderId}</td>

                                        <td>${p.name}</td>
                                        <td>${p.address}</td>
                                        <td>${p.phone}</td>
                                        <td style="alignment-adjust: central">
                                            <c:if test="${p.status.equals(true)}">
                                                <strong><i class="fa fa-check margin-r-5"></i>  Finish</strong>
                                            </a>
                                            </c:if>
                                                
                                            <c:if test="${p.status.equals(false)}">
                                                <form method="post" action="../POUpdate">
                                                    <input type="hidden" name="id" value="${p.purchaseOrderId}"/>
                                                    <strong><i class="fa fa-location-arrow margin-r-5"></i></strong>                                                    
                                                    <input type="submit" class="btn btn-link" value="Approve">
                                                </form>
                                                <form method="post" action="../POCancel">
                                                    <input type="hidden" name="id" value="${p.purchaseOrderId}"/> 
                                                    <strong><i class="fa fa-close margin-r-5"></i></strong>
                                                    <input type="submit" class="btn btn-link" value="Cancel">
                                                </form>    
                                            </c:if>                                           
                                        </td>
                                        <td>
                                            ${p.createdDate}

                                        </td>
                                        <td>
                                            <c:set var="total" value="${p.subTotal}"/>
                                            <fmt:setLocale value="en-US"/>
                                            <fmt:formatNumber value="${total}" 
                                                              type="currency"/>
                                        </td>
                                        <td>

                                            <a class="btn btn-success" href data-toggle="modal" data-target="#myModal${p.purchaseOrderId}">
                                                <i class="glyphicon glyphicon-zoom-in icon-white"></i>
                                            </a>

                                        </td>
                                    </tr>

                                </c:forEach>




                            </tbody>
                            <!--                            <tfoot>
                                                            <tr>
                                                                <th>Rendering engine</th>
                                                                <th>Browser</th>
                                                                <th>Platform(s)</th>
                                                                <th>Engine version</th>
                                                                <th>CSS grade</th>
                                                            </tr>
                                                        </tfoot>-->
                        </table>
                    </div><!-- /.box-body -->
                </div>
            </div>
        </div>

        <!--Modal-->
        <c:forEach var="p" items="${list}">
            <div class="modal fade" id="myModal${p.purchaseOrderId}" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">INVOICE INFORMATION</h4>
                        </div>
                        <div class="modal-body">
                            <section class="invoice">
                                <!-- title row -->
                                <div class="row">
                                    <div class="col-xs-12">
                                        <h2 class="page-header">
                                            <i class="fa fa-globe"></i> UIShop, Inc.
                                            <c:set var="now" value="<%=new java.util.Date()%>" />
                                            <small class="pull-right">Date: <fmt:formatDate type="both" 
                                                            value="${now}" />
                                            </small>
                                        </h2>
                                    </div><!-- /.col -->
                                </div>
                                <!-- info row -->
                                <div class="row invoice-info">
                                    <div class="col-sm-4 invoice-col">
                                        Customer infomation
                                        <address>
                                            <strong>${p.name}</strong><br>
                                            ${p.address}<br>

                                            Phone: ${p.phone}<br>

                                        </address>
                                    </div><!-- /.col -->
                                    <div class="col-sm-4 invoice-col">

                                    </div><!-- /.col -->
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
                                    </div><!-- /.col -->
                                </div><!-- /.row -->

                                <!-- Table row -->
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
                                    </div><!-- /.col -->
                                </div><!-- /.row -->

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
        <!--End Modal-->
    </jsp:body>
</t:adminLayout>