<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<t:defaultLayout title="Shop UI - Checkout">
    <jsp:attribute name="pagecss">
        <link rel="stylesheet" href="<c:url value="/css/pages/log-reg-v3.css"/>">
        <link rel="stylesheet" href="<c:url value="/plugins/jquery-steps/css/custom-jquery.steps.css"/>">
    </jsp:attribute>
    <jsp:attribute name="pagejs">
        <script src="<c:url value="/plugins/sky-forms-pro/skyforms/js/jquery.validate.min.js"/>"></script>
        <!--<script src="<c:url value="/plugins/jquery-steps/build/jquery.steps.js"/>"></script>-->
        <script src="<c:url value="/plugins/jquery-steps/build/jquery.steps.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/js/forms/page_login.js"/>"></script>
        <script src="<c:url value="/js/plugins/stepWizard.js"/>"></script>
        <script src="<c:url value="/js/forms/product-quantity.js"/>"></script>
        <script src="<c:url value="/plugins/angular.min.js"/>"></script>
        <script src="<c:url value="/js/shoppingcart.js"/>"></script>
        <script src="<c:url value="/plugins/jquery/jquery.min.js"/>"></script>

        <script>
            jQuery(document).ready(function () {
                App.init();
                Login.initLogin();
                App.initScrollBar();
                StepWizard.initStepWizard();
                //        StyleSwitcher.initStyleSwitcher();      
            });
        </script>
    </jsp:attribute>
    <jsp:body>

        <!--=== Breadcrumbs v4 ===-->
        <div class="breadcrumbs-v4">
            <div class="container">
                <div class="filter"></div>
                <span class="page-name">Check Out</span>
                <h1>Maecenas <span class="shop-green">enim</span> sapien</h1>
                <ul class="breadcrumb-v4-in">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="">Product</a></li>
                    <li class="active">Shopping Cart</li>
                </ul>
            </div><!--/end container-->
        </div> 
        <!--=== End Breadcrumbs v4 ===-->

        <!--=== Content Medium Part ===-->
        <div class="content-md margin-bottom-30">
            <div class="container">
                <section ng-show="hide()">
                    <div class="headline-center margin-bottom-60">
                        <h2>There is no item no in your shopping cart, please go to 
                            <c:url value="/" var="home"/>
                        <a href="${home}">
                            <img src="<c:url value="/img/logo1-default.png"/>" alt="There is no item in your shopping cart"/>
                        </a>
                        for adding items
                        </h2>
                        <p>
                            <img src="<c:url value="/img/cart-empty.png"/>" alt="There is no item in your shopping cart"/>
                        </p>
                    </div><!--/end Headline Center-->
                </section>
                <div ng-show="show()">

                    <form class="shopping-cart"  action="#" >
                        <div class="header-tags">            
                            <div class="overflow-h">
                                <h2><i class="rounded-x fa fa-check"></i>SHOPPING CART</h2>
                                <p>Review &amp; edit your product </p>

                            </div>    
                        </div>

                        <section >
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Product Name</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-repeat="e in cart track by $index">
                                            <td class="product-in-table">
                                                <img class="img-responsive" src="{{e.pic}}" alt="">
                                                <div class="product-it-in">
                                                    <h3>{{e.name}}</h3>
                                                    
                                                </div>    
                                            </td>
                                            <td>{{e.price|currency:"$":0}}</td>
                                            <td>
                                                <input type='button' class="quantity-button"  ng-click="put(e.id, e.name, e.pic, e.price, -1)"  value='-'/>
                                                <input type='text' class="quantity-field"  readonly="true" value="{{e.quantity}}" />
                                                <input type='button' class="quantity-button"  ng-click="put(e.id, e.name, e.pic, e.price, 1)"  value='+'/>
                                            </td>
                                            <td class="shop-red">{{e.total|currency:"$":0}}</td>
                                            <td>
                                                <button type="button" class="close" ng-click="put(e.id, e.name, e.pic, e.price, -999999)"><span>&times;</span><span class="sr-only">Close</span></button>
                                            </td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </section>
                    </form>
                    <div class="header-tags">
                        <div class="overflow-h">
                            <h2><i class="rounded-x fa fa-home"></i>PURCHASE INFORMATION</h2>
                            <p>Please enter your information</p>

                        </div>    
                    </div>
                    <form id="myForm" method="post" action="POInsert"  class="shopping-cart" name="myForm" novalidate="novalidate">                         

                        <section >
                            <div class="row">
                                <div class="col-md-6">
                                    <h2 class="title-type">Shipping Address</h2>
                                    <div class="billing-info-inputs checkbox-list">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <input  required placeholder="Enter Your Name" ng-model="customer.name" ng-maxlength="20" ng-minlength="10"
                                                        ng-trim="true" type="text"  name="fname" class="form-control"/>
                                                <span style="color:red" ng-show="myForm.fname.$dirty && myForm.fname.$invalid">
                                                    <span ng-show="myForm.fname.$error.required">Your name is required.</span>
                                                    <span ng-show="myForm.fname.$error.minlength">Name at least 10 characters</span>
                                                    <span ng-show="myForm.fname.$error.maxlength">Name only 20 characters</span>
                                                </span>
                                            </div>
                                            <div class="col-sm-6">
                                                <input  required placeholder="Enter Your Phone Number" ng-model="customer.phone" ng-pattern="/^\d+$/"
                                                        ng-trim="true" type="text" ng-maxlength="11" ng-minlength="10"  name="phone" class="form-control"/>
                                                <span style="color:red" ng-show="myForm.phone.$dirty && myForm.phone.$invalid">
                                                    <span ng-show="myForm.phone.$error.required">Your phone is required.</span>
                                                    <span ng-show="myForm.phone.$error.minlength||myForm.phone.$error.maxlength||myForm.phone.$error.pattern">Phone accepts 10-11 digits only</span>
                                                    
                                                </span>
                                            </div>
                                        </div>
                                        <input  required placeholder="Enter Your Address" ng-model="customer.add"
                                                ng-trim="true" type="text" ng-maxlength="50" ng-minlength="15"  name="address" class="form-control"/>
                                        <span style="color:red" ng-show="myForm.address.$dirty && myForm.address.$invalid">
                                            <span ng-show="myForm.address.$error.required">Your address is required.</span>
                                            <span ng-show="myForm.address.$error.minlength">Address at least 15 characters</span>
                                            <span ng-show="myForm.address.$error.maxlength">Address only 50 characters</span>
                                        </span>      
                                    </div>
                                </div>
                                <div class="col-md-6 md-margin-bottom-40">
                                    <h2 class="title-type">SUB TOTAL</h2>
                                    <ul class="list-inline total-result">
                                        <li>
                                            <h4>Subtotal:</h4>
                                            <div class="total-result-in">
                                                <span >{{cart.sum("total") | currency}}</span>
                                            </div>    
                                        </li>    
                                        <li>
                                            <h4>Shipping (2%):</h4>
                                            <div class="total-result-in">
                                                <span class="text-right">{{cart.sum("total") * 0.02 | currency}}</span>
                                            </div>
                                        </li>
                                        <li>
                                            <h4>Tax (10%):</h4>
                                            <div class="total-result-in">
                                                <span class="text-right">{{cart.sum("total") * 0.1 | currency}}</span>
                                            </div>
                                        </li>
                                        <li class="divider"></li>
                                        <li class="total-price">
                                            <h4>Total:</h4>
                                            <div class="total-result-in">
                                                <span >{{cart.sum("total") * 1.12 | currency}}</span>
                                                <input type="hidden" ng-model="customer.subtotal" value="{{cart.sum('total') * 1.12}}" name="total"/>
                                                <input type="hidden"  value="{{cart}}" name="cart"/>
                                            </div>
                                        </li>

                                    </ul>
                                    <br/>
                                    <input type="button" class="btn-u btn-u-lg" ng-click="clearcart()" value="CANCEL"/>
                                    <input type="button" ng-click="formsubmit()"
                                           ng-disabled="myForm.$invalid ||
                                                       myForm.fname.$dirty && myForm.fname.$invalid ||
                                                       myForm.phone.$dirty && myForm.phone.$invalid ||
                                                       myForm.address.$dirty && myForm.address.$invalid ||
                                                       hide()"
                                           style="float: right" class="btn-u btn-u-lg" value="CHECK OUT"/>
                                </div>


                            </div>       
                        </section>
                    </form>
                </div>



            </div><!--/end container-->
            <!--=== End Content Medium Part ===-->     

        </jsp:body>
    </t:defaultLayout>