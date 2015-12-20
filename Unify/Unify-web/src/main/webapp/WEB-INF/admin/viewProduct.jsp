<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                        <h3 class="box-title">Product List</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <table id="example1" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                    <th>Like</th>
                                    <th>Gender</th>
                                    <th>Category</th>
                                    <th>Sub Category</th>
                                    <td>Available</td>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${prolist}" var="p">
                                    <tr>
                                        <td>${p.name}</td>
                                        <td>
                                            <c:set var="price" value="${p.unitPrice}"/>
                                            <fmt:setLocale value="en_US"/>
                                            <fmt:formatNumber value="${price}" type="currency"/>
                                        </td>
                                        <td>${p.like}</td>
                                        <td>
                                            <c:if test="${p.gender==0}">Men</c:if>
                                            <c:if test="${p.gender==1}">Women</c:if>
                                            <c:if test="${p.gender==2}">Kid</c:if>
                                            </td>
                                            <td>${p.subCategoryId.categoryId.name}</td>
                                        <td>${p.subCategoryId.name}</td>
                                        <td>
                                            <c:if test="${p.available==true}">Yes</c:if>
                                            <c:if test="${p.available==false}">No</c:if>
                                            </td>
                                            <td>
                                                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal${p.productId}">
                                                <i class="glyphicon glyphicon-zoom-in icon-white"></i>
                                                View
                                            </button>
                                            <div id="myModal${p.productId}" class="modal fade" role="dialog">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h4 class="modal-title">Product Details</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>Product Name: ${p.name}</p>
                                                            <p>Product Price: 
                                                                <c:set var="price" value="${p.unitPrice}"/>
                                                                <fmt:setLocale value="en_US"/>
                                                                <fmt:formatNumber value="${price}" type="currency"/>
                                                            </p>
                                                            <p>Like: ${p.like}</p>
                                                            <p>Gender: 
                                                                <c:if test="${p.gender==0}">Men</c:if>
                                                                <c:if test="${p.gender==1}">Women</c:if>
                                                                <c:if test="${p.gender==2}">Kid</c:if>
                                                                </p>
                                                                <p>Category: ${p.subCategoryId.categoryId.name}</p>
                                                            <p>Sub Category Name: ${p.subCategoryId.name}</p>
                                                            <p>Description: ${p.description}</p>
                                                            <p>Images:
                                                                <c:forEach var="img" items="${p.imageCollection}">
                                                                    <c:url value="/product/${p.productId}" var="productdetail"/>
                                                                    <img class="full-width img-responsive" src="../${img.imagePath}" alt="">
                                                                </c:forEach>
                                                            </p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <c:url value="/administrator/updateProduct/${p.productId}" var="updateProduct"/>
                                            <a class="btn btn-info" href="${updateProduct}">
                                                <i class="glyphicon glyphicon-edit icon-white"></i>
                                                Edit
                                            </a>
                                            <c:if test="${p.available==true}">
                                                <c:url value="/administrator/disProduct/${p.productId}" var="disProduct"/>
                                                <a class="btn btn-danger" href="${disProduct}">
                                                    <i class="glyphicon glyphicon-remove icon-white"></i>
                                                </a>
                                            </c:if>
                                            <c:if test="${p.available==false}">
                                                <c:url value="/administrator/enProduct/${p.productId}" var="enProduct"/>
                                                <a class="btn btn-primary" href="${enProduct}">
                                                    <i class="glyphicon glyphicon-ok icon-white"></i>
                                                </a>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:adminLayout>