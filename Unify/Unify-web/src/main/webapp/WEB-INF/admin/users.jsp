<%@page import="com.aptechfpt.enumtype.Role"%>
<%@page import="com.aptechfpt.entity.Account"%>
<%@page import="com.aptechfpt.dto.AccountDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<t:adminLayout title="Shop UI - AdminPage - User Management">
    <jsp:attribute name="pagecss">
        <link href="<c:url value="/plugins/datatables/dataTables.bootstrap.css"/>" type="text/css"  rel="stylesheet"/>
    </jsp:attribute>
    <jsp:attribute name="pagejs">
        <script src="<c:url value="/plugins/datatables/jquery.dataTables.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/plugins/datatables/dataTables.bootstrap.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/plugins/slimScroll/jquery.slimscroll.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/plugins/bootstrap/js/tab.js"/>" type="text/javascript"></script>
        <script type="text/javascript">
            $(function () {
                jQuery(document).ready(function ($) {
                    $('#example1').DataTable();
            <c:forEach begin="0" end="${list.size()}" varStatus="loop">
                    $('ul#tabs${loop.index}').tab();
            </c:forEach>
                });
            })();
        </script> 
    </jsp:attribute>
    <jsp:body>
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <c:if test="${pageContext.request.isUserInRole('ADMINISTRATOR')}">
                        <div class="box-header">
                            <h3 class="box-title">Data Table With Full Features</h3>
                            <c:url value="/administrator/user/new" var="userCreateLink"/>
                            <a href="${userCreateLink}" class="btn btn-success pull-right">
                                <i class="fa fa-save"></i> Created
                            </a>
                        </div><!-- /.box-header -->
                    </c:if>
                    <div class="box-body">
                        <table id="example1" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Email</th>
                                    <th>Profile</th>
                                    <th>Full Name</th>
                                    <th>Gender</th>
                                    <th>SignUp Date</th>
                                    <th>Roles</th>
                                    <th>Status</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${list}" var="a" varStatus="loop">
                                    <tr>
                                        <td>${loop.index + 1}</td>
                                        <td>${a.email}</td>
                                        <td>
                                            <img height="100" src="<c:url value="${a.imageLink}"/>"/>
                                        </td>
                                        <td>${a.firstName} ${a.lastName}</td>
                                        <td>${a.gender.toString()}</td>
                                        <td>${a.createdDate.toString("dd-MM-YYYY")}</td>
                                        <td>
                                            <c:forEach var="r" items="${a.roles}">
                                                <p>${r}</p>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <c:if test="${a.available}">Available</c:if>
                                            <c:if test="${!a.available}">Banned</c:if>
                                            </td>
                                            <td>
                                                <a class="btn btn-success" href data-toggle="modal" data-target="#myModal${a.accountId}">
                                                <i class="glyphicon glyphicon-zoom-in icon-white"></i>
                                                View Detail
                                            </a>
                                            <c:if test="${pageContext.request.isUserInRole('ADMINISTRATOR')}">
                                                <c:if test="${a.available}">
                                                    <c:url value="/administrator/user/ban/${a.accountId}" var="banLink"/>
                                                    <a class="btn btn-danger" href="${banLink}" rel="Ban this User">
                                                        <i class="fa fa-lock icon-white"></i>
                                                    </a>
                                                </c:if>
                                                <c:if test="${!a.available}">
                                                    <a class="btn btn-primary" href="${banLink}"  rel="Unban this User">
                                                        <i class="fa fa-unlock icon-white"></i>
                                                    </a>
                                                </c:if>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div><!-- /.box-body -->
                </div>
            </div>
        </div>


        <!--Modal-->
        <c:forEach var="a" items="${list}" varStatus="loop">
            <div class="modal fade" id="myModal${a.accountId}" role="dialog">
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
                                            <c:set var="now" value="<%= new java.util.Date()%>" />
                                            <small class="pull-right">Date: <fmt:formatDate type="both" value="${now}" /></small>
                                        </h2>
                                    </div><!-- /.col -->
                                </div>
                                <!-- info row -->
                                <div class="row invoice-info">
                                    <div class="col-sm-4 invoice-col">
                                        Customer infomation
                                        <address>
                                            <strong>Email: ${a.email}</strong><br>
                                            Full Name: ${a.firstName} ${a.lastName}<br>
                                            Gender: ${a.gender}<br>
                                            Address: ${a.address}<br>  
                                            Phone: ${a.phone}<br>
                                            Website Role:<c:forEach items="${a.roles}" var="r">  ${r}</c:forEach><br>
                                            Date Of Birth: ${a.dayOfBirth.toString("dd-MM-YYYY")}<br>
                                            Created Date: ${a.createdDate.toString("dd-MM-YYYY hh:mm:ss")}<br>
                                        </address>
                                    </div><!-- /.col -->
                                    <div class="col-sm-4 invoice-col">
                                    </div><!-- /.col -->
                                    <div class="col-sm-4 invoice-col">
                                        <img class="pull-right img-responsive" height="200" src="<c:url value="${a.imageLink}"/>"/>
                                    </div><!-- /.col -->
                                </div><!-- /.row -->
                                <div class="row">

                                    <div class="tab-v1">
                                        <ul id="tabs${loop.index}" class="nav nav-tabs" data-tabs="tabs">
                                            <li class="active"><a href="#order${loop.index}" data-toggle="tab">Order</a></li>
                                            <li><a href="#comment${loop.index}" data-toggle="tab">Comment</a></li>
                                            <li><a href="#feedback${loop.index}" data-toggle="tab">FeedBack</a></li>
                                        </ul>
                                        <div id="my-tab-content" class="tab-content">
                                            <div class="tab-pane active" id="order${loop.index}">
                                                <table class="table table-bordered table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th></th>
                                                            <th>Name</th>
                                                            <th>Address</th>
                                                            <th>Phone</th>
                                                            <th>Status</th>
                                                            <th>Date</th>
                                                            <th>Subtotal</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="p" items="${a.purchaseOrderCollection}" varStatus="innerloop">
                                                            <tr>
                                                                <td>${innerloop.index + 1}</td>
                                                                <td>${p.name}</td>
                                                                <td>${p.address}</td>
                                                                <td>${p.phone}</td>
                                                                <td style="alignment-adjust: central">
                                                                    <c:if test="${p.status.equals(true)}">
                                                                        <strong><i class="fa fa-check margin-r-5"></i>  Finish</strong>
                                                                    </c:if>

                                                                    <c:if test="${p.status.equals(false)}">

                                                                        <strong><i class="fa fa-truck margin-r-5"></i>  Delivering</strong>
                                                                    </c:if>                                           
                                                                </td>
                                                                <td>
                                                                    ${p.createdDate.toString('mm:hh dd-mm-yyyy')}
                                                                </td>
                                                                <td>
                                                                    <c:set var="total" value="${p.subTotal}"/>
                                                                    <fmt:setLocale value="en-US"/>
                                                                    <fmt:formatNumber value="${total}" 
                                                                                      type="currency"/>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="tab-pane" id="comment${loop.index}">
                                                <table class="table table-bordered table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th></th>
                                                            <th>ProductPage</th>
                                                            <th>Likes</th>
                                                            <th>Content</th>
                                                            <th>CreatedDate</th>
                                                            <th>ModifiedDate</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="c" items="${a.commentCollection}" varStatus="innerloop">
                                                            <tr>
                                                                <td>${innerloop.index + 1}</td>
                                                                <td>${c.productId.name}</td>
                                                                <td>${c.like}</td>
                                                                <td>${c.comments}</td>
                                                                <td>
                                                                    ${c.createdDate.toString('dd-MM-yyyy mm:hh ')}
                                                                </td>
                                                                <td>
                                                                    ${c.modifiedDate.toString('dd-MM-yyyy mm:hh')}
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="tab-pane" id="feedback${loop.index}">
                                                <table class="table table-bordered table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th></th>
                                                            <th>Title</th>
                                                            <th>Create Date</th>
                                                            <th>Status</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="f" items="${a.feedBackCollection}" varStatus="innerloop">
                                                            <tr>
                                                                <td>${innerloop.index + 1}</td>
                                                                <td>${f.title}</td>
                                                                <td>
                                                                    ${f.createdDate.toString('dd-MM-yyyy mm:hh ')}
                                                                </td>
                                                                <td>
                                                                    <c:if test="${f.status == 1}">Read</c:if>
                                                                    <c:if test="${f.status == 0}">UnRead</c:if>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </div>
                        <div class="modal-footer">                                
                            <button type="button" class="btn btn-success btn-flat" data-dismiss="modal">Close</button>                                
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <!--End Modal-->
    </jsp:body>
</t:adminLayout>