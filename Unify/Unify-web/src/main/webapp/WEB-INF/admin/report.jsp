<%-- 
    Document   : report
    Created on : Dec 12, 2015, 10:15:32 PM
    Author     : ken
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="<c:url value="/plugins/bootstrap/css/bootstrap.min.css"/>" type="text/css"  rel="stylesheet"/>
        <link href="<c:url value="/admin/css/AdminLTE.min.css"/>" type="text/css"  rel="stylesheet"/>
        <!-- Font Awesome -->
        <link rel="stylesheet" href="<c:url value="/plugins/font-awesome/css/font-awesome.min.css"/>">
        <!-- Ionicons -->
        <link rel="stylesheet" href="<c:url value="/plugins/ionicons/css/ionicons.min.css"/>">
    </head>
    <body>

        <script src="<c:url value="/plugins/chartjs/Chart.js"/>"></script>
        <script src="<c:url value="/plugins/jquery/jquery.min.js"/>"></script>
        <script src="<c:url value="/plugins/slimScroll/jquery.slimscroll.min.js"/>" type="text/javascript"></script>
        <script>
            $(function () {
                var pieChartCanvas = $("#pieChart").get(0).getContext("2d");
                var pieChart = new Chart(pieChartCanvas);
                var PieData = [
                    {
                value: ${acc},
                color: "#F39C12",
                highlight: "#f56954",
                label: "Accessory"
            },
            {
                value: ${pant},
                color: "#00A65A",
                highlight: "#00a65a",
                label: "Pants"
            },
            {
                value: ${dress},
                color: "#DD4B39",
                highlight: "#f39c12",
                label: "Dress"
            },
            {
                value: ${shirt},
                color: "#00C0EF",
                highlight: "#00c0ef",
                label: "Shirts"
            }
                ];
                var pieOptions = {
                    //Boolean - Whether we should show a stroke on each segment
                    segmentShowStroke: true,
                    //String - The colour of each segment stroke
                    segmentStrokeColor: "#fff",
                    //Number - The width of each segment stroke
                    segmentStrokeWidth: 2,
                    //Number - The percentage of the chart that we cut out of the middle
                    percentageInnerCutout: 50, // This is 0 for Pie charts
                    //Number - Amount of animation steps
                    animationSteps: 100,
                    //String - Animation easing effect
                    animationEasing: "easeOutBounce",
                    //Boolean - Whether we animate the rotation of the Doughnut
                    animateRotate: true,
                    //Boolean - Whether we animate scaling the Doughnut from the centre
                    animateScale: false,
                    //Boolean - whether to make the chart responsive to window resizing
                    responsive: true,
                    // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
                    maintainAspectRatio: true
                            //String - A legend template
                };
                //Create pie or douhnut chart
                // You can switch between pie and douhnut using the method below.
                pieChart.Doughnut(PieData, pieOptions);
            });
        </script> 

        <script src="<c:url value="/plugins/slimScroll/jquery.slimscroll.min.js"/>" type="text/javascript"></script>
        <div class="wrapper">

            <section class="invoice">

                <!-- title row -->
                <div class="row">
                    <div class="col-xs-12">
                        <h2 class="page-header">
                            <i class="fa fa-globe"></i> UIShop, Inc.
                            <c:set var="now" value="<%=new java.util.Date()%>" />
                            <small class="pull-right">Date: <fmt:formatDate type="both" 
                                            value="${now}" />
                            </small>
                        </h2>
                    </div><!-- /.col -->
                </div>
                <!-- info row -->
                <div class="row invoice-info">
                    <div class="col-sm-4 invoice-col">

                        <address>

                            <h3> TOTAL COST: 
                                <strong>
                                    <c:set var="dt" value="${doanhthu}"/>
                                    <fmt:formatNumber value="${dt}" 
                                                      type="currency"/>
                                </strong><br></h3>
                            <h3>TOTAL PROFIT: <strong>
                                    <c:set var="ln" value="${loinhuan}"/>
                                    <fmt:formatNumber value="${ln}" 
                                                      type="currency"/>
                                </strong><br>

                            </h3>

                        </address>
                    </div><!-- /.col -->
                    <div class="col-sm-4 invoice-col">
                        <address>
                            <h3> Invoices: <strong>
                                    ${donhang}
                                </strong><br></h3>
                            <h3> Finish: <strong>
                                    ${hoanthanh}
                                </strong><br></h3>
                            <h3>  InProgress: <strong>
                                    ${giaohang}
                                </strong><br></h3>
                            <h3>Cancel: <strong>
                                    ${cancel}
                                </strong><br></h3>
                        </address>
                    </div><!-- /.col -->
                    <div class="col-sm-4 invoice-col">

                        <address>
                            <h3>Products: <strong>
                                    ${hanghoa}
                                </strong><br></h3>
                            <h3> Accessory: <strong>
                                    ${acc}
                                </strong><br></h3>
                            <h3>  Pants: <strong>
                                    ${pant}
                                </strong><br></h3>
                            <h3>   Dress: <strong>
                                    ${dress}
                                </strong><br></h3>
                            <h3>   Shirts: <strong>
                                    ${shirt}
                                </strong><br></h3>
                        </address>
                    </div><!-- /.col -->
                </div><!-- /.row -->
                <div class="row">
                    <div class="col-xs-12 table-responsive">


                        <table class="table table-striped">

                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>BillID</th>
                                    <th>Name</th>
                                    <th>Address</th>
                                    <th>Phone</th>
                                    <th>Status</th>
                                    <th>Date</th>
                                    <th>Subtotal</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="x" value="0"/>
                                <c:forEach var="p" items="${list}">
                                    <tr>
                                        <td>${x=x+1}</td>
                                        <td>${p.purchaseOrderId}</td>
                                        <td>${p.name}</td>
                                        <td>${p.address}</td>
                                        <td>${p.phone}</td>
                                        <td style="alignment-adjust: central">
                                            <c:if test="${p.cancelInvoice.equals(true)}">
                                                <c:if test="${p.status.equals(true)}">

                                                    <strong><i class="fa fa-check margin-r-5"></i>  Finish</strong>

                                                </c:if>

                                                <c:if test="${p.status.equals(false)}">

                                                    <strong><i class="fa fa-truck margin-r-5"></i> Deliver</strong>

                                                </c:if>
                                            </c:if>
                                            <c:if test="${p.cancelInvoice.equals(false)}">
                                                <strong><i class="fa fa-close margin-r-5"></i> Cancel</strong>
                                            </c:if>

                                        </td>
                                        <td>
                                            ${p.createdDate}

                                        </td>
                                        <td>
                                            <c:set var="total" value="${p.subTotal}"/>
                                            <fmt:formatNumber value="${total}" 
                                                              type="currency"/>
                                        </td>

                                    </tr>

                                </c:forEach>




                            </tbody>
                        </table>
                    </div><!-- /.box-body -->
                </div><!-- /.box -->
                <!--/Table Print-->



                <div class="row">
                    <!-- /.col -->
                    <section class="content-header">
                        <h1>Chart</h1>

                    </section>
                    <section class="content">
                        <div class="row col-xs-12">
                            <div class="col-md-6">
                                <!-- DONUT CHART -->
                                <div class="box box-danger">
                                    <div class="box-header with-border">
                                        <h3>Category compare</h3>

                                    </div>
                                    <div class="box-body">
                                        <canvas id="pieChart" style="height:250px"></canvas>
                                    </div><!-- /.box-body -->
                                </div><!-- /.box -->
                            </div>
                            
                            <div class="col-md-4 invoice-col">

                                <div class="info-box bg-yellow">
                                    <span class="info-box-icon">
                                        <i class="ion ion-android-alert"></i>
                                    </span>
                                    <div class="info-box-content">
                                        <span class="info-box-text">Accessory</span>
                                        <span class="info-box-number">${acc}</span>
                                        <div class="progress">
                                            <div class="progress-bar" style="width: ${(acc/hanghoa)*100}%"></div>
                                        </div>
                                        <span class="progress-description">
                                            <c:set var="ts" value="${(acc/hanghoa)*100}"/>
                                            <fmt:formatNumber value="${ts}" maxFractionDigits="2" />%
                                            in ${day} Days
                                        </span>
                                    </div><!-- /.info-box-content -->
                                </div><!-- /.info-box -->
                                <div class="info-box bg-green">
                                    <span class="info-box-icon"><i class="ion ion-ios-heart-outline"></i></span>
                                    <div class="info-box-content">
                                        <span class="info-box-text">Pant</span>
                                        <span class="info-box-number">${pant}</span>
                                        <div class="progress">
                                            <div class="progress-bar" style="width: ${(pant/hanghoa)*100}%"></div>
                                        </div>
                                        <span class="progress-description">
                                            <c:set var="qu" value="${(pant/hanghoa)*100}"/>
                                            <fmt:formatNumber value="${qu}" maxFractionDigits="2" />%
                                            in ${day} Days
                                        </span>
                                    </div><!-- /.info-box-content -->
                                </div><!-- /.info-box -->
                                <div class="info-box bg-red">
                                    <span class="info-box-icon"><i class="ion ion-ios-cloud-download-outline"></i></span>
                                    <div class="info-box-content">
                                        <span class="info-box-text">Dress</span>
                                        <span class="info-box-number">${dress}</span>
                                        <div class="progress">
                                            <div class="progress-bar" style="width: ${(dress/hanghoa)*100}%"></div>
                                        </div>
                                        <span class="progress-description">
                                            <c:set var="ad" value="${(dress/hanghoa)*100}"/>
                                            <fmt:formatNumber value="${ad}" maxFractionDigits="2" />%                            
                                                in ${day} Days
                                        </span>
                                    </div><!-- /.info-box-content -->
                                </div><!-- /.info-box -->
                                <div class="info-box bg-aqua">
                                    <span class="info-box-icon"><i class="ion-ios-chatbubble-outline"></i></span>
                                    <div class="info-box-content">
                                        <span class="info-box-text">Shirt</span>
                                        <span class="info-box-number">${shirt}</span>
                                        <div class="progress">
                                            <div class="progress-bar" style="width:${(shirt/hanghoa)*100}%"></div>
                                        </div>
                                        <span class="progress-description">
                                            <c:set var="ad" value="${(shirt/hanghoa)*100}"/>
                                            <fmt:formatNumber value="${ad}" maxFractionDigits="2" />%                            
                                                in ${day} Days
                                        </span>
                                    </div><!-- /.info-box-content -->
                                </div><!-- /.info-box -->
                            </div>

                            <!--Noi dung % tung thanh phan-->
                        </div>
                    </section>


                </div><!-- /.row -->

                <!-- this row will not appear when printing -->

            </section>
        </div>
        <script type="text/javascript">
            $(window).on("load", function() {
                window.print();
            });
        </script>
    </body>
</html>
