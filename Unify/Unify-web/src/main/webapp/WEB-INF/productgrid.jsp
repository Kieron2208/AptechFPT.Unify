<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:defaultLayout title="Shop UI - Product Grid">
    <jsp:attribute name="pagejs">
        <script src="<c:url value="/js/like2.js"/>"></script>
    </jsp:attribute>
    <jsp:body>
        <script type="text/ng-template" id="myModalContent.html">
        <div class="modal-header">
        <strong>
            <h3 class="modal-title" style="color:red"><i style="color:red" class="fa fa-exclamation-triangle"></i>WARNING!</h3>
        </strong>
        </div>
        <div class="modal-body">
        <h3> <strong class="item-name">You shopping cart only can add 30 products once!</strong></h3>
        </div>
        <div class="modal-footer">
            <button class="btn btn-warning" type="button" ng-click="cancel()">OK</button>
            
        </div>
    </script>
        <!--=== Breadcrumbs v4 ===-->
        <div class="breadcrumbs-v4">
            <div class="container">
                <div class="filter"></div>
                <span class="page-name">&nbsp;</span>
                <h1>Maecenas <span class="shop-green">enim</span> sapien</h1>
                <ul class="breadcrumb-v4-in">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="">Product</a></li>
                    <li class="active">Product Filter Page</li>
                </ul>
            </div><!--/end container-->
        </div> 
        <!--=== End Breadcrumbs v4 ===-->

        <!--=== Content Part ===-->
        <div class="content container">
            <div class="row">
                <div class="col-md-12">
                    <div class="row margin-bottom-5">
                        <div class="col-sm-4 result-category">
                            <h2>${sub.name}</h2>
                            <small class="shop-bg-red badge-results">${list.size()} Results</small>
                        </div>
                        <div class="col-sm-8">
                            <ul class="list-inline clear-both">
                                <li class="sort-list-btn">
                                    <h3>Show :</h3>
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default dropdown-toggle" data-
                                                toggle="dropdown">
                                            20 <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="#">All</a></li>
                                            <li><a href="#">10</a></li>
                                            <li><a href="#">5</a></li>
                                            <li><a href="#">3</a></li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </div>    
                    </div><!--/end result category-->

                    <div class="filter-results">
                        <div class="row illustration-v2 margin-bottom-30">
                            <c:forEach var="p" items="${list}">
                            <div class="col-md-4">
                                <div class="product-img product-img-brd">
                                    <c:forEach var="img" items="${p.imageCollection}">
                                    <c:if test="${img.displayOrder==1}">
                                        <c:url value="/product/${p.productId}" var="productdetail"/>
                                        <a href="${productdetail}"><img class="full-width img-responsive" src="<c:url value="/${img.imagePath}"/>" alt=""></a>
                                        </c:if>
                                    </c:forEach>
                                        <c:url value="/product/${p.productId}" var="productdetail"/>
                                    <a class="product-review" href="${productdetail}">Quick review</a>
                                    <c:forEach var="img" items="${p.imageCollection}">
                                    <c:if test="${img.displayOrder==1}">
                                        <a class="add-to-cart" ng-click="put(${p.productId},'${p.name}','${img.imagePath}',${p.unitPrice},1)" href><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </c:if>
                                </c:forEach>  
                                </div> 
                                <div class="product-description product-description-brd margin-bottom-30">
                                    <div class="overflow-h margin-bottom-5">
                                        <div class="pull-left">
                                            <c:url value="/product/${p.productId}" var="productdetail"/>
                                            <h4 class="title-price"><a href="${productdetail}">${p.name}</a></h4>
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
                                            <div id="likecounttt${p.productId}">${p.like} Like</div>
                                        </li>
                                        <li class="like-icon">
                                            <c:url value="/ProductLike" var="ProductLike"/>
                                            <form id="myformm${p.productId}" method="post" action="${ProductLike}">
                                                <input type="hidden" name="pid" value="${p.productId}"/>
                                                <button type="submit" class="btn btn-link"><i class="fa fa-heart"> 
                                                    </i></button>
                                            </form>
                                        </li>
                                    </ul>    
                                </div>
                            </div>
                            </c:forEach>
                        </div>
                    </div><!--/end filter resilts-->

                </div>
            </div><!--/end row-->
        </div><!--/end container-->    
        <!--=== End Content Part ===-->
    </jsp:body>
</t:defaultLayout>>
