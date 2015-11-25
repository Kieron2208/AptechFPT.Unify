<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<t:adminLayout title="Shop UI - AdminPage - Create New User">
    <jsp:attribute name="pagecss">
        <link href="<c:url value="/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker3.min.css"/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/plugins/bootstrap-fileinput/css/fileinput.min.css"/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/plugins/iCheck/skins/square/square.css"/>" rel="stylesheet" type="text/css"/>
    </jsp:attribute>
    <jsp:attribute name="pagejs">
        <script src="<c:url value="/plugins/bootstrap-fileinput/js/fileinput.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/plugins/iCheck/icheck.min.js"/>" type="text/javascript"></script>
        <script>
            (function ($) {
                'use strict';
                $(document).ready(function () {
                    $('#txtDateOfBirth').datepicker();
                    $("#avatar-upload").fileinput({
                        uploadUrl: "/file-upload-batch/",
                        autoReplace: true,
                        maxFileCount: 1,
                        showPreview: true,
                        allowedFileExtensions: ["jpg", "png", "gif"]
                    });
                    $('input[type="radio"]').iCheck({
                        radioClass: 'iradio_square'
                    });
                });
            })(jQuery);
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="row">
            <div class="col-xs-12">
                <form>
                    <div class="box-body col-md-6">
                        <div class="form-group">
                            <label for="txtEmail">Email: </label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                <input id="txtEmail" name="txtEmail" type="email" class="form-control" placeholder="Enter your Email...">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="txtPassword">Password: </label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-key"></i></span>
                                <input id="txtPassword" type="password" class="form-control" name="txtPassword"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Avatar: </label>
                            <input multiple  id="avatar-upload" type="file" class="file-loading" name="txtImage" accept="image/*"/>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label>First Name: </label>
                                <input class="form-control" type="text" name="txtFirstName"/>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Last Name: </label>
                                <input class="form-control" type="text" name="txtLastName"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Phone: </label>
                            <div class="input-group">
                                <div class="input-group-addon"><i class="fa fa-phone"></i></div>
                                <input class="form-control" type="tel" name="txtPhone"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Address: </label>
                            <div class="input-group">
                                <div class="input-group-addon"><i class="fa fa-map-marker"></i></div>
                                <input class="form-control" type="text" name="txtAddress"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Gender: </label>
                            <input id="genderM" type="radio" class="flat-red" name="cbGender" checked/>
                            <label for="genderM">Male</label>
                            <label>
                                <input type="radio" class="flat-red"  name="cbGender"/>Female
                            </label>
                        </div>
                        <div class="form-group">
                            <label for="txtDateOfBirth">Day Of Birth: </label>
                            <div class="input-group">
                                <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                <input id="txtDateOfBirth" class="form-control" type="date" name="txtDayOfBirth"/>
                            </div>
                        </div>
                        <button class="btn btn-primary">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </jsp:body>
</t:adminLayout>