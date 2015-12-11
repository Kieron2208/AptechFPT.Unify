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
                        <h3 class="box-title">Sub Category List</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <table id="example1" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>Sub Category Name</th>
                                    <th>Category Name</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${sublist}" var="s">
                                    <tr>
                                        <td>${s.name}</td>
                                        <td>${s.categoryId.name}</td>
                                        <td>
                                            <a class="btn btn-success" href="#">
                                                <i class="glyphicon glyphicon-zoom-in icon-white"></i>
                                                View
                                            </a>
                                            <a class="btn btn-info" href="#">
                                                <i class="glyphicon glyphicon-edit icon-white"></i>
                                                Edit
                                            </a>
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