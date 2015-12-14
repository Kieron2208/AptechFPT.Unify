<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    $(function () {
        var pieChartCanvas = $("#pieChart").get(0).getContext("2d");
        var pieChart = new Chart(pieChartCanvas);
        var PieData = [
            {
                value: ${acc},
                color: "#f56954",
                highlight: "#f56954",
                label: "Accessory"
            },
            {
                value: ${pant},
                color: "#00a65a",
                highlight: "#00a65a",
                label: "Pants"
            },
            {
                value: ${dress},
                color: "#f39c12",
                highlight: "#f39c12",
                label: "Dress"
            },
            {
                value: ${shirt},
                color: "#00c0ef",
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
<script src="<c:url value="/plugins/datatables/jquery.dataTables.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/plugins/datatables/dataTables.bootstrap.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/plugins/slimScroll/jquery.slimscroll.min.js"/>" type="text/javascript"></script>
<script>
    $(function () {
        $('#example1').DataTable();
    });
</script>

<section class="invoice">
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
            <div class="col-sm-4 invoice-col">

                <address>

                    <h3> Income: 
                        <strong>
                            <c:set var="dt" value="${doanhthu}"/>
                            <fmt:formatNumber value="${dt}" 
                                              type="currency"/>
                        </strong><br></h3>
                    <h3>Revenue: <strong>
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
                    <h3>Products: <strong>
                            ${hanghoa}
                        </strong><br></h3>
                </address>
            </div><!-- /.col -->
            <div class="col-sm-4 invoice-col">

                <address>

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
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">Data Table With Full Features</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <table id="example1" class="table table-bordered table-striped">
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
                                            <c:if test="${p.status.equals(true)}">
                                                <strong><i class="fa fa-check margin-r-5"></i>  Finish</strong>
                                                </a>
                                            </c:if>

                                            <c:if test="${p.status.equals(false)}">
                                                <form method="post" action="../POUpdate">
                                                    <strong><i class="fa fa-truck margin-r-5"></i> Deliver</strong>
                                                </form>
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
                </div>
            </div>
        </div>


        <div class="row">
            <!-- /.col -->
            <section class="content-header">
                <h1>
                    Chart

                </h1>

            </section>
            <section class="content">
                <div class="row">
                    <div class="col-md-6">
                        <!-- DONUT CHART -->
                        <div class="box box-danger">
                            <div class="box-header with-border">
                                <h3 class="box-title">Donut Chart</h3>
                                <div class="box-tools pull-right">
                                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                </div>
                            </div>
                            <div class="box-body">
                                <canvas id="pieChart" style="height:250px"></canvas>
                            </div><!-- /.box-body -->
                        </div><!-- /.box -->
                    </div>
                    <div class="col-md-6 invoice-col">
                        <address>

                            <h3><button style="background-color: #f56954" class="btn btn-info btn-flat" type="button"></button>
                                Accessory: <strong>
                                    <c:set var="ts" value="${(acc/hanghoa)*100}"/>
                                    <fmt:formatNumber value="${ts}" maxFractionDigits="2" />%                            
                                </strong><br></h3>
                                <h3><button style="background-color: #00a65a" class="btn btn-info btn-flat" type="button"></button> 
                                Pants: <strong>
                                    <c:set var="qu" value="${(pant/hanghoa)*100}"/>
                                    <fmt:formatNumber value="${qu}" maxFractionDigits="2" />% 
                                </strong><br></h3>
                                <h3><button style="background-color:#f39c12 " class="btn btn-info btn-flat" type="button"></button>
                                Dress: <strong>
                                    <c:set var="ad" value="${(dress/hanghoa)*100}"/>
                                    <fmt:formatNumber value="${ad}" maxFractionDigits="2" />%                            
                                </strong><br></h3>
                                <h3><button style="background-color: #00c0ef" class="btn btn-info btn-flat" type="button"></button> 
                                Shirts: <strong>
                                    <c:set var="ad" value="${(shirt/hanghoa)*100}"/>
                                    <fmt:formatNumber value="${ad}" maxFractionDigits="2" />%                            
                                </strong><br></h3>
                        </address>
                    </div>
                    <!--Noi dung % tung thanh phan-->
                </div>
            </section>


        </div><!-- /.row -->
    </div>
    <!-- this row will not appear when printing -->
    <div class="row no-print">
        <div class="col-xs-12">
            <c:url value="/administrator/purchasereportprint" var="printLink"/>
            <a href="${printLink}" target="_blank" class="btn btn-default"><i class="fa fa-print"></i> Print</a>
            <button class="btn btn-success pull-right"><i class="fa fa-credit-card"></i> Submit Payment</button>
            <button class="btn btn-primary pull-right" style="margin-right: 5px;"><i class="fa fa-download"></i> Generate PDF</button>
        </div>
    </div>
</section>