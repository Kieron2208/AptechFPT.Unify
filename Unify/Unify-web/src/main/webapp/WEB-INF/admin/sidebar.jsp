<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <c:if test="${pageContext.request.getUserPrincipal() != null}">
            <!-- Sidebar user panel -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="<c:url value="${Account.imageLink}"/>" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>${Account.fullName}</p>
                    <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                </div>
            </div>
        </c:if>
        <!--       search form 
              <form action="#" method="get" class="sidebar-form">
                <div class="input-group">
                  <input type="text" name="q" class="form-control" placeholder="Search...">
                  <span class="input-group-btn">
                    <button type="submit" name="search" id="search-btn" class="btn btn-flat">
                        <i class="fa fa-search"></i>
                    </button>
                  </span>
                </div>
              </form>
               /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="active treeview">
                <c:url value="/administrator/user" var="userLink"/>
                <a href="${userLink}">
                    <i class="fa fa-user"></i> <span>User Management</span> 
                    <!--<i class="fa fa-angle-left pull-right"></i>-->
                </a>
                <!--                <ul class="treeview-menu">
                                    <li class="active">
                                        <a href="${userLink}"><i class="fa fa-circle-o"></i> User List</a>
                                    </li>
                                    <li><a href="index2.html"><i class="fa fa-circle-o"></i> Dashboard v2</a></li>
                                </ul>-->
            </li>
            <li>
                <a href="#">
                    <i class="fa fa-shopping-cart"></i> <span>Product Management</span> <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li>
                        <c:url value="/administrator/viewProduct" var="viewProduct"/>
                        <a href="${viewProduct}"><i class="fa fa-circle-o"></i> Product List</a>
                    </li>
                    <li>
                        <c:url value="/administrator/addProduct" var="addProduct"/>
                        <a href="${addProduct}"><i class="fa fa-circle-o"></i> Add New Product</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#">
                    <i class="fa fa-shopping-cart"></i> <span>Sub Category Management</span> <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li>
                        <c:url value="/administrator/viewSubCategory" var="viewSubCategory"/>
                        <a href="${viewSubCategory}"><i class="fa fa-circle-o"></i> Sub Category List</a>
                    </li>
                    <li>
                        <c:url value="/administrator/addSubCategory" var="addSubCategory"/>
                        <a href="${addSubCategory}"><i class="fa fa-circle-o"></i> Add New Sub Category</a>
                    </li>
                </ul>
            </li>
            <li class="active treeview">
                <a href="#">
                    <i class="fa fa-book"></i> <span>PurchaseOrder Management</span> <i class="fa fa-angle-left pull-right"></i>
                </a>

                <ul class="treeview-menu">
                    <li class="active">
                        <c:url value="/administrator/purchaselist" var="purchaseLink"/>
                        <a href="${purchaseLink}"><i class="fa fa-circle-o"></i> Purchase List</a>
                    </li>
                    <li>
                        <c:url value="/administrator/purchasereport" var="reportLink"/>
                        <a href="${reportLink}"><i class="fa fa-circle-o"></i> Report</a>
                    </li>
                </ul>  
            </li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
