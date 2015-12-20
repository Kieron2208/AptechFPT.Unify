<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:defaultLayout title="Shop UI - Profile">
    <jsp:attribute name="pagecss">
        <link href="<c:url value="/css/pages/profile.css"/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/plugins/sky-forms-pro/skyforms/css/sky-forms.css"/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css"/>" rel="stylesheet" type="text/css"/>
    </jsp:attribute>
    <jsp:body>
        <!--=== Breadcrumbs v4 ===-->
        <div class="breadcrumbs-v4">
            <div class="container">
                <div class="filter"></div>
                <span class="page-name">&nbsp;</span>
                <h1>Maecenas <span class="shop-green">enim</span> sapien</h1>
                <ul class="breadcrumb-v4-in">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="">User</a></li>
                    <li class="active">User Profile</li>
                </ul>
            </div><!--/end container-->
        </div> 
        <!--=== End Breadcrumbs v4 ===-->

        <!--=== Profile ===-->
        <div class="container content profile">
            <div class="row">

                <jsp:include page="profileMenu.jsp">
                    <jsp:param name="active" value="homeprofile"/>
                </jsp:include>

                <!-- Profile Content -->
                <div class="col-md-9">
                    <div class="profile-body margin-bottom-20">
                        <div class="nav-tabs-custom">
                            <ul id="tabs" class="nav nav-tabs">
                                <li class="active"><a href="#profile" data-toggle="tab">Profile</a></li>
                                <li><a href="#edit" data-toggle="tab">Edit</a></li>
                                <li><a href="#password" data-toggle="tab">Change Password</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="active tab-pane" id="profile">
                                    <form class="form-horizontal">
                                        <div class="form-group">
                                            <label for="inputName" class="col-sm-2 control-label">Email</label>
                                            <div class="col-sm-10">
                                                <input type="email" readonly class="form-control" id="inputName" value="${account.email}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputEmail" class="col-sm-2 control-label">Full Name:</label>
                                            <div class="col-sm-10">
                                                <input type="text" readonly class="form-control" id="inputEmail" placeholder="Enter your First Name ..." value="${account.firstName} ${account.lastName}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputExperience" class="col-sm-2 control-label">Phone:</label>
                                            <div class="col-sm-10">
                                                <input type="text" readonly class="form-control" id="inputName" placeholder="Enter your Last Name ..." value="${account.phone}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputExperience" class="col-sm-2 control-label">Address:</label>
                                            <div class="col-sm-10">
                                                <input type="text" readonly class="form-control" id="inputName" placeholder="Enter your Last Name ..." value="${account.address}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputSkills" class="col-sm-2 control-label">Date Of Birth:</label>
                                            <div class="col-sm-10">
                                                <input type="text" readonly class="form-control" id="inputSkills" placeholder="Skills" value="${account.dayOfBirth.toString('MMMM-dd-yyyy')}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputSkills" class="col-sm-2 control-label">Gender:</label>
                                            <div class="col-sm-10">
                                                <input type="text" readonly class="form-control" id="inputSkills" placeholder="Skills" value="Male">
                                            </div>
                                        </div>
                                    </form>
                                </div><!-- /.tab-pane -->
                                <div class="active tab-pane" id="edit" ng-controller="ProfileController as vm">
                                    <form class="form-horizontal" name="vm.userForm" novalidate>
                                        <div class="form-group">
                                            <label for="txtImg" class="col-sm-2 control-label">Avatar: </label>
                                            <div class="col-sm-10">
                                                <img ngf-src="vm.entity.avatar || vm.entity.imgLink"  
                                                     ng-model="vm.entity.avatar"
                                                     ngf-size="{width: 300, height: 300, quality: 1}"
                                                     ngf-no-object-url="true"
                                                     class="img-responsive img-thumbnail"/>
                                                <div class="input-group col-md-6">
                                                    <span class="input-group-btn">
                                                        <span class="btn btn-primary btn-file">
                                                            Browse&hellip; <input
                                                                id="txtImg" 
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
                                        <div class="form-group">  
                                            <label class="col-sm-2  control-label">Full Name: </label>
                                            <div class="col-sm-10">
                                                <div class="form-group col-md-6">
                                                    <input class="form-control" 
                                                           type="text" 
                                                           name="txtFirstName"
                                                           ng-pattern="/[a-zA-Z]+$/"
                                                           ng-minlength="2"
                                                           ng-maxlength="50"
                                                           required
                                                           placeholder="Enter your first Name"
                                                           ng-model="vm.entity.firstName"/>
                                                    <span style="color:red" ng-show="vm.userForm.txtFirstName.$invalid
                                                                        && vm.userForm.txtFirstName.$dirty">
                                                        <span ng-show="vm.userForm.txtFirstName.$error.required">First Name is required.</span><br/>
                                                        <span ng-show="vm.userForm.txtFirstName.$error.pattern">Name should only contain alphabet.</span><br/>
                                                        <span ng-show="vm.userForm.txtFirstName.$error.minlength">First Name is too short.</span><br/>
                                                        <span ng-show="vm.userForm.txtFirstName.$error.maxlength">First Name is too long.</span>
                                                    </span>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <input class="form-control" 
                                                           type="text" 
                                                           name="txtLastName"
                                                           ng-pattern="/[a-zA-Z]+$/"
                                                           ng-minlength="2"
                                                           ng-maxlength="50"
                                                           required
                                                           placeholder="Enter your last Name"
                                                           ng-model="vm.entity.lastName"/>
                                                    <span style="color:red" ng-show="vm.userForm.txtLastName.$invalid
                                                                        && vm.userForm.txtLastName.$dirty">
                                                        <span ng-show="vm.userForm.txtLastName.$error.required">Last Name is required.</span><br/>
                                                        <span ng-show="vm.userForm.txtLastName.$error.pattern">Last Name should only contain alphabet.</span><br/>
                                                        <span ng-show="vm.userForm.txtLastName.$error.minlength">Last Name is too short.</span><br/>
                                                        <span ng-show="vm.userForm.txtLastName.$error.maxlength">Last Name is too long.</span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtDateOfBirth" class="col-sm-2 control-label">Day Of Birth: </label>
                                            <div class="col-sm-10">
                                                <div class="input-group">
                                                    <span class="input-group-btn">
                                                        <button type="button" class="btn btn-default" ng-click="vm.openPopup($event)"><i class="fa fa-calendar"></i></button>
                                                    </span>
                                                    <input id="txtDateOfBirth" 
                                                           class="form-control" 
                                                           type="text"
                                                           readonly
                                                           date-disabled="vm.disabled(date, mode)"
                                                           uib-datepicker-popup="dd-MMMM-yyyy"
                                                           is-open="vm.dateStatus"
                                                           ng-model="vm.entity.dateOfBirth"
                                                           close-text="Close"
                                                           name="txtDayOfBirth"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtPhone" class="col-sm-2 control-label">Phone: </label>
                                            <div class="col-sm-10">
                                                <div class="input-group">
                                                    <div class="input-group-addon"><i class="fa fa-phone"></i></div>
                                                    <input class="form-control" 
                                                           type="tel"
                                                           name="txtPhone"
                                                           ng-minlength="10"
                                                           ng-maxlength="20"
                                                           ng-pattern="/^[0-9]+$/"
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
                                        </div>
                                        <div class="form-group">
                                            <label for="txtAddress" class="col-sm-2 control-label">Address: </label>
                                            <div class="col-sm-10">
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
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Gender: </label>
                                            <div class="col-sm-10">
                                                <label>
                                                    <input type="radio" value="Male" name="cbGender" ng-model="vm.entity.gender" class="flat-red" checked/> Male
                                                </label>
                                                <label>
                                                    <input type="radio" value="Female" name="cbGender" ng-model="vm.entity.gender" class="flat-red"/> Female
                                                </label>
                                            </div>
                                        </div>
                                        <!--                                <div class="form-group">
                                                                            <label for="RoleSelect" class="col-sm-2 control-label"> Role: </label>
                                                                            <div class="col-sm-10">
                                                                                <select class="form-control" name="RoleSelect" ng-model="vm.entity.role">
                                                                                    <option value="ADMINISTRATOR">ADMINISTRATOR</option>
                                                                                    <option value="SALEPERSON">SALE PERSON</option>
                                                                                    <option value="USER">USER</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>-->
                                        <div class="form-group">
                                            <div class=" col-sm-2"></div>
                                            <div class="col-sm-10">
                                                <button class="btn btn-primary" ng-click="vm.submit()">Submit</button>
                                            </div>
                                        </div>
                                    </form>
                                </div><!-- /.tab-pane -->
                                <div class="active tab-pane" id="password" ng-controller="PasswordController as vm">
                                    <form class="form-horizontal" name="vm.userForm" novalidate>
                                        <div class="form-group">
                                            <label for="email" class="col-sm-2 control-label">Email</label>
                                            <div class="col-sm-10">
                                                <input type="email" readonly class="form-control" id="email" value="${account.email}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputEmail" class="col-sm-2 control-label">Old Password:</label>
                                            <div class="col-sm-10">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-key"></i></span>
                                                    <input type="password"
                                                           name="txtOldPassword"
                                                           ng-pattern="/^[A-Za-z0-9]+$/"
                                                           ng-minlength="6"
                                                           ng-maxlength="20"
                                                           required
                                                           ng-model="vm.oldpassword" 
                                                           oldpassword 
                                                           class="form-control"
                                                           id="inputEmail"
                                                           placeholder="Enter your Old Password ...">
                                                </div>
                                                <div ng-if="vm.userForm.txtOldPassword.$pending">Checking password ...</div>
                                                <span style="color:red" ng-show="vm.userForm.txtOldPassword.$invalid && vm.userForm.txtOldPassword.$dirty">
                                                    <span ng-show="vm.userForm.txtOldPassword.$error.oldpassword">This is not your password.</span>
                                                    <span ng-show="vm.userForm.txtOldPassword.$error.required">Password needs to provide.</span>
                                                    <span ng-show="vm.userForm.txtOldPassword.$error.pattern">Number and Word Only</span>
                                                    <span ng-show="vm.userForm.txtOldPassword.$error.minlength">Password is too short. Need more than 6 characters.</span>
                                                    <span ng-show="vm.userForm.txtOldPassword.$error.maxlength">Password is too long. Need less than 20 characters.</span>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtPassword" class="col-sm-2 control-label">New Password:</label>
                                            <div class="col-sm-10">
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
                                                           newpassword
                                                           ng-model="vm.password"
                                                           placeholder="Enter Your Password"/>
                                                </div>
                                                <div ng-if="vm.userForm.txtPassword.$pending">Checking password ...</div>
                                                <span style="color:red" ng-show="vm.userForm.txtPassword.$invalid && vm.userForm.txtPassword.$dirty">
                                                    <span ng-show="vm.userForm.txtPassword.$error.newpassword">New Password must no match to the old one.</span>
                                                    <span ng-show="vm.userForm.txtPassword.$error.required">Password needs to provide.</span>
                                                    <span ng-show="vm.userForm.txtPassword.$error.pattern">Number and Word Only</span>
                                                    <span ng-show="vm.userForm.txtPassword.$error.minlength">Password is too short. Need more than 6 characters.</span>
                                                    <span ng-show="vm.userForm.txtPassword.$error.maxlength">Password is too long. Need less than 20 characters.</span>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtConfirmPassword" class="col-sm-2 control-label">Password Confirm: </label>
                                            <div class="col-sm-10">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-key"></i></span>
                                                    <input id="txtConfirmPassword" 
                                                           type="password" 
                                                           class="form-control" 
                                                           name="txtConfirmPassword" 
                                                           ng-model="vm.confirmpassword"
                                                           compare-to="vm.password"
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
                                        </div>
                                        <div class="form-group">
                                            <label for="inputExperience" class="col-sm-2 control-label"></label>
                                            <div class="col-sm-10">
                                                <button class="btn btn-primary" ng-click="vm.submit()">Submit</button>
                                            </div>
                                        </div>
                                    </form>
                                </div><!-- /.tab-pane -->
                            </div><!-- /.tab-content -->
                        </div><!-- /.nav-tabs-custom -->
                    </div>
                </div>
                <!-- End Profile Content -->
            </div>
        </div><!--/container-->
        <!--=== End Profile ===-->

    </jsp:body>
</t:defaultLayout>