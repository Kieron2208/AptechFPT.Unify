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
                    <li><a href="">Product</a></li>
                    <li class="active">Product Filter Page</li>
                </ul>
            </div><!--/end container-->
        </div> 
        <!--=== End Breadcrumbs v4 ===-->

        <!--=== Profile ===-->
        <div class="container content profile">
            <div class="row">
                <jsp:include page="profileMenu.jsp">
                    <jsp:param name="active" value="feedback"/>
                </jsp:include>

                <!-- Profile Content -->
                <div class="col-md-9">
                    <div class="profile-body margin-bottom-20">
                        <!-- Review Form-->
                        <form action="#" id="sky-form2" class="sky-form">
                            <header>FeedBack Form</header>

                            <fieldset>

                                <section>
                                    <label class="input">
                                        <i class="icon-append fa fa-envelope"></i>
                                        <input type="email" name="email" readonly placeholder="Your e-mail" value="${Account.email} - ${Account.fullName}">
                                    </label>
                                </section>

                                <section>
                                    <label class="input">
                                        <i class="icon-append fa fa-user"></i>
                                        <input type="text" name="title" placeholder="Title">
                                    </label>
                                </section>
                                    
                                <section>
                                    <label class="label"></label>
                                    <label class="textarea">
                                        <i class="icon-append fa fa-comment"></i>
                                        <textarea rows="10" name="review" id="review" placeholder="Text of the review"></textarea>
                                    </label>
                                </section>
                            </fieldset>
                            <footer>
                                <button type="submit" class="btn-u">Send your feedback</button>
                            </footer>
                        </form>
                        <!-- End Review Form-->
                    </div>
                </div>
                <!-- End Profile Content -->
            </div>
        </div><!--/container-->
        <!--=== End Profile ===-->

    </jsp:body>
</t:defaultLayout>