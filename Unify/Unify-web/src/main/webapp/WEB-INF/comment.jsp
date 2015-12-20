<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script type="text/javascript">

            (function () {
                $(document).ready(function () {
                    var frm = $('#myform6');
                    frm.submit(function () {

                        $.ajax({
                            type: frm.attr('method'),
                            url: frm.attr('action'),
                            data: frm.serialize(),
                            success: function (output) {
                                $("#lik6").html(output);
                                
                            }
                        });
                        return false;

                    });
                    
                   
                });
            })();
            
            

        </script>
        <script type="text/javascript">

            (function () {
                $(document).ready(function () {
                    var frm = $('#myform101');
                    frm.submit(function () {

                        $.ajax({
                            type: frm.attr('method'),
                            url: frm.attr('action'),
                            data: frm.serialize(),
                            success: function (output) {
                                $("#lik101").html(output);
                                
                            }
                        });
                        return false;

                    });
                    
                   
                });
            })();
            
            

        </script>
<div class="product-comment-in">
    <c:forEach var="com" items="${pro.commentCollection}" >
        <img class="product-comment-img rounded-x" src="<c:url value="${com.accountId.imageLink}"/>" alt="">
        <div class="product-comment-dtl">

            <h4>${com.accountId.firstName} <small>
                
                    <c:set var="string1" value="${com.createdDate}"/>
                                            <c:set var="string2" value="${fn:substring(string1, 0, 10)}" />
                                            ${string2}
                </small></h4>
            <p>${com.comments}</p>
            <ul class="list-inline product-ratings">
                <li class="reply"> <span id="lik${com.commentId}">${com.like}</span> Like(s)
                <form id="myform${com.commentId}" method="post" action="../CommentLike">
                    <input type="hidden" name="cid" value="${com.commentId}"/>
                    <button type="submit" class="btn btn-link"><i class="fa fa-heart"> </i></button>
                </form>
            </li>
                <li class="pull-right">
                    
                    </li>                       
            </ul>
        </div>
    </c:forEach>
</div>    