<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@attribute name="title" required="true" %>
<%@attribute name="pagecss" fragment="true" %>
<%@attribute name="pagejs" fragment="true" %>

<html lang="en">
    <head>
        <!-- Meta -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>${title}</title>
        <!-- Favicon -->
        <link rel="shortcut icon" href="favicon.ico">

        <!-- Web Fonts -->
        <link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

        <!-- CSS Global Compulsory -->
        <link rel="stylesheet" href="<c:url value="/plugins/bootstrap/css/bootstrap.min.css"/>">
        <link rel="stylesheet" href="<c:url value="/css/shop.style.css"/>">
        <!-- CSS Header and Footer -->
        <link rel="stylesheet" href="<c:url value="/css/headers/header-v6.css"/>">
        <link rel="stylesheet" href="<c:url value="/css/footers/footer-v4.css"/>">

        <!-- CSS Implementing Plugins -->
        <link rel="stylesheet" href="<c:url value="/plugins/animate.css"/>">    
        <link rel="stylesheet" href="<c:url value="/plugins/line-icons/line-icons.css"/>">
        <link rel="stylesheet" href="<c:url value="/plugins/font-awesome/css/font-awesome.min.css"/>">
        <link rel="stylesheet" href="<c:url value="/plugins/scrollbar/css/jquery.mCustomScrollbar.css"/>">
        <jsp:invoke fragment="pagecss"/>
        <!-- CSS Theme -->
        <link rel="stylesheet" href="<c:url value="/css/theme-colors/default.css"/>" id="style_color">

        <!-- CSS Customization -->
        <link rel="stylesheet" href="<c:url value="/css/custom.css"/>">
    </head>
    <body class="header-fixed" ng-app="myApp" ng-controller="MyController">
        <div class="wrapper">
            <%@include file="../header.jsp" %>
            <jsp:doBody/>
            <%@include file="../footer.jsp" %>
        </div>
        <!-- JS Global Compulsory -->
        <script src="<c:url value="/plugins/jquery/jquery.min.js"/>"></script>
        <script src="<c:url value="/plugins/jquery/jquery-migrate.min.js"/>"></script>
        <script src="<c:url value="/plugins/bootstrap/js/bootstrap.min.js"/>"></script>
        <!-- JS Implementing Plugins -->
        <script src="<c:url value="/plugins/back-to-top.js"/>"></script>
        <script src="<c:url value="/plugins/smoothScroll.js"/>"></script>
        <script src="<c:url value="/plugins/jquery.parallax.js"/>"></script>
        <script src="<c:url value="/plugins/owl-carousel/owl-carousel/owl.carousel.js"/>"></script>
        <script src="<c:url value="/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"/>"></script>
        <script src="<c:url value="/plugins/revolution-slider/rs-plugin/js/jquery.themepunch.tools.min.js"/>"></script>
        <script src="<c:url value="/plugins/revolution-slider/rs-plugin/js/jquery.themepunch.revolution.min.js"/>"></script>
        <!-- JS Page Level -->
        <script src="<c:url value="/js/shop.app.js"/>"></script>
        <script src="<c:url value="/js/plugins/owl-carousel.js"/>"></script>
        <script src="<c:url value="/plugins/angular/angular.min.js"/>"></script>
        <script src="<c:url value="/plugins/angular-bootstrap/ui-bootstrap-tpls.min.js"/>"></script>
        <script src="<c:url value="/js/shoppingcart.js"/>"></script>
        <jsp:invoke fragment="pagejs"/>
        <script>
            $(document).ready(function(){
                App.init();
            });
        </script>
    </body>
</html>