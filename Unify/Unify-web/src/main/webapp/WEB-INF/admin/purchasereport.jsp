<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<t:adminLayout title="Shop UI - AdminPage - User Management">
    <jsp:attribute name="pagecss">
        <link href="<c:url value="/plugins/datatables/dataTables.bootstrap.css"/>" type="text/css"  rel="stylesheet"/>
        <link href="<c:url value="/plugins/daterangepicker/daterangepicker-bs3.css"/>" type="text/css"  rel="stylesheet"/>
        
    </jsp:attribute>
    <jsp:attribute name="pagejs">
        

        <!-- jQuery 2.1.4 -->
        <!-- ChartJS 1.0.1 -->
        <script src="<c:url value="/plugins/chartjs/Chart.js"/>"></script>
        <!-- FastClick -->
        <script src="<c:url value="/plugins/fastclick/fastclick.js"/>"></script>
        <!-- AdminLTE App -->
        <script src="<c:url value="/plugins/daterangepicker/moment.js"/>"></script>
        <script src="<c:url value="/plugins/daterangepicker/daterangepicker.js"/>"></script>
        
        
        <script>
            $(function() {
                $('#demo').daterangepicker({
                        "showDropdowns": true,
                        "autoApply": true
                    }, function(start, end, label) {
                      console.log("New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')");
                    });
                    
                });
        </script>
        
        <script type="text/javascript">
                var frm = $('#myform');
                frm.submit(function() {
                    
                    $.ajax({
                        type: frm.attr('method'),
                        url: frm.attr('action'),
                        data: frm.serialize(),
                        success: function(output) {
                            $("#reportinfo").html(output);
                            
                        }
                    });
                    return false;
                
                });
            </script>
    </jsp:attribute>
    <jsp:body>
       
        <div class="row" >
            <div class="col-xs-12">
                <div class="box">
                    <div class="pad margin no-print">
                        <div class="callout callout-info" style="margin-bottom: 0!important;">
                            <div class="form-group">
                                <label>Date range:</label>
                                <form id="myform" method="post" action="../PurchaseReport">
                                <div class="input-group col-md-4">                                    
                                    <input type="text" class="form-control" id="demo" name="daterange" value="" />                                  
                                    <span class="input-group-btn">
                                        <button type="submit" class="btn btn-success ">Go!</button>
                                    </span>
                                    
                                </div> 
                                </form>
                                
                            </div>
                        </div>
                    </div>

                    <!-- Main content -->
                    <div id="reportinfo">
                        
                    </div>




                </div>
            </div>
        </div>
    </jsp:body>
</t:adminLayout>