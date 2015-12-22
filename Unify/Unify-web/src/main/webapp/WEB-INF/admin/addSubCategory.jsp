<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<t:adminLayout title="Shop UI - AdminPage - User Management">
    <jsp:attribute name="pagejs">
        
        <script>
            $(function () {
                $('#example1').DataTable();
            });
        </script>
        <script>
            
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="row" ng-app="app" ng-controller="UserController">
            <div class="col-xs-12">
                <div class="box">
                    <form role="form" 
                          method="POST" 
                          action="<c:url value="/administrator/addSubCategory/add"/>"
                           name="myForm" novalidate>
                        <div class="box-header with-border">
                            <h3 class="box-title">Add New Sub Category</h3>
                        </div>
                        <div class="box-body">
                            <div class="form-group">
                                <label for="">Sub Category Name</label>
                                <input type="text" class="form-control" name="txtName" ng-model="txtName"
                                       placeholder="Sub Category Name" required ng-trim="true"
                                       ng-pattern="/^[a-zA-Z\s]{3,20}$/"/>
                                <span style="color: red" ng-show="myForm.txtName.$dirty && myForm.txtName.$invalid">
                                    <span ng-show="myForm.txtName.$error.required">Sub Category name cant be blank</span>
                                    <span ng-show="myForm.txtName.$error.pattern">The value is not a valid Name!</span>
                                </span>
                            </div>re
                            <div class="form-group">
                                <label>Sub Category</label>
                                <select class="form-control" name="txtCategory">
                                    <c:forEach var="c" items="${categorylist}">
                                        <option value="${c.categoryId}">${c.name}</option>
                                    </c:forEach>
                                </select>
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