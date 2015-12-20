<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>
<t:defaultLayout title="Shop-UI Register">
    <jsp:attribute name="pagecss">
        <c:url value="css/pages/log-reg-v3.css" var="pagecss"/>
        <link rel="stylesheet" href="${pagecss}">
    </jsp:attribute>
    <jsp:body>
        <!--=== Breadcrumbs v4 ===-->
        <div class="breadcrumbs-v4">
            <div class="container">
                <div class="filter"></div>
                <span class="page-name">Register</span>
                <h1>Maecenas <span class="shop-green">enim</span> sapien</h1>
                <ul class="breadcrumb-v4-in">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="">Account</a></li>
                    <li class="active">Sign Up</li>
                </ul>
            </div><!--/end container-->
        </div> 
        <!--=== End Breadcrumbs v4 ===-->

        <!--=== Registre ===-->
        <div class="log-reg-v3 content-md margin-bottom-30">
            <div class="container" ng-controller="UserController as vm">
                <div class="row">
                    <div class="col-md-7 md-margin-bottom-50">
                        <h2 class="welcome-title">Welcome to Unify</h2>
                        <p>Suspendisse et tincidunt ipsum, et dignissim urna. Vestibulum nisl tortor, gravida at magna et, suscipit vehicula massa.</p><br>
                        <div class="row margin-bottom-50">
                            <div class="col-sm-4 md-margin-bottom-20">
                                <div class="site-statistics">
                                    <span>20,039</span>
                                    <small>Products</small>
                                </div>    
                            </div>
                            <div class="col-sm-4 md-margin-bottom-20">
                                <div class="site-statistics">
                                    <span>54,283</span>
                                    <small>Reviews</small>
                                </div>    
                            </div>
                            <div class="col-sm-4">
                                <div class="site-statistics">
                                    <span>376k</span>
                                    <small>Sale</small>
                                </div>    
                            </div>
                        </div>
                        <div class="members-number">
                            <h3>Join more than <span class="shop-green">13,000</span> members worldwide</h3>
                            <img class="img-responsive" src="img/map.png" alt="">
                        </div>    
                    </div>

                    <div class="col-md-5">
                        <form id="sky-form4" class="log-reg-block sky-form" name="vm.userForm" novalidate>
                            <h2>Create New Account</h2>
                            <div class="login-input reg-input">                            
                                <section>
                                    <label class="input">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                            <input type="email"
                                                   name="txtEmail"
                                                   placeholder="Email address"
                                                   class="form-control"
                                                   ng-model="vm.entity.email"
                                                   ng-pattern="vm.emailPattern"
                                                   required
                                                   username
                                                   email-length>
                                        </div>
                                        <div ng-if="vm.userForm.txtEmail.$pending">Checking email ...</div>
                                        <span style="color:red" ng-show="vm.userForm.txtEmail.$invalid && vm.userForm.txtEmail.$dirty">
                                            <span ng-show="vm.userForm.txtEmail.$error.required">Email is required.</span>
                                            <span ng-show="vm.userForm.txtEmail.$error.pattern">Invalid Email format</span>
                                            <div ng-show="vm.userForm.txtEmail.$error.username">Existed Email</div>
                                            <div ng-show="vm.userForm.txtEmail.$error.emailLength">Content length (before @yourcompany.com) must between 6 and 30</div>
                                        </span>
                                    </label>
                                </section>                                
                                <section>
                                    <label class="input">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-key"></i></span>
                                            <input type="password" 
                                                   name="txtPassword" 
                                                   placeholder="Password" 
                                                   id="password" 
                                                   ng-pattern="/^[A-Za-z0-9]+$/"
                                                   ng-minlength="6"
                                                   ng-maxlength="20"
                                                   required
                                                   ng-model="vm.entity.password"
                                                   class="form-control">
                                        </div>
                                        <span style="color:red" ng-show="vm.userForm.txtPassword.$invalid && vm.userForm.txtPassword.$dirty">
                                            <span ng-show="vm.userForm.txtPassword.$error.required">Password needs to provide.</span>
                                            <span ng-show="vm.userForm.txtPassword.$error.pattern">Number and Word Only</span>
                                            <span ng-show="vm.userForm.txtPassword.$error.minlength">Password is too short. Need more than 6 characters.</span>
                                            <span ng-show="vm.userForm.txtPassword.$error.maxlength">Password is too long. Need less than 20 characters.</span>
                                        </span>
                                    </label>
                                </section>                                
                                <section>
                                    <label class="input">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-key"></i></span>
                                            <input type="password" 
                                                   name="txtConfirmPassword" 
                                                   ng-model="vm.entity.passwordConfirm"
                                                   compare-to="vm.entity.password"
                                                   ng-pattern="/^[A-Za-z0-9]+$/"
                                                   ng-minlength="6"
                                                   ng-maxlength="20"
                                                   required
                                                   placeholder="Confirm password" 
                                                   class="form-control">
                                        </div>
                                        <span style="color:red" ng-show="vm.userForm.txtConfirmPassword.$invalid && vm.userForm.txtConfirmPassword.$dirty">
                                            <span ng-show="vm.userForm.txtConfirmPassword.$error.required">Password needs to provide.</span><br/>
                                            <span ng-show="vm.userForm.txtConfirmPassword.$error.pattern">Number and Word Only</span><br/>
                                            <span ng-show="vm.userForm.txtConfirmPassword.$error.minlength">Password is too short. Need more than 6 characters.</span><br/>
                                            <span ng-show="vm.userForm.txtConfirmPassword.$error.maxlength">Password is too long. Need less than 20 characters.</span><br/>
                                            <span ng-show="vm.userForm.txtConfirmPassword.$error.compareTo">Confirm password doesn't math with previous.</span>
                                        </span>
                                    </label>
                                </section>  
                                <div class="row">
                                    <div class="col-sm-6">
                                        <section>
                                            <label class="input">
                                                <input type="text" 
                                                       name="txtFirstName"
                                                       ng-pattern="/[a-zA-Z]+$/"
                                                       ng-minlength="2"
                                                       ng-maxlength="50"
                                                       required
                                                       ng-model="vm.entity.firstName"
                                                       placeholder="First name" 
                                                       class="form-control">
                                            </label>
                                        </section>
                                    </div>
                                    <div class="col-sm-6">
                                        <section>
                                            <label class="input">
                                                <input type="text"
                                                       name="txtLastName"
                                                       ng-pattern="/[a-zA-Z]+$/"
                                                       ng-minlength="2"
                                                       ng-maxlength="50"
                                                       required
                                                       ng-model="vm.entity.lastName"
                                                       placeholder="Last name"
                                                       class="form-control">
                                            </label>
                                        </section>        
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <span style="color:red" ng-show="vm.userForm.txtFirstName.$invalid
                                                            && vm.userForm.txtFirstName.$dirty">
                                                    <span ng-show="vm.userForm.txtFirstName.$error.required">First Name is required.</span>
                                                    <span ng-show="vm.userForm.txtFirstName.$error.pattern">Name should only contain alphabet.</span>
                                            <span ng-show="vm.userForm.txtFirstName.$error.minlength">First Name is too short.</span>
                                            <span ng-show="vm.userForm.txtFirstName.$error.maxlength">First Name is too long.</span>
                                        </span>
                                        <br>
                                        <span style="color:red" ng-show="vm.userForm.txtLastName.$invalid
                                                            && vm.userForm.txtLastName.$dirty">
                                            <span ng-show="vm.userForm.txtLastName.$error.required">Last Name is required.</span>
                                            <span ng-show="vm.userForm.txtLastName.$error.pattern">Last Name should only contain alphabet.</span>
                                            <span ng-show="vm.userForm.txtLastName.$error.minlength">Last Name is too short.</span>
                                            <span ng-show="vm.userForm.txtLastName.$error.maxlength">Last Name is too long.</span>
                                        </span>
                                    </div>
                                </div>
                                <label class="select margin-bottom-15">
                                    <select name="gender" class="form-control" name="slGender" ng-model="vm.entity.gender">
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                    </select>
                                </label>

                                <section>
                                    <label class="input">
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
                                    </label>
                                </section>     
                                <section>
                                    <label class="input">
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-phone"></i></div>
                                            <input class="form-control" 
                                                   type="tel"
                                                   name="txtPhone"
                                                   ng-minlength="10"
                                                   ng-maxlength="20"
                                                   ng-pattern="/^[0-9()-]+$/"
                                                   required
                                                   placeholder="Phone"
                                                   ng-model="vm.entity.phone"/>
                                        </div>
                                        <span style="color:red" ng-show="vm.userForm.txtPhone.$invalid
                                                            && vm.userForm.txtPhone.$dirty">
                                            <span ng-show="vm.userForm.txtPhone.$error.required">Phone Number need to be provided</span><br/>
                                            <span ng-show="vm.userForm.txtPhone.$error.pattern">Doesn't look like Phone number.</span><br/>
                                            <span ng-show="vm.userForm.txtPhone.$error.minlength">Phone Number too short</span><br/>
                                            <span ng-show="vm.userForm.txtPhone.$error.maxlength">Phone Number too long</span>
                                        </span>
                                    </label>
                                </section> 
                                <section>
                                    <label class="input">
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-map-marker"></i></div>
                                            <input class="form-control" 
                                                   type="text" 
                                                   name="txtAddress"
                                                   ng-pattern="/^[\w\s\.]+$/"
                                                   ng-minlength="10"
                                                   ng-maxlength="200"
                                                   placeholder="Address"
                                                   ng-model="vm.entity.address"/>
                                        </div>
                                        <span style="color:red" ng-show="vm.userForm.txtAddress.$invalid
                                                            && vm.userForm.txtAddress.$dirty">
                                            <span ng-show="vm.userForm.txtAddress.$error.required">Address need to be provided</span><br/>
                                            <span ng-show="vm.userForm.txtAddress.$error.pattern">Only alphabet and number are allow.</span><br/>
                                            <span ng-show="vm.userForm.txtAddress.$error.minlength">Address are too short</span><br/>
                                            <span ng-show="vm.userForm.txtAddress.$error.maxlength">Address are too long</span>
                                        </span>
                                    </label>
                                </section>                                  
                            </div>
                            <button class="btn-u btn-u-sea-shop btn-block margin-bottom-20" type="submit">Create Account</button>
                        </form>

                        <div class="margin-bottom-20"></div>
                        <c:url value="/login" var="signin"/>
                        <p class="text-center">Already you have an account? <a href="${signin}">Sign In</a></p>
                    </div>
                </div><!--/end row-->
            </div><!--/end container-->
        </div>
        <!--=== End Registre ===-->     
    </jsp:body>
</t:defaultLayout>