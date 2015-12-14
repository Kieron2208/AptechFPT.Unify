<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<t:adminLayout title="Shop UI - AdminPage - User Management">
    <div class="row">
        <div class="col-md-3">

            <!-- Profile Image -->
            <div class="box box-primary">
                <div class="box-body box-profile">
                    <c:url value="/img/user/user4-128x128.jpg" var="profileImg"/>
                    <img class="profile-user-img img-responsive img-circle" src="${profileImg}" alt="User profile picture">
                    <h3 class="profile-username text-center">Nina Mcintire</h3>
                    <p class="text-muted text-center">Software Engineer</p>
                </div><!-- /.box-body -->
            </div><!-- /.box -->

        </div><!-- /.col -->
        <div class="col-md-9">
            <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#settings" data-toggle="tab">Settings</a></li>
                </ul>
                <div class="tab-content">
                    <div class="active tab-pane" id="settings">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label for="inputName" class="col-sm-2 control-label">Email</label>
                                <div class="col-sm-10">
                                    <input type="email" readonly class="form-control" id="inputName" value="admin@yourstore.com">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail" class="col-sm-2 control-label">First Name:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputEmail" placeholder="Enter your First Name ..." value="Arthur">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputName" class="col-sm-2 control-label">Last Name:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputName" placeholder="Enter your Last Name ..." value="Gonzalez">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputExperience" class="col-sm-2 control-label">Phone:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputName" placeholder="Enter your Last Name ..." value="7-(126)589-8660">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputSkills" class="col-sm-2 control-label">Date Of Birth:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputSkills" placeholder="Skills" value="1994-12-25">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputSkills" class="col-sm-2 control-label">Gender:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputSkills" placeholder="Skills" value="Male">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-success"><i class="fa fa-edit"></i> Edit</button>
                                </div>
                            </div>
                        </form>
                    </div><!-- /.tab-pane -->
                </div><!-- /.tab-content -->
            </div><!-- /.nav-tabs-custom -->
        </div><!-- /.col -->
    </div><!-- /.row -->

</t:adminLayout>
