<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                        <c:url value="/administrator/user/new" var="userCreateLink"/>
                        <a href="${userCreateLink}" class="btn btn-success pull-right">
                            <i class="fa fa-save"></i> Created
                        </a>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <table id="example1" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Email</th>
                                    <th>Profile</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Gender</th>
                                    <th>Created Date</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${list}" var="a">
                                    <tr>
                                        <td>${a.accountId}</td>
                                        <td>${a.email}</td>
                                        <td>
                                            <img height="100" src="<c:url value="${a.imageLink}"/>"/>
                                        </td>
                                        <td>${a.firstName}</td>
                                        <td>${a.lastName}</td>
                                        <td>${a.gender.toString()}</td>
                                        <td>${a.createdDate.toString("dd-MM-YYYY")}</td>
                                        <td>
                                            <a class="btn btn-success" href="#">
                                                <i class="glyphicon glyphicon-zoom-in icon-white"></i>
                                                View
                                            </a>
                                            <a class="btn btn-info" href="#">
                                                <i class="glyphicon glyphicon-edit icon-white"></i>
                                                Edit
                                            </a>
                                            <c:if test="${pageContext.request.isUserInRole('ADMINISTRATOR')}">
                                                <c:if test="${p.isAvailable}">
                                                    <a class="btn btn-danger" href="#">
                                                        <i class="glyphicon glyphicon-remove icon-white"></i>
                                                    </a>
                                                </c:if>
                                                <c:if test="${!p.isAvailable}">
                                                    <a class="btn btn-primary" href="#">
                                                        <i class="glyphicon glyphicon-ok icon-white"></i>
                                                    </a>
                                                </c:if>
                                            </c:if>
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
    </jsp:body>
</t:adminLayout>