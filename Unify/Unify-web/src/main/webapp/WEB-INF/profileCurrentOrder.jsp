<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:defaultLayout title="Shop UI - Profile">
    <jsp:attribute name="pagecss">
        <link href="<c:url value="/css/pages/profile.css"/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/plugins/sky-forms-pro/skyforms/css/sky-forms.css"/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css"/>" rel="stylesheet" type="text/css"/>
    </jsp:attribute>
    <jsp:body>
        <!--=== Breadcrumbs v4 ===-->
        <div class="breadcrumbs-v4">
            <div class="container">
                <div class="filter"></div>
                <span class="page-name">&nbsp;</span>
                <h1>Maecenas <span class="shop-green">enim</span> sapien</h1>
                <ul class="breadcrumb-v4-in">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="">Product</a></li>
                    <li class="active">Product Filter Page</li>
                </ul>
            </div><!--/end container-->
        </div> 
        <!--=== End Breadcrumbs v4 ===-->

        <!--=== Profile ===-->
        <div class="container content profile">
            <div class="row">
                <jsp:include page="profileMenu.jsp">
                    <jsp:param name="active" value="order"/>
                </jsp:include>

                <!-- Profile Content -->
                <div class="col-md-9">
                    <div class="profile-body margin-bottom-20">
                        <!--Basic Table-->
                        <div class="panel panel-green margin-bottom-40">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-tasks"></i> Basic Table</h3>
                            </div>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>First Name</th>
                                        <th class="hidden-sm">Last Name</th>
                                        <th>Username</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Mark</td>
                                        <td class="hidden-sm">Otto</td>
                                        <td>@mdo</td>
                                        <td><span class="label label-warning">Expiring</span></td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Jacob</td>
                                        <td class="hidden-sm">Thornton</td>
                                        <td>@fat</td>
                                        <td><span class="label label-success">Success</span></td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>Larry</td>
                                        <td class="hidden-sm">the Bird</td>
                                        <td>@twitter</td>
                                        <td><span class="label label-danger">Error!</span></td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>htmlstream</td>
                                        <td class="hidden-sm">Web Design</td>
                                        <td>@htmlstream</td>
                                        <td><span class="label label-info">Pending..</span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!--End Basic Table-->
                    </div>
                </div>
                <!-- End Profile Content -->
            </div>
        </div><!--/container-->
        <!--=== End Profile ===-->

    </jsp:body>
</t:defaultLayout>
