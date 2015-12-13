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
            <div class="container">
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
                        <form id="sky-form4" class="log-reg-block sky-form">
                            <h2>Create New Account</h2>
                            <div class="login-input reg-input">                            
                                <section>
                                    <label class="input">
                                        <input type="email" name="email" placeholder="Email address" class="form-control">
                                    </label>
                                </section>                                
                                <section>
                                    <label class="input">
                                        <input type="password" name="password" placeholder="Password" id="password" class="form-control">
                                    </label>
                                </section>                                
                                <section>
                                    <label class="input">
                                        <input type="password" name="passwordConfirm" placeholder="Confirm password" class="form-control">
                                    </label>
                                </section>  
                                <div class="row">
                                    <div class="col-sm-6">
                                        <section>
                                            <label class="input">
                                                <input type="text" name="firstname" placeholder="First name" class="form-control">
                                            </label>
                                        </section>
                                    </div>
                                    <div class="col-sm-6">
                                        <section>
                                            <label class="input">
                                                <input type="text" name="lastname" placeholder="Last name" class="form-control">
                                            </label>
                                        </section>        
                                    </div>
                                </div>
                                <label class="select margin-bottom-15">
                                    <select name="gender" class="form-control">
                                        <option value="M">Male</option>
                                        <option value="F">Female</option>
                                    </select>
                                </label>
                                <div class="row margin-bottom-10">
                                    <div class="col-xs-6">
                                        <label class="select">
                                            <select name="month" class="form-control">
                                                <option disabled="" selected="" value="0">Month</option>
                                                <option>January</option>
                                                <option>February</option>
                                                <option>March</option>
                                                <option>April</option>
                                                <option>May</option>
                                                <option>June</option>
                                                <option>July</option>
                                                <option>August</option>
                                                <option>September</option>
                                                <option>October</option>
                                                <option>November</option>
                                                <option>December</option>
                                            </select>
                                        </label>    
                                    </div>
                                    <div class="col-xs-3">
                                        <input type="text" name="day" placeholder="Day" class="form-control">
                                    </div>
                                    <div class="col-xs-3">
                                        <input type="text" name="year" placeholder="Year" class="form-control">
                                    </div>
                                </div>                                
                                <section>
                                    <label class="input">
                                        <input type="text" name="passwordConfirm" placeholder="Phone" class="form-control"/>
                                    </label>
                                </section>                                 
                                <section>
                                    <label class="input">
                                        <textarea name="passwordConfirm" placeholder="Address" class="form-control"></textarea>
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