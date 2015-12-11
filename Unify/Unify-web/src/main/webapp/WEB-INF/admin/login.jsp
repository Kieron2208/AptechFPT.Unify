<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Unify Shop - Admin Log in</title>
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
    <!-- iCheck -->
    <link rel="stylesheet" href="<c:url value="/plugins/iCheck/skins/square/blue.css"/>">

  </head>
  <body class="hold-transition login-page">
    <div class="login-box">
      <div class="login-logo">
        <a href="../../index2.html"><b>Unify</b> Shop Admin Login</a>
      </div><!-- /.login-logo -->
      <div class="login-box-body">
        <p class="login-box-msg">Sign in to continue</p>
        <form action="../../index2.html" method="post">
          <div class="form-group has-feedback">
            <input type="email" class="form-control" placeholder="Email">
            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input type="password" class="form-control" placeholder="Password">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="row">
            <div class="col-xs-8">
            </div><!-- /.col -->
            <div class="col-xs-4">
              <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
            </div><!-- /.col -->
          </div>
        </form>
      </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->

    <!-- jQuery 2.1.4 -->
    <script src="<c:url value="/plugins/jquery/jquery.min.js"/>"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="<c:url value="/plugins/bootstrap/js/bootstrap.min.js"/>"></script>
    <!-- iCheck -->
    <script src="<c:url value="/plugins/iCheck/icheck.min.js"/>"></script>
    <script>
      $(function () {
        $('input').iCheck({
          checkboxClass: 'icheckbox_square-blue',
          radioClass: 'iradio_square-blue',
          increaseArea: '20%' // optional
        });
      });
    </script>
  </body>
</html>
