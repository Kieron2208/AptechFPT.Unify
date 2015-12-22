<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<t:defaultLayout title="Shop UI - Login Page">
    <jsp:attribute name="pagecss">
        <link rel="stylesheet" href="<c:url value="css/pages/log-reg-v3.css"/>">
    </jsp:attribute>
    <jsp:attribute name="pagejs">
        <script src="<c:url value="/js/forms/page_login.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/js/forms/page_contact_form.js"/>" type="text/javascript"></script>
        <script>
            window.emailRegex = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            $(document).ready(function () {
                App.init();
            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <!--=== Breadcrumbs v4 ===-->
        <div class="breadcrumbs-v4">
            <div class="container">
                <div class="filter"></div>
                <span class="page-name">Login</span>
                <h1>Maecenas <span class="shop-green">enim</span> sapien</h1>
                <ul class="breadcrumb-v4-in">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="">Product</a></li>
                    <li class="active">Login</li>
                </ul>
            </div><!--/end container-->
        </div> 
        <!--=== End Breadcrumbs v4 ===-->

        <!--=== Login ===-->
        <div class="log-reg-v3 content-md">
            <div class="container">
                <div class="row">
                    <div class="col-md-7 md-margin-bottom-50">
                        <h2 class="welcome-title">Welcome to Unify</h2>
                        <p>Suspendisse et tincidunt ipsum, et dignissim urna. Vestibulum nisl tortor, gravida at magna et, suscipit vehicula massa.</p><br>
                        <div class="info-block-v2">
                            <i class="icon icon-layers"></i>
                            <div class="info-block-in">
                                <h3>Pellentesque vulputate</h3>
                                <p>Vestibulum non ex volutpat, sodales diam sit amet, semper nunc. Integer sed nibh commodo, tincidunt nisi.</p>
                            </div>    
                        </div>    
                        <div class="info-block-v2">
                            <i class="icon icon-settings"></i>
                            <div class="info-block-in">
                                <h3>Curabitur tincidunt</h3>
                                <p>Vestibulum non ex volutpat, sodales diam sit amet, semper nunc. Integer sed nibh commodo, tincidunt nisi.</p>
                            </div>    
                        </div>
                        <div class="info-block-v2">
                            <i class="icon icon-paper-plane"></i>
                            <div class="info-block-in">
                                <h3>Aenean condimentum</h3>
                                <p>Vestibulum non ex volutpat, sodales diam sit amet, semper nunc. Integer sed nibh commodo, tincidunt nisi.</p>
                            </div>    
                        </div>
                    </div>

                    <div class="col-md-5">
                        <form id="sky-form1" class="log-reg-block sky-form"
                              method="POST" action="<c:url value="/login"/>" name="LoginFrom" novalidate>
                            <h2>Log in to your account</h2>

                            <section>
                                <label class="input login-input">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <input type="email"
                                               placeholder="Email Address"
                                               required
                                               ng-pattern="emailRegex"
                                               ng-model="txtEmail"
                                        name="txtEmail"
                                        class="form-control">
                                    </div>
                                    <span style="color:red" ng-show="LoginFrom.txtEmail.$invalid && LoginFrom.txtEmail.$dirty">
                                        <span ng-show="LoginFrom.txtEmail.$error.required">Email is required.</span>
                                        <span ng-show="LoginFrom.txtEmail.$error.pattern">Invalid Email format</span>
                                    </span>
                                </label>
                            </section>        
                            <section>
                                <label class="input login-input no-border-top">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                        <input type="password"
                                               placeholder="Password"
                                               name="txtPassword"
                                               ng-pattern="/^[A-Za-z0-9]+$/"
                                               ng-minlength="6"
                                               ng-maxlength="20"
                                               required
                                               ng-model="txtPassword"
                                               class="form-control">
                                    </div>    
                                    <span style="color:red" ng-show="LoginFrom.txtPassword.$invalid && LoginFrom.txtPassword.$dirty">
                                        <span ng-show="LoginFrom.txtPassword.$error.required">Password needs to provide.</span>
                                        <span ng-show="LoginFrom.txtPassword.$error.pattern">Number and Word Only</span>
                                        <span ng-show="LoginFrom.txtPassword.$error.minlength">Password is too short. Need more than 6 characters.</span>
                                        <span ng-show="LoginFrom.txtPassword.$error.maxlength">Password is too long. Need less than 20 characters.</span>
                                    </span>
                                </label>
                            </section>
                            <p>${msg}</p>
                            <button class="btn-u btn-u-sea-shop btn-block margin-bottom-20" ng-disabled="LoginFrom.$invalid" type="submit">Log in</button>

                        </form>

                        <div class="margin-bottom-20"></div>
                        <c:url value="/register" var="register"/>
                        <p class="text-center">Don't have account yet? Learn more and <a href="${register}">Sign Up</a></p>
                    </div>
                </div><!--/end row-->
            </div><!--/end container-->
        </div>
        <!--=== End Login ===-->     
    </jsp:body>
</t:defaultLayout>