<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>404 Error Page 3 | Unify - Responsive Website Template</title>

        <!-- Meta -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Favicon -->
        <link rel="shortcut icon" href="favicon.ico">

        <!-- Web Fonts -->
        <link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

        <!-- CSS Global Compulsory -->
        <link rel="stylesheet" href="<c:url value="/plugins/bootstrap/css/bootstrap.min.css"/>">
        <link rel="stylesheet" href="<c:url value="/css/style.css"/>">

        <!-- CSS Header and Footer -->
        <link rel="stylesheet" href="<c:url value="/css/headers/header-default.css"/>">
        <link rel="stylesheet" href="<c:url value="/css/footers/footer-v1.css"/>">

        <!-- CSS Implementing Plugins -->
        <link rel="stylesheet" href="<c:url value="plugins/animate.css"/>">
        <link rel="stylesheet" href="<c:url value="/plugins/line-icons/line-icons.css"/>">
        <link rel="stylesheet" href="<c:url value="/plugins/font-awesome/css/font-awesome.min.css"/>">

        <!-- CSS Page Style -->
        <link rel="stylesheet" href="<c:url value="/css/pages/page_404_error3.css"/>">

        <link href="<c:url value="/plugins/PACE/themes/purple/pace-theme-minimal.css"/>" rel="stylesheet" type="text/css"/>
        <script src="<c:url value="/plugins/PACE/pace.min.js"/>" type="text/javascript"></script>
    </head>
    <body>

        <!--=== Error V4 ===-->
        <div class="container content">
            <!--Error Block-->
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="error-v4">
                        <c:url value="/img/logo.png" var="logo"/>
                        <a href="#"><img src="${logo}" alt=""></a>
                        <h1>500</h1>
                        <span class="sorry">Sorry, there are something went wrong in the server!</span>
                        <div class="row">
                            <div class="col-md-6 col-md-offset-3">
                                <c:url value="/" var="home"/>
                                <a class="btn-u btn-brd btn-u-light" href="${home}"> Go Back to Main Page</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--/container-->
        <!--End Error Block-->

        <!--=== Sticky Footer ===-->
        <div class="container sticky-footer">
            <p class="copyright-space">
                2013 &copy; Unify Template. ALL Rights Reserved.
            </p>
        </div>
        <!--=== End Sticky Footer ===-->

        <!-- JS Global Compulsory -->
        <script type="text/javascript" src="<c:url value="/plugins/jquery/jquery.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/plugins/jquery/jquery-migrate.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/plugins/bootstrap/js/bootstrap.min.js"/>"></script>
        <!-- JS Implementing Plugins -->
        <script type="text/javascript" src="<c:url value="/plugins/back-to-top.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/plugins/backstretch/jquery.backstretch.min.js"/>"></script>
        <!-- JS Customization -->
        <script type="text/javascript" src="<c:url value="/js/custom.js"/>"></script>
        <!-- JS Page Level -->
        <script type="text/javascript" src="<c:url value="assets/js/app.js"/>"></script>
        <script type="text/javascript">
            jQuery(document).ready(function () {
                App.init();
            });
        </script>
        <script type="text/javascript">
            $.backstretch([
                    "<c:url value="/img/blur/img2.jpg"/>"
            ])
        </script>
    </body>
</html>
