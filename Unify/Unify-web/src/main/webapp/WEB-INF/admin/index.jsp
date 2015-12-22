<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<t:adminLayout title="Shop UI - AdminPage">
    <jsp:attribute name="pagejs">
        <script src="<c:url value="/plugins/chartjs/Chart.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/admin/js/pages/dashboard2.js"/>" type="text/javascript"></script>
    </jsp:attribute>
    <jsp:body>
        <div class="error-page">
            <div class="error-content">
              <h3> Welcome to Unify Admin Page</h3>
            </div><!-- /.error-content -->
          </div><!-- /.error-page -->

    </jsp:body>
</t:adminLayout>