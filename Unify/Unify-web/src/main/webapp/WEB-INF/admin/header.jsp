<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header class="main-header">
    <!-- Logo -->
    <c:url value="/administrator" var="homeLink"/>
    <a href="${homeLink}" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><img src="<c:url value="/img/Unify-admin.png"/>"/></span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><img src="<c:url value="/img/Unify-admin-full_5.png"/>"/></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <c:if test="${pageContext.request.getUserPrincipal() != null}">
                    <!-- User Account: style can be found in dropdown.less -->
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="<c:url value="${Account.imageLink}"/>" class="user-image" alt="User Image">
                            <span class="hidden-xs">${Account.fullName}</span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header">
                                <img src="<c:url value="${Account.imageLink}"/>" class="img-circle" alt="User Image">
                                <p>${Account.email}</p>
                            </li>
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="#" class="btn btn-default btn-flat">Profile</a>
                                </div>
                                <div class="pull-right">
                                    <a href="#" class="btn btn-default btn-flat">Sign out</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </c:if>
            </ul>
        </div>
    </nav>
</header>