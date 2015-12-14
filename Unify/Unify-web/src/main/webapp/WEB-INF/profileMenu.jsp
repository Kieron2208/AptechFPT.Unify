<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<c:if test="${param.active == 'order'}">
    <c:set value="active" var="order"/>
</c:if>
<c:if test="${param.active == 'feedback'}">
    <c:set value="active" var="feedback"/>
</c:if>
<c:if test="${param.active == 'comment'}">
    <c:set value="active" var="comment"/>
</c:if>
<c:if test="${param.active == 'history'}">
    <c:set value="active" var="history"/>
</c:if>
<c:if test="${param.active == 'homeprofile'}">
    <c:set value="active" var="homeprofile"/>
</c:if>
<!--Left Sidebar-->
<div class="col-md-3 md-margin-bottom-40">
    <img class="img-responsive profile-img margin-bottom-20" height="265" width="263" src="<c:url value="${Account.imageLink}"/>" alt="">
    <ul class="list-group sidebar-nav-v1 margin-bottom-40" id="sidebar-nav-1">
        <li class="list-group-item ${homeprofile}">
            <c:url value="/profile" var="profileLink"/>
            <a href="${profileLink}"><i class="fa fa-user"></i> Profile</a>
        </li>
        <li class="list-group-item ${order}">
            <c:url value="/profile/currentorder" var="orderLink"/>
            <a href="${orderLink}"><i class="fa fa-shopping-cart"></i> My Orders</a>
        </li>
        <li class="list-group-item ${feedback}">
            <c:url value="/profile/feedback" var="feedbackLink"/>
            <a href="${feedbackLink}"><i class="fa fa-reply"></i> My FeedBacks</a>
        </li>
        <li class="list-group-item ${comment}">
            <c:url value="/profile/mycomment" var="commentLink"/>
            <a href="${commentLink}"><i class="fa fa-comments"></i>My Comments</a>
        </li>
        <li class="list-group-item ${history}">
            <c:url value="/profile/orderhistory" var="historyOrderLink"/>
            <a href="${historyOrderLink}"><i class="fa fa-history"></i>Order History</a>
        </li>
    </ul>

</div>
<!--End Left Sidebar-->