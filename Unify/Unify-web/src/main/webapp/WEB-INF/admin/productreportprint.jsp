<%-- 
    Document   : report
    Created on : Dec 12, 2015, 10:15:32 PM
    Author     : ken
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
        var barChartCanvas = $("#barChart").get(0).getContext("2d");
        var barChart = new Chart(barChartCanvas);
        var barChartData = {
        labels: [
            <c:forEach items="${names}" var="vendor" varStatus="vendorStatus">
                '<c:out value="${vendor}" />'
                <c:if test="${!vendorStatus.last}">
                ,
                </c:if>
            </c:forEach>
        ],
                datasets: [
                {
                label: "Electronics",
                        fillColor: "#00C0EF",
                        strokeColor: "rgba(210, 214, 222, 1)",
                        pointColor: "rgba(210, 214, 222, 1)",
                        pointStrokeColor: "#c1c7d1",
                        pointHighlightFill: "#fff",
                        pointHighlightStroke: "rgba(220,220,220,1)",
                        data: ${quantity}
                }
                ]
        };
        // barChartData.datasets[1].fillColor = "#00a65a";
        //barChartData.datasets[1].strokeColor = "#00a65a";
        // barChartData.datasets[1].pointColor = "#00a65a";
        var barChartOptions = {
            //Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
            scaleBeginAtZero: true,
            //Boolean - Whether grid lines are shown across the chart
            scaleShowGridLines: true,
            //String - Colour of the grid lines
            scaleGridLineColor: "rgba(0,0,0,.05)",
            //Number - Width of the grid lines
            scaleGridLineWidth: 1,
            //Boolean - Whether to show horizontal lines (except X axis)
            scaleShowHorizontalLines: true,
            //Boolean - Whether to show vertical lines (except Y axis)
            scaleShowVerticalLines: true,
            //Boolean - If there is a stroke on each bar
            barShowStroke: true,
            //Number - Pixel width of the bar stroke
            barStrokeWidth: 2,
            //Number - Spacing between each of the X value sets
            barValueSpacing: 5,
            //Number - Spacing between data sets within X values
            barDatasetSpacing: 1,
            //String - A legend template
            //Boolean - whether to make the chart responsive
            responsive: true,
            maintainAspectRatio: true
        };

        barChartOptions.datasetFill = false;
        barChart.Bar(barChartData, barChartOptions);
    });
        </script> 

        <script src="<c:url value="/plugins/slimScroll/jquery.slimscroll.min.js"/>" type="text/javascript"></script>
        <div class="wrapper">

            <section class="invoice" >
    <div id="printdiv">
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
            <h2 class="box-body text-center"><strong>PRODUCT REPORT</strong></h2>
            <div class="col-sm-4 invoice-col">

                <address>

                    <h3>From: ${from}</h3>
                    <h3>To: ${to}</h3>



                </address>
            </div><!-- /.col -->
            <div class="col-sm-4 invoice-col">
                <address>
                    <h3> Total Product:  
                        <strong>
                            ${tongsanpham}
                        </strong><br></h3>
                </address>
            </div><!-- /.col -->
            <div class="col-sm-4 invoice-col">

                <address>
                    <h3>Total Selling: <strong>
                            ${spdangban}
                        </strong><br>

                    </h3>
                    <h3>Total Canceling: <strong>
                            ${sphuyban}
                        </strong><br>

                    </h3>
                </address>
            </div><!-- /.col -->
        </div><!-- /.row -->
        <div class="row">
            <c:forEach items="${listcategory}" var="p">
                <div class="col-sm-3 invoice-col">

                    <address>
                        <c:set var="x" value="0"/>        
                        <c:forEach items="${p.subCategoryCollection}" var="sub">
                            <input type="hidden" value="${x=x+sub.productCollection.size()}"/>  
                        </c:forEach>
                        <h3>${p.name}: <strong> ${x} </strong> items</h3>
                    </address>
                </div><!-- /.col -->
            </c:forEach>
        </div>
        


            <div class="col-sm-8 invoice-col">
                <div class="box-header">
                    <h2 class="box-title"><strong>TOP SELL IN ${day} DAYS</strong> </h2>
                </div><!-- /.box-header -->
                <c:if test="${listtopsale.size()>0}">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>No</th>                                    
                                <th>ProductName</th>
                                <th>Quantity</th> 
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="x" value="0"/>
                            <c:forEach var="p" items="${listtopsale}">
                                <tr>
                                    <td>${x=x+1}</td>                                        
                                    <td>${p.productName}</td>
                                    <td>${p.quantity}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${listtopsale.size()<1}">
                    <h2>No items sold in this time</h2>
                </c:if>
            </div><!-- /.col -->
            


       
                 <div class="row col-sm-8">


            
            <div class="col-sm-6 invoice-col">
                <br/><br/>
                <div class="box box-success">
                    <div class="box-header with-border chart">
                        <h3 class="box-title">Top Sell Chart</h3>

                    </div>
                    <div class="box-body">

                        <canvas id="barChart" style="height:180px"></canvas>

                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div>


        </div>
        
            <div class="col-sm-6 invoice-col">
                <div class="box-header">
                    <h2 class="box-title"><strong>TOP COMMENT IN ${day} DAYS</strong> </h2>
                </div><!-- /.box-header -->
                <table class="table table-striped">

                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Name</th>
                            <th>Comments</th>
                                                          

                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="x" value="0"/>
                        <c:forEach var="p" items="${listtopcomment}">
                            <tr>
                                <td>${x=x+1}</td>                                        
                                <td>${p.productName}</td>
                                <td>${p.quantity}</td>
                                
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
           
            
        
                        
           
            <div class="col-sm-6 invoice-col">
                <div class="box-header">
                    <h2 class="box-title"><strong>TOP LIKE </strong> </h2>
                </div><!-- /.box-header -->
                <table class="table table-striped">

                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Name</th>
                            <th>Like</th>
                            <th>Description</th>                                  

                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="x" value="0"/>
                        <c:forEach var="p" items="${listtoplike}">
                            <tr>
                                <td>${x=x+1}</td>                                        
                                <td>${p.name}</td>
                                <td>${p.like}</td>
                                <td>${p.description}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div><!-- /.col -->
            
        


    </div>
    <!-- this row will not appear when printing -->
    
</section>
        </div>
        <script type="text/javascript">
            $(window).load(function() {
                window.print();
                init();
            });
        </script>
    </body>
</html>
