<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<t:defaultLayout title="Shop UI - Product Detail">
    <jsp:attribute name="pagecss">
        <link rel="stylesheet" href="<c:url value="/plugins/sky-forms-pro/skyforms/css/sky-forms.css"/>"/>
        <link rel="stylesheet" href="<c:url value="/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css"/>"/>
        <link rel="stylesheet" href="<c:url value="/plugins/master-slider/quick-start/masterslider/style/masterslider.css"/>"/>
        <link rel='stylesheet' href="<c:url value="/plugins/master-slider/quick-start/masterslider/skins/default/style.css"/>"/>
    </jsp:attribute>
    <jsp:attribute name="pagejs">
        <!-- Master Slider -->
        <script src="<c:url value="/plugins/master-slider/quick-start/masterslider/masterslider.min.js"/>"></script>
        <script src="<c:url value="/plugins/master-slider/quick-start/masterslider/jquery.easing.min.js"/>"></script>
        <!-- JS Page Level -->
        <script src="<c:url value="/js/plugins/master-slider.js"/>"></script>
        <script src="<c:url value="/js/forms/product-quantity.js"/>"></script>
        <script>
            jQuery(document).ready(function () {
                App.init();
                App.initScrollBar();
                OwlCarousel.initOwlCarousel();
                MasterSliderShowcase2.initMasterSliderShowcase2();
            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <!--=== Shop Product ===-->
        <div class="shop-product">
            <!--=== Breadcrumbs v4 ===-->
            <div class="breadcrumbs-v4">
                <div class="container">
                    <div class="filter"></div>
                    <span class="page-name">Product Detail</span>
                    <h1>Maecenas <span class="shop-green">enim</span> sapien</h1>
                    <ul class="breadcrumb-v4-in">
                        <li><a href="<c:url value="/"/>">Home</a></li>
                        <li><a href="<c:url value="/product"/>">Product</a></li>
                        <li class="active">Product Detail Page</li>
                    </ul>
                </div><!--/end container-->
            </div> 
            <!--=== End Breadcrumbs v4 ===-->

            <!-- Breadcrumbs v5 -->
            <div class="container">
                <ul class="breadcrumb-v5">
                    <li>&nbsp;</li>
                </ul> 
            </div>
            <!-- End Breadcrumbs v5 -->

            <div class="container">
                <div class="row">
                    <div class="col-md-6 md-margin-bottom-50">
                        <div class="ms-showcase2-template">
                            <!-- Master Slider -->
                            <div class="master-slider ms-skin-default" id="masterslider">
                                <c:forEach var="img" items="${pro.imageCollection}">
                                    <c:if test="${img.displayOrder==1}">
                                        <div class="ms-slide">
                                            <img class="ms-brd" src="<c:url value="/img/blank.gif"/>" data-src="<c:url value="/${img.imagePath}"/>" alt="lorem ipsum dolor sit"/>
                                            <img class="ms-thumb" src="<c:url value="/${img.imagePath}"/>" alt="thumb"/>
                                        </div>
                                    </c:if>
                                    <c:if test="${img.displayOrder!=1}">
                                        <div class="ms-slide">
                                            <img src="<c:url value="/img/blank.gif"/>" data-src="<c:url value="/${img.imagePath}"/>" alt="lorem ipsum dolor sit"/>
                                            <img class="ms-thumb" src="<c:url value="/${img.imagePath}"/>" alt="thumb"/>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <!-- End Master Slider -->
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="shop-product-heading">
                            <h2>${pro.name}</h2>
                            <ul class="list-inline shop-product-social">
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                            </ul>
                        </div><!--/end shop product social-->

                        <ul class="list-inline product-ratings margin-bottom-30">
                            <li>${pro.like} Like</li>
                            <li class="product-review-list">
                                <span>(1) <a href="#">Review</a> | <a href="#"> Add Review</a></span>
                            </li>
                        </ul><!--/end shop product ratings-->

                        <ul class="list-inline shop-product-prices margin-bottom-30">
                            <li class="shop-red">
                                <c:set var="price" value="${pro.unitPrice}"/>
                                <fmt:setLocale value="en_US"/>
                                <fmt:formatNumber value="${price}" type="currency"/></li></li>
                        </ul><!--/end shop product prices-->
                        <div class="margin-bottom-40">
                            <button type="button" class="btn-u btn-u-sea-shop btn-u-lg">Add to Cart</button>
                        </div><!--/end product quantity-->    
                        <p class="wishlist-category"><strong>Categories:</strong> <a href="#">${pro.subCategoryId.name}</a> <a href="#">${pro.subCategoryId.categoryId.name}</a></p>
                    </div>
                </div><!--/end row-->
            </div>    
        </div>
        <!--=== End Shop Product ===-->

        <!--=== Content Medium ===-->
        <div class="content-md container">

            <!--=== Product Service ===-->
            <div class="row margin-bottom-60">
                <div class="col-md-4 product-service md-margin-bottom-30">
                    <div class="product-service-heading">
                        <i class="fa fa-truck"></i>
                    </div>
                    <div class="product-service-in">
                        <h3>Free Delivery</h3>
                        <p>Integer mattis lacinia felis vel molestie. Ut eu euismod erat, tincidunt pulvinar semper veliUt porta, leo...</p>
                        <a href="#">+Read More</a>
                    </div>
                </div>
                <div class="col-md-4 product-service md-margin-bottom-30">
                    <div class="product-service-heading">
                        <i class="icon-earphones-alt"></i>
                    </div>
                    <div class="product-service-in">
                        <h3>Customer Service</h3>
                        <p>Integer mattis lacinia felis vel molestie. Ut eu euismod erat, tincidunt pulvinar semper veliUt porta, leo...</p>
                        <a href="#">+Read More</a>
                    </div>
                </div>
                <div class="col-md-4 product-service">
                    <div class="product-service-heading">
                        <i class="icon-refresh"></i>
                    </div>
                    <div class="product-service-in">
                        <h3>Free Returns</h3>
                        <p>Integer mattis lacinia felis vel molestie. Ut eu euismod erat, tincidunt pulvinar semper veliUt porta, leo...</p>
                        <a href="#">+Read More</a>
                    </div>
                </div>
            </div><!--/end row-->
            <!--=== End Product Service ===-->

            <div class="tab-v5">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="active"><a href="#description" role="tab" data-toggle="tab">Description</a></li>
                    <li><a href="#reviews" role="tab" data-toggle="tab">Reviews (1)</a></li>
                </ul>

                <div class="tab-content">
                    <!-- Description -->
                    <div class="tab-pane fade in active" id="description">
                        <div class="row">
                            <div class="col-md-12">
                                <p>${pro.description}</p><br>
                            </div>
                        </div>
                    </div>
                    <!-- End Description -->

                    <!-- Reviews -->                
                    <div class="tab-pane fade" id="reviews">
                        <div class="product-comment margin-bottom-40">
                            <div class="product-comment-in">
                                <img class="product-comment-img rounded-x" src="<c:url value="/img/team/01.jpg"/>" alt="">
                                <div class="product-comment-dtl">
                                    <h4>Mickel <small>22 days ago</small></h4>
                                    <p>I like the green colour, it's very likeable and reminds me of Hollister. A little loose though but I am very skinny</p>
                                    <ul class="list-inline product-ratings">
                                        <li class="reply"><a href="#">Reply</a></li>
                                        <li class="pull-right">
                                            <ul class="list-inline">
                                                <li><i class="rating-selected fa fa-star"></i></li>
                                                <li><i class="rating-selected fa fa-star"></i></li>
                                                <li><i class="rating-selected fa fa-star"></i></li>
                                                <li><i class="rating fa fa-star"></i></li>
                                                <li><i class="rating fa fa-star"></i></li>
                                            </ul>
                                        </li>    
                                    </ul>
                                </div>
                            </div>    
                        </div>
                        <h3 class="heading-md margin-bottom-30">Add a review</h3>
                        <form action="assets/php/demo-contacts-process.php" method="post" id="sky-form3" class="sky-form sky-changes-4">
                            <fieldset>
                                <div class="margin-bottom-30">
                                    <label class="label-v2">Name</label>
                                    <label class="input">
                                        <input type="text" name="name" id="name">
                                    </label>
                                </div>    

                                <div class="margin-bottom-30">
                                    <label class="label-v2">Email</label>
                                    <label class="input">
                                        <input type="email" name="email" id="email">
                                    </label>
                                </div>    

                                <div class="margin-bottom-30">
                                    <label class="label-v2">Review</label>
                                    <label class="textarea">
                                        <textarea rows="7" name="message" id="message"></textarea>
                                    </label>
                                </div>    
                            </fieldset>    

                            <footer class="review-submit">
                                <label class="label-v2">Review</label>
                                <div class="stars-ratings">
                                    <input type="radio" name="stars-rating" id="stars-rating-5">
                                    <label for="stars-rating-5"><i class="fa fa-star"></i></label>
                                    <input type="radio" name="stars-rating" id="stars-rating-4">
                                    <label for="stars-rating-4"><i class="fa fa-star"></i></label>
                                    <input type="radio" name="stars-rating" id="stars-rating-3">
                                    <label for="stars-rating-3"><i class="fa fa-star"></i></label>
                                    <input type="radio" name="stars-rating" id="stars-rating-2">
                                    <label for="stars-rating-2"><i class="fa fa-star"></i></label>
                                    <input type="radio" name="stars-rating" id="stars-rating-1">
                                    <label for="stars-rating-1"><i class="fa fa-star"></i></label>
                                </div>
                                <button type="button" class="btn-u btn-u-sea-shop btn-u-sm pull-right">Submit</button>
                            </footer>
                        </form>
                    </div>
                    <!-- End Reviews -->                
                </div>
            </div>
        </div><!--/end container-->    
        <!--=== End Content Medium ===-->
    </jsp:body>
</t:defaultLayout>