<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<t:adminLayout title="Shop UI - AdminPage - User Management">
    <jsp:attribute name="pagecss">
        <link href="<c:url value="/plugins/datatables/dataTables.bootstrap.css"/>" type="text/css"  rel="stylesheet"/>
        <link href="<c:url value="/plugins/bootstrap/css/bootstrap.min.css"/>" type="text/css"  rel="stylesheet"/>
        <link href="<c:url value="/plugins/bootstrap/css/bootstrap-theme.min.css"/>" type="text/css"  rel="stylesheet"/>
    </jsp:attribute>
    <jsp:attribute name="pagejs">
        <script src="<c:url value="/plugins/datatables/jquery.dataTables.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/plugins/ng-file-upload-bower-10.1.9/ng-file-upload.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/plugins/input-mask/jquery.inputmask.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/plugins/datatables/dataTables.bootstrap.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/plugins/slimScroll/jquery.slimscroll.min.js"/>" type="text/javascript"></script>
        <script>
            $(function () {
                $('#example1').DataTable();
            });
        </script>
        <script>
            var app = angular.module('myApp', []);
            app.controller('validateCtrl', function ($scope) {
                $scope.txtName = "${pro.name}";
                $scope.txtImport = "${imp}";
                $scope.txtPrice = "${pro.unitPrice}";
                $scope.txtDes = "${pro.description}";
            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form role="form" method="POST" action="<c:url value="/AdminProduct"/>"
                          ng-app="myApp" name="myForm" ng-controller="validateCtrl" novalidate>
                        <div class="box-header with-border">
                            <h3 class="box-title">Update Product</h3>
                        </div>
                        <div class="box-body">
                                <input hidden="true" name="txtId" value="${pro.productId}">
                            <div class="form-group">
                                <label for="">Product Name</label>
                                <input type="text" class="form-control" name="txtName" ng-model="txtName"
                                       required ng-trim="true" ng-pattern="/^[0-9a-zA-Z\s]{3,20}$/"/>
                                <span style="color: red" ng-show="myForm.txtName.$dirty && myForm.txtName.$invalid">
                                    <span ng-show="myForm.txtName.$error.required">Product name cant be blank</span>
                                    <span ng-show="myForm.txtname.$error.pattern">The value is not a valid Name!</span>
                                </span>
                            </div>
                            <div class="form-group">
                                <label for="">Import Price</label>
                                <input type="text" class="form-control" name="txtImport" ng-model="txtImport" required
                                       ng-trim="true" ng-pattern="/^\d{1,5}\.{0,1}\d{0,4}$/"/>
                                <span style="color: red" ng-show="myForm.txtImport.$dirty && myForm.txtImport.$invalid">
                                    <span ng-show="myForm.txtImport.$error.required">Import Price cant be blank</span>
                                    <span ng-show="myForm.txtImport.$error.pattern">The value is not a valid Price!</span>
                                </span>
                            </div>

                            <div class="form-group">
                                <label for="">Unit Price</label>
                                <input type="text" class="form-control" name="txtPrice" ng-model="txtPrice" required
                                       ng-trim="true" ng-pattern="/^\d{1,5}\.{0,1}\d{0,4}$/"/>
                                <span style="color: red" ng-show="myForm.txtPrice.$dirty && myForm.txtPrice.$invalid">
                                    <span ng-show="myForm.txtPrice.$error.required">Product Price cant be blank</span>
                                    <span ng-show="myForm.txtPrice.$error.pattern">The value is not a valid Price!</span>
                                </span>
                            </div>
                            <div class="form-group">
                                <label>Gender</label>
                                <select class="form-control" name="txtGender" >
                                    <c:if test="${pro.gender==0}">
                                        <option selected value="0">Men</option>
                                        <option value="1">Women</option>
                                        <option value="2">Kid</option>
                                    </c:if>
                                    <c:if test="${pro.gender==1}">
                                        <option value="0">Men</option>
                                        <option selected value="1">Women</option>
                                        <option value="2">Kid</option>
                                    </c:if>
                                    <c:if test="${pro.gender==2}">
                                        <option value="0">Men</option>
                                        <option value="1">Women</option>
                                        <option selected value="2">Kid</option>
                                    </c:if>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea rows="3" class="form-control" name="txtDes" ng-model="txtDes" required></textarea>
                                <span style="color: red" ng-show="myForm.txtDes.$dirty && myForm.txtDes.$invalid">
                                    <span ng-show="myForm.txtDes.$error.required">Description cant be blank</span>
                                </span>
                            </div>
                            <div class="form-group">
                                <label>Sub Category</label>
                                <select class="form-control" name="txtSub">
                                    <c:forEach var="s" items="${sublist}">
                                        <c:if test="${s.subCategoryId==pro.subCategoryId.subCategoryId}">
                                            <option selected value="${s.subCategoryId}">${s.name}</option>
                                        </c:if>
                                        <c:if test="${s.subCategoryId!=pro.subCategoryId.subCategoryId}">
                                            <option value="${s.subCategoryId}">${s.name}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="">Choose Image</label>
                                <input type="file" id="txtImg" multiple name="txtImg">
                                <c:forEach var="img" items="${pro.imageCollection}">
                                    <c:url value="/product/${pro.productId}" var="productdetail"/>
                                </c:forEach>

                            </div>
                            <div class="checkbox">
                                <c:if test="${pro.available==true}">
                                    <label>
                                        <input type="checkbox" name="txtAvailable" value="true" checked> Available
                                    </label>
                                </c:if>
                                <c:if test="${pro.available==false}">
                                    <label>
                                        <input type="checkbox" name="txtAvailable" value="true"> Available
                                    </label>
                                </c:if>
                            </div>
                        </div><!-- /.box-body -->

                        <div class="box-footer">
                            <button type="submit" class="btn btn-primary" name="action" value="update"
                                   ng-disabled="myForm.$invalid" >Update</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </jsp:body>
</t:adminLayout>