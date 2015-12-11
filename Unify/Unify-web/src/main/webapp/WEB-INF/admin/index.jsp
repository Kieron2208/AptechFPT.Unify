<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<t:adminLayout title="Shop UI - AdminPage">
    <jsp:attribute name="pagejs">
        <script src="<c:url value="/plugins/chartjs/Chart.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/admin/js/pages/dashboard2.js"/>" type="text/javascript"></script>
    </jsp:attribute>
    <jsp:body>
        <!-- Info boxes -->
        <div class="row">
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon bg-aqua"><i class="ion ion-ios-gear-outline"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">CPU Traffic</span>
                        <span class="info-box-number">90<small>%</small></span>
                    </div><!-- /.info-box-content -->
                </div><!-- /.info-box -->
            </div><!-- /.col -->
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon bg-red"><i class="fa fa-google-plus"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Likes</span>
                        <span class="info-box-number">41,410</span>
                    </div><!-- /.info-box-content -->
                </div><!-- /.info-box -->
            </div><!-- /.col -->

            <!-- fix for small devices only -->
            <div class="clearfix visible-sm-block"></div>

            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon bg-green"><i class="ion ion-ios-cart-outline"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Sales</span>
                        <span class="info-box-number">760</span>
                    </div><!-- /.info-box-content -->
                </div><!-- /.info-box -->
            </div><!-- /.col -->
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon bg-yellow"><i class="ion ion-ios-people-outline"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">New Members</span>
                        <span class="info-box-number">2,000</span>
                    </div><!-- /.info-box-content -->
                </div><!-- /.info-box -->
            </div><!-- /.col -->
        </div><!-- /.row -->

        <div class="row">
            <div class="col-md-8">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">Monthly Recap Report</h3>
                        <div class="box-tools pull-right">
                            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            <div class="btn-group">
                                <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">Action</a></li>
                                    <li><a href="#">Another action</a></li>
                                    <li><a href="#">Something else here</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">Separated link</a></li>
                                </ul>
                            </div>
                            <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-12">
                                <p class="text-center">
                                    <strong>Sales: 1 Jan, 2014 - 30 Jul, 2014</strong>
                                </p>
                                <div class="chart">
                                    <!-- Sales Chart Canvas -->
                                    <canvas id="salesChart" style="height: 180px;"></canvas>
                                </div><!-- /.chart-responsive -->
                            </div><!-- /.col -->
                        </div><!-- /.row -->
                    </div><!-- ./box-body -->
                    <div class="box-footer">
                        <div class="row">
                            <div class="col-sm-3 col-xs-6">
                                <div class="description-block border-right">
                                    <span class="description-percentage text-green"><i class="fa fa-caret-up"></i> 17%</span>
                                    <h5 class="description-header">$35,210.43</h5>
                                    <span class="description-text">TOTAL REVENUE</span>
                                </div><!-- /.description-block -->
                            </div><!-- /.col -->
                            <div class="col-sm-3 col-xs-6">
                                <div class="description-block border-right">
                                    <span class="description-percentage text-yellow"><i class="fa fa-caret-left"></i> 0%</span>
                                    <h5 class="description-header">$10,390.90</h5>
                                    <span class="description-text">TOTAL COST</span>
                                </div><!-- /.description-block -->
                            </div><!-- /.col -->
                            <div class="col-sm-3 col-xs-6">
                                <div class="description-block border-right">
                                    <span class="description-percentage text-green"><i class="fa fa-caret-up"></i> 20%</span>
                                    <h5 class="description-header">$24,813.53</h5>
                                    <span class="description-text">TOTAL PROFIT</span>
                                </div><!-- /.description-block -->
                            </div><!-- /.col -->
                            <div class="col-sm-3 col-xs-6">
                                <div class="description-block">
                                    <span class="description-percentage text-red"><i class="fa fa-caret-down"></i> 18%</span>
                                    <h5 class="description-header">1200</h5>
                                    <span class="description-text">GOAL COMPLETIONS</span>
                                </div><!-- /.description-block -->
                            </div>
                        </div><!-- /.row -->
                    </div><!-- /.box-footer -->
                </div><!-- /.box -->
            </div><!-- /.col -->
            <div class="col-md-4">
                <!-- PRODUCT LIST -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Recently Added Products</h3>
                        <div class="box-tools pull-right">
                            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <ul class="products-list product-list-in-box">
                            <li class="item">
                                <div class="product-img">
                                    <img src="dist/img/default-50x50.gif" alt="Product Image">
                                </div>
                                <div class="product-info">
                                    <a href="javascript::;" class="product-title">Samsung TV <span class="label label-warning pull-right">$1800</span></a>
                                    <span class="product-description">
                                        Samsung 32" 1080p 60Hz LED Smart HDTV.
                                    </span>
                                </div>
                            </li><!-- /.item -->
                            <li class="item">
                                <div class="product-img">
                                    <img src="dist/img/default-50x50.gif" alt="Product Image">
                                </div>
                                <div class="product-info">
                                    <a href="javascript::;" class="product-title">Bicycle <span class="label label-info pull-right">$700</span></a>
                                    <span class="product-description">
                                        26" Mongoose Dolomite Men's 7-speed, Navy Blue.
                                    </span>
                                </div>
                            </li><!-- /.item -->
                            <li class="item">
                                <div class="product-img">
                                    <img src="dist/img/default-50x50.gif" alt="Product Image">
                                </div>
                                <div class="product-info">
                                    <a href="javascript::;" class="product-title">Xbox One <span class="label label-danger pull-right">$350</span></a>
                                    <span class="product-description">
                                        Xbox One Console Bundle with Halo Master Chief Collection.
                                    </span>
                                </div>
                            </li><!-- /.item -->
                            <li class="item">
                                <div class="product-img">
                                    <img src="dist/img/default-50x50.gif" alt="Product Image">
                                </div>
                                <div class="product-info">
                                    <a href="javascript::;" class="product-title">PlayStation 4 <span class="label label-success pull-right">$399</span></a>
                                    <span class="product-description">
                                        PlayStation 4 500GB Console (PS4)
                                    </span>
                                </div>
                            </li><!-- /.item -->
                        </ul>
                    </div><!-- /.box-body -->
                    <div class="box-footer text-center">
                        <a href="javascript::;" class="uppercase">View All Products</a>
                    </div><!-- /.box-footer -->
                </div><!-- /.box -->
            </div>
        </div><!-- /.row -->

        <div class="row">
            <div class="col-md-8">
                <!-- TABLE: LATEST ORDERS -->
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Latest Orders</h3>
                        <div class="box-tools pull-right">
                            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <div class="table-responsive">
                            <table class="table no-margin">
                                <thead>
                                    <tr>
                                        <th>Order ID</th>
                                        <th>Item</th>
                                        <th>Status</th>
                                        <th>Popularity</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><a href="pages/examples/invoice.html">OR9842</a></td>
                                        <td>Call of Duty IV</td>
                                        <td><span class="label label-success">Shipped</span></td>
                                        <td><div class="sparkbar" data-color="#00a65a" data-height="20">90,80,90,-70,61,-83,63</div></td>
                                    </tr>
                                    <tr>
                                        <td><a href="pages/examples/invoice.html">OR1848</a></td>
                                        <td>Samsung Smart TV</td>
                                        <td><span class="label label-warning">Pending</span></td>
                                        <td><div class="sparkbar" data-color="#f39c12" data-height="20">90,80,-90,70,61,-83,68</div></td>
                                    </tr>
                                    <tr>
                                        <td><a href="pages/examples/invoice.html">OR7429</a></td>
                                        <td>iPhone 6 Plus</td>
                                        <td><span class="label label-danger">Delivered</span></td>
                                        <td><div class="sparkbar" data-color="#f56954" data-height="20">90,-80,90,70,-61,83,63</div></td>
                                    </tr>
                                    <tr>
                                        <td><a href="pages/examples/invoice.html">OR7429</a></td>
                                        <td>Samsung Smart TV</td>
                                        <td><span class="label label-info">Processing</span></td>
                                        <td><div class="sparkbar" data-color="#00c0ef" data-height="20">90,80,-90,70,-61,83,63</div></td>
                                    </tr>
                                    <tr>
                                        <td><a href="pages/examples/invoice.html">OR1848</a></td>
                                        <td>Samsung Smart TV</td>
                                        <td><span class="label label-warning">Pending</span></td>
                                        <td><div class="sparkbar" data-color="#f39c12" data-height="20">90,80,-90,70,61,-83,68</div></td>
                                    </tr>
                                    <tr>
                                        <td><a href="pages/examples/invoice.html">OR7429</a></td>
                                        <td>iPhone 6 Plus</td>
                                        <td><span class="label label-danger">Delivered</span></td>
                                        <td><div class="sparkbar" data-color="#f56954" data-height="20">90,-80,90,70,-61,83,63</div></td>
                                    </tr>
                                    <tr>
                                        <td><a href="pages/examples/invoice.html">OR9842</a></td>
                                        <td>Call of Duty IV</td>
                                        <td><span class="label label-success">Shipped</span></td>
                                        <td><div class="sparkbar" data-color="#00a65a" data-height="20">90,80,90,-70,61,-83,63</div></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div><!-- /.table-responsive -->
                    </div><!-- /.box-body -->
                    <div class="box-footer clearfix">
                        <a href="javascript::;" class="btn btn-sm btn-info btn-flat pull-left">Place New Order</a>
                        <a href="javascript::;" class="btn btn-sm btn-default btn-flat pull-right">View All Orders</a>
                    </div><!-- /.box-footer -->
                </div><!-- /.box -->
            </div><!-- /.col -->

            <div class="col-md-4">
                <!-- USERS LIST -->
                <div class="box box-danger">
                    <div class="box-header with-border">
                        <h3 class="box-title">Latest Members</h3>
                        <div class="box-tools pull-right">
                            <span class="label label-danger">8 New Members</span>
                            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                    </div><!-- /.box-header -->
                    <div class="box-body no-padding">
                        <ul class="users-list clearfix">
                            <li>
                                <img src="dist/img/user1-128x128.jpg" alt="User Image">
                                <a class="users-list-name" href="#">Alexander Pierce</a>
                                <span class="users-list-date">Today</span>
                            </li>
                            <li>
                                <img src="dist/img/user8-128x128.jpg" alt="User Image">
                                <a class="users-list-name" href="#">Norman</a>
                                <span class="users-list-date">Yesterday</span>
                            </li>
                            <li>
                                <img src="dist/img/user7-128x128.jpg" alt="User Image">
                                <a class="users-list-name" href="#">Jane</a>
                                <span class="users-list-date">12 Jan</span>
                            </li>
                            <li>
                                <img src="dist/img/user6-128x128.jpg" alt="User Image">
                                <a class="users-list-name" href="#">John</a>
                                <span class="users-list-date">12 Jan</span>
                            </li>
                            <li>
                                <img src="dist/img/user2-160x160.jpg" alt="User Image">
                                <a class="users-list-name" href="#">Alexander</a>
                                <span class="users-list-date">13 Jan</span>
                            </li>
                            <li>
                                <img src="dist/img/user5-128x128.jpg" alt="User Image">
                                <a class="users-list-name" href="#">Sarah</a>
                                <span class="users-list-date">14 Jan</span>
                            </li>
                            <li>
                                <img src="dist/img/user4-128x128.jpg" alt="User Image">
                                <a class="users-list-name" href="#">Nora</a>
                                <span class="users-list-date">15 Jan</span>
                            </li>
                            <li>
                                <img src="dist/img/user3-128x128.jpg" alt="User Image">
                                <a class="users-list-name" href="#">Nadia</a>
                                <span class="users-list-date">15 Jan</span>
                            </li>
                        </ul><!-- /.users-list -->
                    </div><!-- /.box-body -->
                    <div class="box-footer text-center">
                        <a href="javascript::" class="uppercase">View All Users</a>
                    </div><!-- /.box-footer -->
                </div><!--/.box -->
            </div><!-- /.col -->
        </div>
    </jsp:body>
</t:adminLayout>