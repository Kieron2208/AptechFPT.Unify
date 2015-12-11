<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@tag description="put the tag description here" pageEncoding="UTF-8"%>
<%@attribute name="title" required="true" %>
<%@attribute name="pagecss" fragment="true" %>
<%@attribute name="pagejs" fragment="true" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>${title}</title
    <!-- Favicon -->
    <link rel="shortcut icon" href="/admin.ico">

    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="<c:url value="/plugins/bootstrap/css/bootstrap.min.css"/>">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<c:url value="/plugins/font-awesome/css/font-awesome.min.css"/>">
    <!-- Ionicons -->
    <link rel="stylesheet" href="<c:url value="/plugins/ionicons/css/ionicons.min.css"/>">
    <!-- Theme style -->
    <link rel="stylesheet" href="<c:url value="/admin/css/AdminLTE.min.css"/>">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="<c:url value="/admin/css/skins/skin-blue.min.css"/>">

    <jsp:invoke fragment="pagecss"/>

    <link href="<c:url value="/plugins/PACE/themes/purple/pace-theme-minimal.css"/>" rel="stylesheet" type="text/css"/>
    <script src="<c:url value="/plugins/PACE/pace.min.js"/>" type="text/javascript"></script>

  </head>
  <body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

        <jsp:include page="../admin/header.jsp"/>
        <!-- Left side column. contains the logo and sidebar -->
        <jsp:include page="../admin/sidebar.jsp"/>
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
          <!-- Content Header (Page header) -->
          <section class="content-header">
            <h1>
              Dashboard
              <small>Control panel</small>
            </h1>
            <ol class="breadcrumb">
              <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
              <li class="active">Dashboard</li>
            </ol>
          </section>

          <!-- Main content -->
          <section class="content">
              <jsp:doBody/>
          </section><!-- /.content -->
        </div><!-- /.content-wrapper -->
        <footer class="main-footer">
          <div class="pull-right hidden-xs">
            <b>Version</b> 2.3.0
          </div>
          <strong>Copyright &copy; 2014-2015 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights reserved.
        </footer>

        <div class="control-sidebar-bg"></div>
    </div><!-- ./wrapper -->

    <!-- jQuery 2.1.4 -->
    <script src="<c:url value="/plugins/jquery/jquery.min.js"/>"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="<c:url value="/plugins/jquery-ui/jquery-ui.min.js"/>"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>
      $.widget.bridge('uibutton', $.ui.button);
    </script>
    <!-- Bootstrap 3.3.5 -->
    <script src="<c:url value="/plugins/bootstrap/js/bootstrap.min.js"/>"></script>
    <!-- AdminLTE App -->
    <script src="<c:url value="/admin/js/app.min.js"/>"></script>
    
    <jsp:invoke fragment="pagejs"/>
  </body>
</html>
