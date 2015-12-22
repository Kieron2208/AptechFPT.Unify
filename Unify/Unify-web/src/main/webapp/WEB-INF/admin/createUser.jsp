<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<t:adminLayout title="Shop UI - AdminPage - Create New User">
    <jsp:attribute name="pagecss">
        <link href="<c:url value="/plugins/toastr/toastr.min.css"/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker3.min.css"/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/plugins/bootstrap-fileinput/css/fileinput.min.css"/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/plugins/iCheck/skins/square/square.css"/>" rel="stylesheet" type="text/css"/>
        <style>
            .btn-file {
                position: relative;
                overflow: hidden;
            }
            .btn-file input[type=file] {
                position: absolute;
                top: 0;
                right: 0;
                min-width: 100%;
                min-height: 100%;
                font-size: 100px;
                text-align: right;
                filter: alpha(opacity=0);
                opacity: 0;
                outline: none;
                background: white;
                cursor: inherit;
                display: block;
            }
            .drop-box {
                background: #F8F8F8;
                border: 5px dashed #DDD;
                width: 170px;
                text-align: center;
                padding: 50px 10px;
                margin-left: 10px;
            }
        </style>
    </jsp:attribute>
    <jsp:attribute name="pagejs">
        <script src="<c:url value="/plugins/toastr/toastr.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/plugins/iCheck/icheck.min.js"/>" type="text/javascript"></script>
        <script>window.baseContext = '<c:url value="/"/>';</script>
<!--        <script src="<c:url value="/plugins/bootstrap-fileinput/js/fileinput.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"/>" type="text/javascript"></script>-->
        
        <script>
                    (function ($) {
                    'use strict';
                            $(document).ready(function () {
                    $('input[type="radio"]').iCheck({
                    radioClass: 'iradio_square'
                    });
                    });
                    })(jQuery);</script>
        </jsp:attribute>
        <jsp:body>
        <div class="row" ng-app="app" ng-controller="UserController as vm">
            <div class="col-xs-12">
                <form name="vm.userForm" novalidate>
                    <div class="box-body col-md-6">
                        <div class="form-group">
                            <label for="txtEmail" class="control-label">Email: </label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                <input id="txtEmail" 
                                       class="form-control" 
                                       name="txtEmail" 
                                       type="email" 
                                       ng-model="vm.entity.email"
                                       ng-pattern="vm.emailPattern"
                                       required
                                       username
                                       email-length
                                       placeholder="Enter your Email...">
                            </div>
                            <div ng-if="vm.userForm.txtEmail.$pending">Checking email ...</div>
                            <span style="color:red" ng-show="vm.userForm.txtEmail.$invalid && vm.userForm.txtEmail.$dirty">
                                <span ng-show="vm.userForm.txtEmail.$error.required">Email is required.</span>
                                <span ng-show="vm.userForm.txtEmail.$error.pattern">Invalid Email format</span>
                                <div ng-show="vm.userForm.txtEmail.$error.username">Existed Email</div>
                                <div ng-show="vm.userForm.txtEmail.$error.emailLength">Content length (before @yourcompany.com) must between 6 and 30</div>
                            </span>
                        </div>
                        <div class="form-group">
                            <label for="txtPassword">Password: </label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-key"></i></span>
                                <input id="txtPassword" 
                                       type="password" 
                                       class="form-control" 
                                       name="txtPassword" 
                                       ng-pattern="/^[A-Za-z0-9]+$/"
                                       ng-minlength="6"
                                       ng-maxlength="20"
                                       required
                                       ng-model="vm.entity.password"
                                       placeholder="Enter Your Password"/>
                            </div>
                            <span style="color:red" ng-show="vm.userForm.txtPassword.$invalid && vm.userForm.txtPassword.$dirty">
                                <span ng-show="vm.userForm.txtPassword.$error.required">Password needs to provide.</span>
                                <span ng-show="vm.userForm.txtPassword.$error.pattern">Number and Word Only</span>
                                <span ng-show="vm.userForm.txtPassword.$error.minlength">Password is too short. Need more than 6 characters.</span>
                                <span ng-show="vm.userForm.txtPassword.$error.maxlength">Password is too long. Need less than 20 characters.</span>
                            </span>
                        </div>
                        <div class="form-group">
                            <label for="txtConfirmPassword">Password Confirm: </label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-key"></i></span>
                                <input id="txtConfirmPassword" 
                                       type="password" 
                                       class="form-control" 
                                       name="txtConfirmPassword" 
                                       ng-model="vm.entity.passwordConfirm"
                                       compare-to="vm.entity.password"
                                       ng-pattern="/^[A-Za-z0-9]+$/"
                                       ng-minlength="6"
                                       ng-maxlength="20"
                                       required
                                       placeholder="Re-Enter your password"/>
                            </div>
                            <span style="color:red" ng-show="vm.userForm.txtConfirmPassword.$invalid && vm.userForm.txtConfirmPassword.$dirty">
                                <span ng-show="vm.userForm.txtConfirmPassword.$error.required">Password needs to provide.</span><br/>
                                <span ng-show="vm.userForm.txtConfirmPassword.$error.pattern">Number and Word Only</span><br/>
                                <span ng-show="vm.userForm.txtConfirmPassword.$error.minlength">Password is too short. Need more than 6 characters.</span><br/>
                                <span ng-show="vm.userForm.txtConfirmPassword.$error.maxlength">Password is too long. Need less than 20 characters.</span><br/>
                                <span ng-show="vm.userForm.txtConfirmPassword.$error.compareTo">Confirm password doesn't math with previous.</span>
                            </span>
                        </div>
                        <div class="form-group">
                            <label>Avatar: </label>
                            <div>
                                <img ngf-src="vm.entity.avatar || '<c:url value="/img/user/user.jpg"/>'"  
                                     ng-model="vm.entity.avatar"
                                     ngf-size="{width: 300, height: 300, quality: 1}"
                                     ngf-no-object-url="true"
                                     class="img-responsive img-thumbnail"/>
                                <div class="input-group">
                                    <span class="input-group-btn">
                                        <span class="btn btn-primary btn-file">
                                            Browse&hellip; <input
                                                type="file" 
                                                name="txtImage" 
                                                ngf-select 
                                                ngf-multiple="false" 
                                                class="drop-box"
                                                ngf-accept="'image/*'"
                                                ng-model="vm.entity.avatar"
                                                ngf-max-size="2MB"
                                                ngf-pattern="'.png,.jpg,.gif'"/>
                                        </span>
                                    </span>
                                    <input type="text" ng-model="vm.entity.avatar.name" class="form-control" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label>First Name: </label>
                                <input class="form-control" 
                                       type="text" 
                                       name="txtFirstName"
                                       ng-pattern="/[a-zA-Z]+$/"
                                       ng-minlength="2"
                                       ng-maxlength="50"
                                       required
                                       placeholder="Enter your first Name"
                                       ng-model="vm.entity.firstName"/>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Last Name: </label>
                                <input class="form-control" 
                                       type="text" 
                                       name="txtLastName"
                                       ng-pattern="/[a-zA-Z]+$/"
                                       ng-minlength="2"
                                       ng-maxlength="50"
                                       required
                                       placeholder="Enter your last Name"
                                       ng-model="vm.entity.lastName"/>
                            </div>
                            <span style="color:red" ng-show="vm.userForm.txtFirstName.$invalid
                                                        && vm.userForm.txtFirstName.$dirty">
                                <span ng-show="vm.userForm.txtFirstName.$error.required">First Name is required.</span><br/>
                                <span ng-show="vm.userForm.txtFirstName.$error.pattern">Name should only contain alphabet.</span><br/>
                                <span ng-show="vm.userForm.txtFirstName.$error.minlength">First Name is too short.</span><br/>
                                <span ng-show="vm.userForm.txtFirstName.$error.maxlength">First Name is too long.</span>
                            </span>
                            <br>
                            <span style="color:red" ng-show="vm.userForm.txtLastName.$invalid
                                                        && vm.userForm.txtLastName.$dirty">
                                <span ng-show="vm.userForm.txtLastName.$error.required">Last Name is required.</span><br/>
                                <span ng-show="vm.userForm.txtLastName.$error.pattern">Last Name should only contain alphabet.</span><br/>
                                <span ng-show="vm.userForm.txtLastName.$error.minlength">Last Name is too short.</span><br/>
                                <span ng-show="vm.userForm.txtLastName.$error.maxlength">Last Name is too long.</span>
                            </span>
                        </div>
                        <div class="form-group">
                            <label for="txtDateOfBirth">Day Of Birth: </label>
                            <div class="input-group">
                                <span class="input-group-btn">
                                    <button type="button" class="btn btn-default" ng-click="vm.openPopup($event)"><i class="fa fa-calendar"></i></button>
                                </span>
                                <input id="txtDateOfBirth" 
                                       class="form-control" 
                                       type="text"
                                       readonly
                                       date-disabled="vm.disabled(date, mode)"
                                       max-date="vm.maxdate"
                                       uib-datepicker-popup="dd-MMMM-yyyy"
                                       is-open="vm.dateStatus"
                                       ng-model="vm.entity.dateOfBirth"
                                       close-text="Close"
                                       name="txtDayOfBirth"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Phone: </label>
                            <div class="input-group">
                                <div class="input-group-addon"><i class="fa fa-phone"></i></div>
                                <input class="form-control" 
                                       type="tel"
                                       name="txtPhone"
                                       ng-minlength="10"
                                       ng-maxlength="20"
                                       ng-pattern="/^[0-9()-]+$/"
                                       required
                                       placeholder="Input your phone number"
                                       ng-model="vm.entity.phone"/>
                            </div>
                            <span style="color:red" ng-show="vm.userForm.txtPhone.$invalid
                                                        && vm.userForm.txtPhone.$dirty">
                                <span ng-show="vm.userForm.txtPhone.$error.required">Phone Number need to be provided</span><br/>
                                <span ng-show="vm.userForm.txtPhone.$error.pattern">Doesn't look like Phone number.</span><br/>
                                <span ng-show="vm.userForm.txtPhone.$error.minlength">Phone Number too short</span><br/>
                                <span ng-show="vm.userForm.txtPhone.$error.maxlength">Phone Number too long</span>
                            </span>
                        </div>
                        <div class="form-group">
                            <label>Address: </label>
                            <div class="input-group">
                                <div class="input-group-addon"><i class="fa fa-map-marker"></i></div>
                                <input class="form-control" 
                                       type="text" 
                                       name="txtAddress"
                                       ng-pattern="/^[\w\s\.]+$/"
                                       ng-minlength="10"
                                       ng-maxlength="200"
                                       placeholder="Input your phone address"
                                       ng-model="vm.entity.address"/>
                            </div>
                            <span style="color:red" ng-show="vm.userForm.txtAddress.$invalid
                                                        && vm.userForm.txtAddress.$dirty">
                                <span ng-show="vm.userForm.txtAddress.$error.required">Address need to be provided</span><br/>
                                <span ng-show="vm.userForm.txtAddress.$error.pattern">Only alphabet and number are allow.</span><br/>
                                <span ng-show="vm.userForm.txtAddress.$error.minlength">Address are too short</span><br/>
                                <span ng-show="vm.userForm.txtAddress.$error.maxlength">Address are too long</span>
                            </span>
                        </div>
                        <div class="form-group">
                            <label>Gender: </label>
                            <label>
                                <input type="radio" value="Male" name="cbGender" ng-model="vm.entity.gender" class="flat-red" checked/> Male
                            </label>
                            <label>
                                <input type="radio" value="Female" name="cbGender" ng-model="vm.entity.gender" class="flat-red"/> Female
                            </label>
                        </div>
                        <div class="form-group">
                            <label for="RoleSelect"> Role: </label><br>
                            <select class="form-control" name="RoleSelect" ng-model="vm.entity.role">
                                <option value="ADMINISTRATOR">ADMINISTRATOR</option>
                                <option value="SALEPERSON">SALE PERSON</option>
                                <option value="USER">USER</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-primary" ng-click="vm.submit()">Submit</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </jsp:body>
</t:adminLayout>