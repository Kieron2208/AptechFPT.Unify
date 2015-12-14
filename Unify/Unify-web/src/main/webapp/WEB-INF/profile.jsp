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
                        <div class="tab-v1">
                            <ul class="nav nav-justified nav-tabs">
                                <li class="active"><a data-toggle="tab" href="#profile">Profile</a></li>
                                <li><a data-toggle="tab" href="#editProfile">Edit Profile</a></li>
                                <li><a data-toggle="tab" href="#passwordTab">Change Password</a></li>
                            </ul>
                            <div class="tab-content">
                                <div id="profile" class="profile-edit tab-pane fade in active">
                                    <h2 class="heading-md">Manage your Name, ID and Email Addresses.</h2>
                                    <p>Below are the name and email addresses on file for your account.</p>
                                    <br>
                                    <dl class="dl-horizontal">
                                        <dt><strong>Your name </strong></dt>
                                        <dd>
                                            Edward Rooster
                                            <span>
                                                <a class="pull-right" href="#">
                                                    <i class="fa fa-pencil"></i>
                                                </a>
                                            </span>
                                        </dd>
                                        <hr>
                                        <dt><strong>Your ID </strong></dt>
                                        <dd>
                                            FKJ-032440
                                            <span>
                                                <a class="pull-right" href="#">
                                                    <i class="fa fa-pencil"></i>
                                                </a>
                                            </span>
                                        </dd>
                                        <hr>
                                        <dt><strong>Company name </strong></dt>
                                        <dd>
                                            Htmlstream
                                            <span>
                                                <a class="pull-right" href="#">
                                                    <i class="fa fa-pencil"></i>
                                                </a>
                                            </span>
                                        </dd>
                                        <hr>
                                        <dt><strong>Primary Email Address </strong></dt>
                                        <dd>
                                            edward-rooster@gmail.com
                                            <span>
                                                <a class="pull-right" href="#">
                                                    <i class="fa fa-pencil"></i>
                                                </a>
                                            </span>
                                        </dd>
                                        <hr>
                                        <dt><strong>Phone Number </strong></dt>
                                        <dd>
                                            (304) 33-2867-499
                                            <span>
                                                <a class="pull-right" href="#">
                                                    <i class="fa fa-pencil"></i>
                                                </a>
                                            </span>
                                        </dd>
                                        <hr>
                                        <dt><strong>Office Number </strong></dt>
                                        <dd>
                                            (304) 44-9810-296
                                            <span>
                                                <a class="pull-right" href="#">
                                                    <i class="fa fa-pencil"></i>
                                                </a>
                                            </span>
                                        </dd>
                                        <hr>
                                        <dt><strong>Address </strong></dt>
                                        <dd>
                                            California, US
                                            <span>
                                                <a class="pull-right" href="#">
                                                    <i class="fa fa-pencil"></i>
                                                </a>
                                            </span>
                                        </dd>
                                        <hr>
                                    </dl>
                                    <button type="button" class="btn-u btn-u-default">Cancel</button>
                                    <button type="button" class="btn-u">Save Changes</button>
                                </div>

                                <div id="editProfile" class="profile-edit tab-pane fade in active">
                                    <h2 class="heading-md">Manage your Name, ID and Email Addresses.</h2>
                                    <p>Below are the name and email addresses on file for your account.</p>
                                    <br>
                                    <dl class="dl-horizontal">
                                        <dt><strong>Your name </strong></dt>
                                        <dd>
                                            Edward Rooster
                                            <span>
                                                <a class="pull-right" href="#">
                                                    <i class="fa fa-pencil"></i>
                                                </a>
                                            </span>
                                        </dd>
                                        <hr>
                                        <dt><strong>Your ID </strong></dt>
                                        <dd>
                                            FKJ-032440
                                            <span>
                                                <a class="pull-right" href="#">
                                                    <i class="fa fa-pencil"></i>
                                                </a>
                                            </span>
                                        </dd>
                                        <hr>
                                        <dt><strong>Company name </strong></dt>
                                        <dd>
                                            Htmlstream
                                            <span>
                                                <a class="pull-right" href="#">
                                                    <i class="fa fa-pencil"></i>
                                                </a>
                                            </span>
                                        </dd>
                                        <hr>
                                        <dt><strong>Primary Email Address </strong></dt>
                                        <dd>
                                            edward-rooster@gmail.com
                                            <span>
                                                <a class="pull-right" href="#">
                                                    <i class="fa fa-pencil"></i>
                                                </a>
                                            </span>
                                        </dd>
                                        <hr>
                                        <dt><strong>Phone Number </strong></dt>
                                        <dd>
                                            (304) 33-2867-499
                                            <span>
                                                <a class="pull-right" href="#">
                                                    <i class="fa fa-pencil"></i>
                                                </a>
                                            </span>
                                        </dd>
                                        <hr>
                                        <dt><strong>Office Number </strong></dt>
                                        <dd>
                                            (304) 44-9810-296
                                            <span>
                                                <a class="pull-right" href="#">
                                                    <i class="fa fa-pencil"></i>
                                                </a>
                                            </span>
                                        </dd>
                                        <hr>
                                        <dt><strong>Address </strong></dt>
                                        <dd>
                                            California, US
                                            <span>
                                                <a class="pull-right" href="#">
                                                    <i class="fa fa-pencil"></i>
                                                </a>
                                            </span>
                                        </dd>
                                        <hr>
                                    </dl>
                                    <button type="button" class="btn-u btn-u-default">Cancel</button>
                                    <button type="button" class="btn-u">Save Changes</button>
                                </div>

                                <div id="passwordTab" class="profile-edit tab-pane fade">
                                    <h2 class="heading-md">Manage your Security Settings</h2>
                                    <p>Change your password.</p>
                                    <br>
                                    <form class="sky-form" id="sky-form4" action="#">
                                        <dl class="dl-horizontal">
                                            <dt>Email address</dt>
                                            <dd>
                                                <section>
                                                    <label class="input">
                                                        <i class="icon-append fa fa-envelope"></i>
                                                        <input type="email" placeholder="Email address" readonly value="${Account.email}" name="email">
                                                        <!--<b class="tooltip tooltip-bottom-right">Needed to verify your account</b>-->
                                                    </label>
                                                </section>
                                            </dd>
                                            <dt>Enter your password</dt>
                                            <dd>
                                                <section>
                                                    <label class="input">
                                                        <i class="icon-append fa fa-lock"></i>
                                                        <input type="password" id="password" name="password" placeholder="Password">
                                                        <b class="tooltip tooltip-bottom-right">Don't forget your password</b>
                                                    </label>
                                                </section>
                                            </dd>
                                            <dt>Confirm Password</dt>
                                            <dd>
                                                <section>
                                                    <label class="input">
                                                        <i class="icon-append fa fa-lock"></i>
                                                        <input type="password" name="passwordConfirm" placeholder="Confirm password">
                                                        <b class="tooltip tooltip-bottom-right">Don't forget your password</b>
                                                    </label>
                                                </section>
                                            </dd>
                                        </dl>
                                        <button type="button" class="btn-u btn-u-default">Cancel</button>
                                        <button class="btn-u" type="submit">Save Changes</button>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Profile Content -->
            </div>
        </div><!--/container-->
        <!--=== End Profile ===-->

    </jsp:body>
</t:defaultLayout>