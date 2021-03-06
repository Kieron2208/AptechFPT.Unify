<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--=== Header v6 ===-->   
<div class="header-v6 header-sticky">
    <!-- Navbar -->
    <div class="navbar mega-menu" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="menu-container">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <!-- Navbar Brand -->
                <div class="navbar-brand">
                    <c:url value="/" var="home"/>
                    <a href="${home}">
                        <img class="default-logo" style="margin-top: 13px" src="<c:url value="/img/logo3-light.png"/>" alt="Logo">
                        <img class="shrink-logo" src="<c:url value="/img/logo3-dark.png"/>" alt="Logo">
                    </a>
                </div>
                <!-- ENd Navbar Brand -->

                <!-- Header Inner Right -->
                <div class="header-inner-right">
                    <ul class="menu-icons-list">
                        <li class="menu-icons shopping-cart">
                            <c:url value="/shoppingcart" var="shoppingcart"/>
                            <i class="menu-icons-style radius-x fa fa-shopping-cart"></i>
                            <span class="badge" ng-show="show()">{{cart.sum("quantity")}}</span>
                            <span class="badge" ng-show="hide()">0</span>
                            <div class="shopping-cart-open">
                                <span class="shc-title" ng-show="hide()">No products in the Cart</span>
                                <span class="shc-title" ng-show="show()">There are <b style="color: red">{{cart.sum("quantity")}}</b> items in your Cart</span>
                                <a href="${shoppingcart}" ng-show="show()" class="btn-u"><i class="fa fa-shopping-cart"></i> Cart</a>
                                <span class="shc-total" ng-show="show()">Total: <strong>{{cart.sum("total") | currency}}</strong></span>
                            </div>
                        </li>
                        
                    </ul>
                </div>
                <!-- End Header Inner Right -->
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-responsive-collapse">
                <div class="menu-container">
                    <ul class="nav navbar-nav">
                        <!-- Men Shop -->
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                                Men
                            </a>
                            <ul class="dropdown-menu">
                                <c:forEach var="c" items="${listcategory}">
                                    <li class="dropdown-submenu">
                                        <c:if test="${c.categoryId!=3}">
                                            <a href="javascript:void(0);">${c.name}</a>
                                            <ul class="dropdown-menu">
                                                <c:forEach var="sub" items="${c.subCategoryCollection}">
                                                    <c:if test="${sub.productCollection.size()>0}">
                                                        <c:url value="/productgrid/${sub.subCategoryId}/0" var="productgrid"/>
                                                        <li><a href="${productgrid}">${sub.name}</a></li>
                                                    </c:if>
                                                </c:forEach>
                                            </ul>
                                        </c:if>
                                    </li>
                                </c:forEach>
                            </ul>
                        </li>
                        <!-- Women Shop -->
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                                Women
                            </a>
                            <ul class="dropdown-menu">
                                <c:forEach var="c" items="${listcategory}">
                                    <li class="dropdown-submenu">
                                        <a href="javascript:void(0);">${c.name}</a>
                                        <ul class="dropdown-menu">
                                            <c:forEach var="sub" items="${c.subCategoryCollection}">
                                                <c:if test="${sub.subCategoryId!=10}">
                                                    <c:if test="${sub.productCollection.size()>0}">
                                                        <c:url value="/productgrid/${sub.subCategoryId}/1" var="productgrid"/>
                                                        <li><a href="${productgrid}">${sub.name}</a></li>
                                                    </c:if>
                                                    
                                                </c:if>
                                            </c:forEach>
                                        </ul>
                                    </li>
                                </c:forEach>
                            </ul>
                        </li>
                        <!-- Women Shop -->

                        <!-- Kid Shop -->
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                                Kid
                            </a>
                            <ul class="dropdown-menu">
                                <c:forEach var="c" items="${listcategory}">
                                    <li class="dropdown-submenu">
                                        <a href="javascript:void(0);">${c.name}</a>
                                        <ul class="dropdown-menu">
                                            <c:forEach var="sub" items="${c.subCategoryCollection}">
                                                <c:if test="${sub.subCategoryId!=10}">
                                                    <c:if test="${sub.productCollection.size()>0}">
                                                        <c:url value="/productgrid/${sub.subCategoryId}/2" var="productgrid"/>
                                                        <li><a href="${productgrid}">${sub.name}</a></li>
                                                    </c:if>
                                                </c:if>
                                            </c:forEach>
                                        </ul>
                                    </li>
                                </c:forEach>
                            </ul>
                        </li>
                        <!-- End Kid Shop -->

                        <c:if test="${pageContext.request.getUserPrincipal() == null}">
                            <!-- Shortcodes -->
                            <li class="dropdown">
                                <c:url value="/login" var="login"/>
                                <a href="${login}" class="dropdown-toggle">
                                    <i class="fa fa-sign-in"></i>
                                    Sign in
                                </a>
                            </li>
                            <!-- End Shortcodes -->

                            <!-- Account -->
                            <li class="dropdown">
                                <c:url value="/register" var="register"/>
                                <a href="${register}" class="dropdown-toggle">
                                    <i class="fa fa-user"></i>
                                    Sign Up
                                </a>
                            </li>
                        </c:if>
                        <!-- End Account -->
                        <!-- Contact -->
                        <c:if test="${pageContext.request.getUserPrincipal() != null}">
                            <li class="dropdown">
                                <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">
                                    <c:url value="${sessionScope.Account.imageLink}" var="profile"/>
                                    <img src="${profile}" class="img-circle" width="25px" height="25px"/> <c:out value="${sessionScope.Account.email}"/>
                                </a>
                                <ul class="dropdown-menu">
                                    <c:if test="${pageContext.request.isUserInRole('ADMINISTRATOR')
                                                  || pageContext.request.isUserInRole('SALEPERSON')}">
                                          <li>
                                              <c:url value="/administrator" var="adminPage"/>
                                              <a href="${adminPage}"><i class="fa fa-lock"></i> Go to Admin Page</a>
                                          </li>
                                    </c:if>
                                    <%
                                        String uri = request.getRequestURI();
                                        String contextPath = request.getContextPath();
                                        String homeProfile = "";
                                        String orderProfile = "";
                                        String commentProfile = "";
                                        String historyProfile = "";
                                        if (uri.equals(contextPath + "/WEB-INF/profile.jsp")) {
                                            homeProfile = "active";
                                        }
                                        if (uri.equals(contextPath + "/WEB-INF/profileCurrentOrder.jsp")) {
                                            orderProfile = "active";
                                        }
                                        if (uri.equals(contextPath + "/WEB-INF/profileComment.jsp")) {
                                            commentProfile = "active";
                                        }
                                        if (uri.equals(contextPath + "/WEB-INF/profileHistory.jsp")) {
                                            historyProfile = "active";
                                        }
                                    %>
                                    <li class="<%= homeProfile%>">
                                        <c:url value="/profile" var="profilePageLink"/>
                                        <a href="${profilePageLink}"><i class="fa fa-user"></i> Profile</a>
                                    </li>
                                    <li class="<%= orderProfile%>">
                                        <c:url value="/profile/currentorder" var="profileOrderPageLink"/>
                                        <a href="${profileOrderPageLink}"><i class="fa fa-shopping-cart"></i> My Orders</a>
                                    </li>
                                    <li class="<%= commentProfile%>">
                                        <c:url value="/profile/mycomment" var="profileCommentPageLink"/>
                                        <a href="${profileCommentPageLink}"><i class="fa fa-comment"></i> My Comments</a>
                                    </li>
                                    <li>
                                        <c:url value="/logout" var="logout"/>
                                        <a href="${logout}"><i class="fa fa-sign-out"></i> Logout</a>
                                    </li>
                                </ul>
                            </li>    
                        </c:if>
                        <!-- End Contact -->
                    </ul>
                </div>
            </div><!--/navbar-collapse-->
        </div>
    </div>
    <!-- End Navbar -->
</div>
<!--=== End Header v6 ===-->