<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<t:adminLayout title="Shop UI - AdminPage - User Management">
    <jsp:attribute name="pagejs"></script>
        <script>
            $(function () {
                $('#example1').DataTable();
            });
        </script>
        <script>
            angular.module('app').controller('validateCtrl', function ($scope) {
            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form role="form" method="POST" action="<c:url value="/administrator/addProduct/add"/>"
                          enctype="multipart/form-data"
                          ng-app="app" name="myForm" ng-controller="validateCtrl" novalidate>
                        <div class="box-header with-border">
                            <h3 class="box-title">Add New Product</h3>
                        </div>
                        <div class="box-body">
                            <div class="form-group">
                                <label for="">Product Name</label>
                                <input type="text" class="form-control" name="txtName" ng-model="txtName"
                                       placeholder="Product Name" required ng-trim="true"
                                       ng-pattern="/^[0-9a-zA-Z\s]{3,20}$/"/>
                                <span style="color: red" ng-show="myForm.txtName.$dirty && myForm.txtName.$invalid">
                                    <span ng-show="myForm.txtName.$error.required">Product name cant be blank</span>
                                    <span ng-show="myForm.txtNsame.$error.pattern">The value is not a valid Name!</span>
                                </span>
                            </div>
                            <div class="form-group">
                                <label for="">Import Price</label>
                                <input type="text" class="form-control" name="txtImport" ng-model="txtImport" required
                                       placeholder="Import Prcie" ng-trim="true" ng-pattern="/^\d{1,5}\.{0,1}\d{0,2}$/"/>
                                <span style="color: red" ng-show="myForm.txtImport.$dirty && myForm.txtImport.$invalid">
                                    <span ng-show="myForm.txtImport.$error.required">Import Price cant be blank</span>
                                    <span ng-show="myForm.txtImport.$error.pattern">The value is not a valid Price!</span>
                                </span>
                            </div>
                            <div class="form-group">
                                <label for="">Unit Price</label>
                                <input type="text" class="form-control" name="txtPrice" ng-model="txtPrice" required
                                       placeholder="Product Prcie" ng-trim="true" ng-pattern="/^\d{1,5}\.{0,1}\d{0,2}$/"/>
                                <span style="color: red" ng-show="myForm.txtPrice.$dirty && myForm.txtPrice.$invalid">
                                    <span ng-show="myForm.txtPrice.$error.required">Product Price cant be blank</span>
                                    <span ng-show="myForm.txtPrice.$error.pattern">The value is not a valid Price!</span>
                                </span>
                            </div>
                            <div class="form-group">
                                <label>Gender</label>
                                <select class="form-control" name="txtGender">
                                    <option value="0">Men</option>
                                    <option value="1">Women</option>
                                    <option value="2">Kid</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea rows="3" class="form-control" name="txtDes" ng-model="txtDes" required 
                                          placeholder="Description"></textarea>
                                <span style="color: red" ng-show="myForm.txtDes.$dirty && myForm.txtDes.$invalid">
                                    <span ng-show="myForm.txtDes.$error.required">Description cant be blank</span>
                                </span>
                            </div>
                            <div class="form-group">
                                <label>Sub Category</label>
                                <select class="form-control" name="txtSub">
                                    <c:forEach var="s" items="${sublist}">
                                        <option value="${s.subCategoryId}">${s.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="txtAvailable" value="true"> Available
                                </label>
                            </div>
                            <div class="form-group">
                                <label for="">Choose Image</label>
                                <input type="file" id="txtImg" multiple name="txtImg">
                            </div>
                            
                        </div><!-- /.box-body -->

                        <div class="box-footer">
                            <button type="submit" class="btn btn-primary" value="add"
                                    ng-disabled="myForm.$invalid">Add</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </jsp:body>
</t:adminLayout>