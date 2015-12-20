<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<t:adminLayout title="Shop UI - AdminPage - User Management">
    <jsp:attribute name="pagecss">
        <!--<link href="<c:url value="/plugins/datatables/dataTables.bootstrap.css"/>" type="text/css"  rel="stylesheet"/>-->
        <link href="<c:url value="/plugins/bootstrap/css/bootstrap.min.css"/>" type="text/css"  rel="stylesheet"/>
        <!--<link href="<c:url value="/plugins/bootstrap/css/bootstrap-theme.min.css"/>" type="text/css"  rel="stylesheet"/>-->
    </jsp:attribute>
    <jsp:attribute name="pagejs">
<!--        <script src="<c:url value="/plugins/datatables/jquery.dataTables.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/plugins/ng-file-upload-bower-10.1.9/ng-file-upload.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/plugins/input-mask/jquery.inputmask.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/plugins/datatables/dataTables.bootstrap.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/plugins/slimScroll/jquery.slimscroll.min.js"/>" type="text/javascript"></script>-->
<!--        <script>
            $(function () {
                $('#example1').DataTable();
            });
        </script>-->
       
    </jsp:attribute>
    <jsp:body>
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form role="form" method="POST" action="<c:url value="/administrator/updateSubCategory/update"/>"
                          ng-app="app" name="myForm" ng-controller="UserController" novalidate>
                        <div class="box-header with-border">
                            <h3 class="box-title">Update Sub Category</h3>
                        </div>
                        <div class="box-body">
                            <input hidden="true" name="txtId" value="${sub.subCategoryId}">
                            <div class="form-group">
                                <label for="">Sub Category Name</label>
                                <div ng-init="txtName='${sub.name}'"></div>
                                <input type="text" class="form-control" name="txtName" ng-model="txtName"
                                      required ng-trim="true" ng-pattern="/^[a-zA-Z\s]{3,20}$/"/>
                                <span style="color: red" ng-show="myForm.txtName.$dirty && myForm.txtName.$invalid">
                                    <span ng-show="myForm.txtName.$error.required">Sub Category name cant be blank</span>
                                    <span ng-show="myForm.txtName.$error.pattern">The value is not a valid Name!</span>
                                </span>
                            </div>
                            <div class="form-group">
                                <label>Sub Category</label>
                                <select class="form-control" name="txtCategory">
                                    <c:forEach var="c" items="${categorylist}">
                                        <c:if test="${c.categoryId==sub.categoryId.categoryId}">
                                            <option selected value="${c.categoryId}">${c.name}</option>
                                        </c:if>
                                        <c:if test="${c.categoryId!=sub.categoryId.categoryId}">
                                            <option value="${c.categoryId}">${c.name}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                        </div><!-- /.box-body -->

                        <div class="box-footer">
                            <button type="submit" class="btn btn-primary" value="update"
                                    ng-disabled="myForm.$invalid">Update</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </jsp:body>
</t:adminLayout>