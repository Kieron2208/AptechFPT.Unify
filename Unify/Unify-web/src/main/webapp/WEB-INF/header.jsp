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
                            <span class="badge">0</span>
                            <div class="shopping-cart-open">
                                <span class="shc-title">No products in the Cart</span>
                                <a href="${shoppingcart}" class="btn-u"><i class="fa fa-shopping-cart"></i> Cart</a>
                                <span class="shc-total">Total: <strong>$0.00</strong></span>
                            </div>
                        </li>
                        <li class="menu-icons">
                            <i class="menu-icons-style search search-close search-btn fa fa-search"></i>
                            <div class="search-open">
                                <input type="text" class="animated fadeIn form-control" placeholder="Start searching ...">
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
                                <li class="dropdown-submenu">
                                    <a href="javascript:void(0);">Shirt</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">T-Shirt</a></li>
                                        <li><a href="#">Shirt</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="javascript:void(0);">Pants</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Kaki</a></li>
                                        <li><a href="#">Jeans</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="javascript:void(0);">Accessory</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Tie</a></li>
                                        <li><a href="#">Belt</a></li>
                                        <li><a href="#">SunGlasses</a></li>
                                        <li><a href="#">Shoes</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <!-- Women Shop -->
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                                Women
                            </a>
                            <ul class="dropdown-menu">
                                <li class="dropdown-submenu">
                                    <a href="javascript:void(0);">Shirt</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">T-Shirt</a></li>
                                        <li><a href="#">Shirt</a></li>
                                        <li><a href="#">Dress</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="javascript:void(0);">Pants</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Kaki</a></li>
                                        <li><a href="#">Jeans</a></li>
                                        <li><a href="#">Skirt</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="javascript:void(0);">Accessory</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Handbag</a></li>
                                        <li><a href="#">Belt</a></li>
                                        <li><a href="#">SunGlasses</a></li>
                                        <li><a href="#">Shoes</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <!-- Women Shop -->

                        <!-- Kid Shop -->
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                                Kid
                            </a>
                            <ul class="dropdown-menu">
                                <li class="dropdown-submenu">
                                    <a href="javascript:void(0);">Shirt</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">T-Shirt</a></li>
                                        <li><a href="#">Shirt</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="javascript:void(0);">Pants</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Kaki</a></li>
                                        <li><a href="#">Jeans</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="javascript:void(0);">Accessory</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">SunGlasses</a></li>
                                        <li><a href="#">Shoes</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <!-- End Kid Shop -->

                        <!-- Contact -->
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                Contact
                            </a>
                        </li>    
                        <!-- End Contact -->

                        <!-- Shortcodes -->
                        <li class="dropdown">
                            <c:url value="/login" var="login"/>
                            <a href="${login}" class="dropdown-toggle">
                                Sign in
                            </a>
                        </li>
                        <!-- End Shortcodes -->

                        <!-- Account -->
                        <li class="dropdown">
                            <c:url value="/register" var="register"/>
                            <a href="${register}" class="dropdown-toggle">
                                Sign Up
                            </a>
                        </li>
                        <!-- End Account -->
                        <!-- Contact -->
                        <li class="dropdown">
                            <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">
                                <c:url value="/img/user/user.jpg" var="profile"/>
                                <img src="${profile}" class="img-circle" width="25px" height="25px"/> admin@yourstore.com
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="javascript:void(0);">Profile</a>
                                </li>
                                <li>
                                    <a href="javascript:void(0);">My Order</a>
                                </li>
                                <li>
                                    <a href="javascript:void(0);">My Comments</a>
                                </li>
                                <li>
                                    <a href="javascript:void(0);">Order History</a>
                                </li>
                            </ul>
                        </li>    
                        <!-- End Contact -->
                    </ul>
                </div>
            </div><!--/navbar-collapse-->
        </div>
    </div>
    <!-- End Navbar -->
</div>
<!--=== End Header v6 ===-->