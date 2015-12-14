<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<t:defaultLayout title="Shop UI">
    <jsp:attribute name="pagecss">
        <link rel="stylesheet" href="<c:url value="/plugins/owl-carousel/owl-carousel/owl.carousel.css"/>">
        <link rel="stylesheet" href="<c:url value="/plugins/revolution-slider/rs-plugin/css/settings.css"/>">
    </jsp:attribute>
    <jsp:attribute name="pagejs">
        <script src="<c:url value="/js/plugins/revolution-slider.js"/>"></script>
        <script type="text/javascript">
            jQuery(document).ready(function () {
                App.initScrollBar();
                App.initParallaxBg();
                OwlCarousel.initOwlCarousel();
                RevolutionSlider.initRSfullWidth();
            });
        </script>


        <script type="text/javascript">

            (function () {
                $(document).ready(function () {
                    var frm = $('#myform55');
                    frm.submit(function () {

                        $.ajax({
                            type: frm.attr('method'),
                            url: frm.attr('action'),
                            data: frm.serialize(),
                            success: function (output) {
                                $("#likecount55").html(output);

                            }
                        });
                        return false;

                    });
                    

                    
                });
            })();

        </script>



    </jsp:attribute>
    <jsp:body>
        <!--=== Slider ===-->
        <div class="tp-banner-container">
            <div class="tp-banner">
                <ul>
                    <!-- SLIDE -->
                    <li class="revolution-mch-1" data-transition="fade" data-slotamount="5" data-masterspeed="1000" data-title="Slide 1">
                        <!-- MAIN IMAGE -->
                        <img src="img/1.jpg"  alt="darkblurbg"  data-bgfit="cover" data-bgposition="left top" data-bgrepeat="no-repeat">

                        <div class="tp-caption revolution-ch1 sft start"
                             data-x="center"
                             data-hoffset="0"
                             data-y="100"
                             data-speed="1500"
                             data-start="500"
                             data-easing="Back.easeInOut"
                             data-endeasing="Power1.easeIn"                        
                             data-endspeed="300">
                            The New <br>
                            <strong>Collection</strong><br>
                            is here
                        </div>

                        <!-- LAYER -->
                        <div class="tp-caption sft"
                             data-x="center"
                             data-hoffset="0"
                             data-y="380"
                             data-speed="1600"
                             data-start="1800"
                             data-easing="Power4.easeOut"
                             data-endspeed="300"
                             data-endeasing="Power1.easeIn"
                             data-captionhidden="off"
                             style="z-index: 6">
                            <a href="#" class="btn-u btn-brd btn-brd-hover btn-u-light">Shop Now</a>
                        </div>
                    </li>
                    <!-- END SLIDE -->

                    <!-- SLIDE -->
                    <li class="revolution-mch-1" data-transition="fade" data-slotamount="5" data-masterspeed="1000" data-title="Slide 2">
                        <!-- MAIN IMAGE -->
                        <img src="img/5.jpg"  alt="darkblurbg"  data-bgfit="cover" data-bgposition="left top" data-bgrepeat="no-repeat">

                        <div class="tp-caption revolution-ch3 sft start"
                             data-x="center"
                             data-hoffset="0"
                             data-y="140"
                             data-speed="1500"
                             data-start="500"
                             data-easing="Back.easeInOut"
                             data-endeasing="Power1.easeIn"                        
                             data-endspeed="300">
                            Latest <strong>Fashion</strong> Trends
                        </div>

                        <!-- LAYER -->
                        <div class="tp-caption revolution-ch4 sft"
                             data-x="center"
                             data-hoffset="-14"
                             data-y="210"
                             data-speed="1400"
                             data-start="2000"
                             data-easing="Power4.easeOut"
                             data-endspeed="300"
                             data-endeasing="Power1.easeIn"
                             data-captionhidden="off"
                             style="z-index: 6">
                            Cras non dui et quam auctor pretium.<br>
                            Aenean enim tortr, tempus et iteus m
                        </div>

                        <!-- LAYER -->
                        <div class="tp-caption sft"
                             data-x="center"
                             data-hoffset="0"
                             data-y="300"
                             data-speed="1600"
                             data-start="1800"
                             data-easing="Power4.easeOut"
                             data-endspeed="300"
                             data-endeasing="Power1.easeIn"
                             data-captionhidden="off"
                             style="z-index: 6">
                            <a href="#" class="btn-u btn-brd btn-brd-hover btn-u-light">Shop Now</a>
                        </div>
                    </li>
                    <!-- END SLIDE -->

                    <!-- SLIDE -->
                    <li class="revolution-mch-1" data-transition="fade" data-slotamount="5" data-masterspeed="1000" data-title="Slide 3">
                        <!-- MAIN IMAGE -->
                        <img src="img/3.jpg"  alt="darkblurbg"  data-bgfit="cover" data-bgposition="right top" data-bgrepeat="no-repeat">

                        <div class="tp-caption revolution-ch3 sft start"
                             data-x="right"
                             data-hoffset="5"
                             data-y="130"
                             data-speed="1500"
                             data-start="500"
                             data-easing="Back.easeInOut"
                             data-endeasing="Power1.easeIn"                        
                             data-endspeed="300">
                            <strong>Luxury</strong> Watches
                        </div>

                        <!-- LAYER -->
                        <div class="tp-caption revolution-ch4 sft"
                             data-x="right"
                             data-hoffset="0"
                             data-y="210"
                             data-speed="1400"
                             data-start="2000"
                             data-easing="Power4.easeOut"
                             data-endspeed="300"
                             data-endeasing="Power1.easeIn"
                             data-captionhidden="off"
                             style="z-index: 6">
                            lectus. Cras non dui et quam auctor.<br>
                            Aenean enim tortor, tempus et im
                        </div>

                        <!-- LAYER -->
                        <div class="tp-caption sft"
                             data-x="right"
                             data-hoffset="0"
                             data-y="300"
                             data-speed="1600"
                             data-start="2800"
                             data-easing="Power4.easeOut"
                             data-endspeed="300"
                             data-endeasing="Power1.easeIn"
                             data-captionhidden="off"
                             style="z-index: 6">
                            <a href="#" class="btn-u btn-brd btn-brd-hover btn-u-light">Shop Now</a>
                        </div>
                    </li>
                    <!-- END SLIDE -->

                    <!-- SLIDE -->
                    <li class="revolution-mch-1" data-transition="fade" data-slotamount="5" data-masterspeed="1000" data-title="Slide 4">
                        <!-- MAIN IMAGE -->
                        <img src="img/2.jpg"  alt="darkblurbg"  data-bgfit="cover" data-bgposition="left top" data-bgrepeat="no-repeat">

                        <div class="tp-caption revolution-ch1 sft start"
                             data-x="center"
                             data-hoffset="0"
                             data-y="100"
                             data-speed="1500"
                             data-start="500"
                             data-easing="Back.easeInOut"
                             data-endeasing="Power1.easeIn"                        
                             data-endspeed="300">
                            Girl's Accesories
                        </div>

                        <!-- LAYER -->
                        <div class="tp-caption revolution-ch2 sft"
                             data-x="center"
                             data-hoffset="0"
                             data-y="280"
                             data-speed="1400"
                             data-start="2000"
                             data-easing="Power4.easeOut"
                             data-endspeed="300"
                             data-endeasing="Power1.easeIn"
                             data-captionhidden="off"
                             style="z-index: 6">
                            Super Promo
                        </div>

                        <!-- LAYER -->
                        <div class="tp-caption sft"
                             data-x="center"
                             data-hoffset="0"
                             data-y="370"
                             data-speed="1600"
                             data-start="2800"
                             data-easing="Power4.easeOut"
                             data-endspeed="300"
                             data-endeasing="Power1.easeIn"
                             data-captionhidden="off"
                             style="z-index: 6">
                            <a href="#" class="btn-u btn-brd btn-brd-hover btn-u-light">View More</a>
                            <a href="#" class="btn-u btn-brd btn-brd-hover btn-u-light">Shop Now</a>
                        </div>
                    </li>
                    <!-- END SLIDE -->                

                    <!-- SLIDE -->
                    <li class="revolution-mch-1" data-transition="fade" data-slotamount="5" data-masterspeed="1000" data-title="Slide 5">
                        <!-- MAIN IMAGE -->
                        <img src="img/4.jpg"  alt="darkblurbg"  data-bgfit="cover" data-bgposition="right top" data-bgrepeat="no-repeat">

                        <div class="tp-caption revolution-ch5 sft start"
                             data-x="right"
                             data-hoffset="5"
                             data-y="130"
                             data-speed="1500"
                             data-start="500"
                             data-easing="Back.easeInOut"
                             data-endeasing="Power1.easeIn"                        
                             data-endspeed="300">
                            <strong>Jeans</strong> Collection
                        </div>

                        <!-- LAYER -->
                        <div class="tp-caption revolution-ch4 sft"
                             data-x="right"
                             data-hoffset="-14"
                             data-y="210"
                             data-speed="1400"
                             data-start="2000"
                             data-easing="Power4.easeOut"
                             data-endspeed="300"
                             data-endeasing="Power1.easeIn"
                             data-captionhidden="off"
                             style="z-index: 6">
                            Cras non dui et quam auctor pretium.<br>
                            Aenean enim tortr, tempus et iteus m
                        </div>

                        <!-- LAYER -->
                        <div class="tp-caption sft"
                             data-x="right"
                             data-hoffset="0"
                             data-y="300"
                             data-speed="1600"
                             data-start="2800"
                             data-easing="Power4.easeOut"
                             data-endspeed="300"
                             data-endeasing="Power1.easeIn"
                             data-captionhidden="off"
                             style="z-index: 6">
                            <a href="#" class="btn-u btn-brd btn-brd-hover btn-u-light">Shop Now</a>
                        </div>
                    </li>
                    <!-- END SLIDE -->
                </ul>
                <div class="tp-bannertimer tp-bottom"></div>            
            </div>
        </div>
        <!--=== End Slider ===-->

        <!--=== Product Content ===-->
        <div class="container content-md">
            <!--=== Illustration v1 ===-->
            <div class="row margin-bottom-60">
                <div class="col-md-6 md-margin-bottom-30">
                    <div class="overflow-h">
                        <div class="illustration-v1 illustration-img1">
                            <div class="illustration-bg">
                                <div class="illustration-ads ad-details-v1">
                                    <h3>NEW YEAR <strong>SALE</strong> 30% - 60% <strong>off</strong></h3>
                                    <a class="btn-u btn-brd btn-brd-hover btn-u-light" href="#">Shop Now</a>
                                </div>    
                            </div>    
                        </div>
                    </div>    
                </div>
                <div class="col-md-6">
                    <div class="overflow-h">
                        <a class="illustration-v1 illustration-img2" href="#">
                            <span class="illustration-bg">
                                <span class="illustration-ads ad-details-v2">
                                    <span class="item-time">Spring 2014</span>
                                    <span class="item-name">Lacoste</span>
                                </span>
                            </span>
                        </a>
                    </div>    
                </div>
            </div><!--/end row-->
            <!--=== End Illustration v1 ===-->

            <div class="heading heading-v1 margin-bottom-40">
                <h2>Latest products</h2>
            </div>

            <!--=== Illustration v2 ===-->
            <div class="illustration-v2 margin-bottom-60">
                <div class="customNavigation margin-bottom-25">
                    <a class="owl-btn prev rounded-x"><i class="fa fa-angle-left"></i></a>
                    <a class="owl-btn next rounded-x"><i class="fa fa-angle-right"></i></a>
                </div>

                <ul class="list-inline owl-slider">
                    <c:forEach var="p" items="${Listnew}">
                        <li class="item">
                            <div class="product-img">
                                <c:forEach var="img" items="${p.imageCollection}">
                                    <c:if test="${img.displayOrder==1}">
                                        <c:url value="/product/${p.productId}" var="productdetail"/>
                                        <a href="${productdetail}"><img class="full-width img-responsive" src="${img.imagePath}" alt=""></a>
                                    </c:if>
                                </c:forEach>
                                <c:url value="/product/${p.productId}" var="productdetail"/>
                                        <a class="product-review" href="${productdetail}">Quick review</a>
                                <a class="add-to-cart" ng-click="put(${p.productId},'${p.name}','${img.imagePath}',${p.unitPrice},1)" href><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                <div class="shop-rgba-dark-green rgba-banner">New</div>
                            </div>
                            <div class="product-description product-description-brd">
                                <div class="overflow-h margin-bottom-5">
                                    <div class="pull-left">
                                        <h4 class="title-price"><a href="shop-ui-inner.html">${p.name}</a></h4>
                                        <span class="gender text-uppercase">
                                            <c:if test="${p.gender==0}">Men</c:if>
                                            <c:if test="${p.gender==1}">Women</c:if>
                                            <c:if test="${p.gender==2}">Kid</c:if>
                                        </span>
                                        <span class="gender">${p.subCategoryId.name}</span>
                                    </div>    
                                    <div class="product-price">
                                        <span class="title-price">
                                            <c:set var="price" value="${p.unitPrice}"/>
                                            <fmt:setLocale value="en_US"/>
                                            <fmt:formatNumber value="${price}" type="currency"/>
                                        </span>
                                    </div>
                                </div>    
                                <ul class="list-inline product-ratings">
                                    <li>
                                        <div id="likecount${p.productId}">${p.like}</div>
                                    </li>
                                    <li class="like-icon">
                                        <form id="myform${p.productId}" method="post" action="ProductLike">
                                            <input type="hidden" name="pid" value="${p.productId}"/>
                                            <button type="submit" class="btn btn-link"><i class="fa fa-heart"> </i></button>
                                        </form>
                                    </li>
                                </ul> 
                            </div>
                        </li>    
                    </c:forEach>
                </ul>
            </div> 
            <!--=== End Illustration v2 ===-->


        </div>
        <!--=== End Product Content ===-->

        <div class="container">

            <!--=== Illustration v4 ===-->
            <div class="row illustration-v4 margin-bottom-40">
                <div class="col-md-4">
                    <div class="heading heading-v1 margin-bottom-20">
                        <h2>Top Rated</h2>
                    </div>
                    <c:forEach var="p" items="${Listlike}">
                        <div class="thumb-product">
                            <c:forEach var="img" items="${p.imageCollection}">
                                <c:if test="${img.displayOrder==1}">
                                    <img class="thumb-product-img" src="${img.imagePath}" alt="">
                                </c:if>
                            </c:forEach>
                            <div class="thumb-product-in">
                                <h4><c:url value="/product/${p.productId}" var="productdetail"/>
                                        <a href="${productdetail}">${p.name}</a> – <a href="shop-ui-inner.html">${p.subCategoryId.name}</a></h4>
                                <span class="thumb-product-type"><c:if test="${p.gender==0}">Men</c:if>
                                    <c:if test="${p.gender==1}">Women</c:if>
                                    <c:if test="${p.gender==2}">Kid</c:if></span>
                                </div>
                                <ul class="list-inline overflow-h">
                                    <li class="thumb-product-price">
                                    <c:set var="price" value="${p.unitPrice}"/>
                                    <fmt:setLocale value="en_US"/>
                                    <fmt:formatNumber value="${price}" type="currency"/></li>
                                <li class="thumb-product-purchase">
                                    <c:forEach var="img" items="${p.imageCollection}">
                                        <c:if test="${img.displayOrder==1}">
                                            <a  ng-click="put(${p.productId}, '${p.name}', '${img.imagePath}',${p.unitPrice}, 1)" href><i class="fa fa-shopping-cart"></i></a>
                                            </c:if>
                                        </c:forEach>

                                    | <a href="#"><i class="fa fa-heart"></i></a></li>
                            </ul>    
                        </div>
                    </c:forEach>

                </div>
                <div class="col-md-4">
                    <div class="heading heading-v1 margin-bottom-20">
                        <h2>Best Sellers</h2>
                    </div>
                    <c:forEach var="p" items="${Listbuy}">
                        <div class="thumb-product">
                            <c:forEach var="img" items="${p.imageCollection}">
                                <c:if test="${img.displayOrder==1}">
                                    <img class="thumb-product-img" src="${img.imagePath}" alt="">
                                </c:if>
                            </c:forEach>
                            <div class="thumb-product-in">
                                <h4><c:url value="/product/${p.productId}" var="productdetail"/>
                                        <a href="${productdetail}">${p.name}</a> – <a href="shop-ui-inner.html">${p.subCategoryId.name}</a></h4>
                                <span class="thumb-product-type"><c:if test="${p.gender==0}">Men</c:if>
                                    <c:if test="${p.gender==1}">Women</c:if>
                                    <c:if test="${p.gender==2}">Kid</c:if></span>
                                </div>
                                <ul class="list-inline overflow-h">
                                    <li class="thumb-product-price">
                                    <c:set var="price" value="${p.unitPrice}"/>
                                    <fmt:setLocale value="en_US"/>
                                    <fmt:formatNumber value="${price}" type="currency"/></li>
                                <li class="thumb-product-purchase">
                                    <c:forEach var="img" items="${p.imageCollection}">
                                        <c:if test="${img.displayOrder==1}">
                                            <a  ng-click="put(${p.productId}, '${p.name}', '${img.imagePath}',${p.unitPrice}, 1)" href><i class="fa fa-shopping-cart"></i></a>
                                            </c:if>
                                        </c:forEach>

                                    | <a href="#"><i class="fa fa-heart"></i></a></li>
                            </ul>    
                        </div>
                    </c:forEach>
                </div>
                <div class="col-md-4 padding">
                    <div class="heading heading-v1 margin-bottom-20">
                        <h2>Feature Items</h2>
                    </div>
                    <c:forEach var="p" items="${Listrandom}">
                        <div class="thumb-product">
                            <c:forEach var="img" items="${p.imageCollection}">
                                <c:if test="${img.displayOrder==1}">
                                    <img class="thumb-product-img" src="${img.imagePath}" alt="">
                                </c:if>
                            </c:forEach>
                            <div class="thumb-product-in">
                                <h4><c:url value="/product/${p.productId}" var="productdetail"/>
                                        <a href="${productdetail}">${p.name}</a> – <a href="shop-ui-inner.html">${p.subCategoryId.name}</a></h4>
                                <span class="thumb-product-type"><c:if test="${p.gender==0}">Men</c:if>
                                    <c:if test="${p.gender==1}">Women</c:if>
                                    <c:if test="${p.gender==2}">Kid</c:if>
                                    </span>
                                </div>
                                <ul class="list-inline overflow-h">
                                    <li class="thumb-product-price">
                                    <c:set var="price" value="${p.unitPrice}"/>
                                    <fmt:setLocale value="en_US"/>
                                    <fmt:formatNumber value="${price}" type="currency"/></li>
                                <li class="thumb-product-purchase">

                                    <c:forEach var="img" items="${p.imageCollection}">
                                        <c:if test="${img.displayOrder==1}">
                                            <a  ng-click="put(${p.productId}, '${p.name}', '${img.imagePath}',${p.unitPrice}, 1)" href><i class="fa fa-shopping-cart"></i></a>
                                            </c:if>
                                        </c:forEach>


                                    | <a href="#"><i class="fa fa-heart"></i></a></li>
                            </ul>    
                        </div>
                    </c:forEach>

                </div>
            </div><!--/end row-->

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

            <!--=== End Illustration v4 ===-->
        </div><!--/end cotnainer-->
    </jsp:body>

</t:defaultLayout>