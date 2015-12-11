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
                    <form role="form" method="POST" action="<c:url value="/AdminProduct"/>">
                        <div class="box-header with-border">
                            <h3 class="box-title">Add New Product</h3>
                        </div>
                        <div class="box-body">
                            <div class="form-group">
                                <label for="">Product Name</label>
                                <input type="text" class="form-control" name="txtName" id="txtName" placeholder="Product Name">
                            </div>
                            <div class="form-group">
                                <label for="">Unit Price</label>
                                <input type="number" class="form-control" name="txtPrice" id="txtPrice" placeholder="Prcie"/>
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
                                <textarea rows="3" class="form-control" name="txtDes" id="txtDes" placeholder="Description"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Sub Category</label>
                                <select class="form-control" name="txtSub">
                                    <c:forEach var="s" items="${sublist}">
                                        <option value="${s.subCategoryId}">${s.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="">Choose Image</label>
                                <input type="file" id="txtImg" multiple name="txtImg">
                                <p class="help-block">Help log</p>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="txtAvailable" value="true"> Available
                                </label>
                            </div>
                        </div><!-- /.box-body -->

                        <div class="box-footer">
                            <button type="submit" class="btn btn-primary" name="action" value="add">Add</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </jsp:body>
</t:adminLayout>