<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<!-- CSS -->
        <link href="<c:url value="/resources/home/css/main.css"/>" rel="stylesheet">

        <!-- JS -->
        <script src="<c:url value="/resources/home/js/vendor/modernizr-2.8.3.min.js"/>"></script>
        <script src="<c:url value="/resources/home/js/vendor/jquery-1.12.0.min.js"/>"></script>
<style>
ul {
	list-style: none;
}
#footerlinks {
    /*background:#ccc;*/
    overflow:hidden;
    padding:5px;
    width:100%;
}

#footerlinks li {
	text-align: center;
    float:left;
    padding:5px 0;
    width:50%;
}

body {
	background-color: #90ee90;
}
a.logt {
	padding-right: 20px;
    color: #2da1c1;
    text-decoration: none;
    float: right;
}
a.logt:hover {
    color: #f90;
    text-decoration: underline;         
}
</style>
<title>Welcome client</title>
<body>
    <h1 style="padding-left: 10px">Name : ${client}</h1>
 
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <h2 style="padding-left: 10px">
            Welcome : ${client} <a class="logt"
                href="<c:url value="/j_spring_security_logout" />"> Logout</a>
        </h2>
    </c:if>
    </br>
    <ul id="footerlinks">
    <li><div class="title__action"><a href="client/editProfile" class="btn btn-primary">Edit profile</a> </div></li>
    <li><div class="title__action"><a href="client/order" class="btn btn-primary">Place an order</a> </div></li>
    <li><div class="title__action"><a href="client/viewOrders" class="btn btn-primary">View orders</a> </div></li>
    <li><div class="title__action"><a href="client/submitFeedback" class="btn btn-primary">Submit Feedback</a> </div></li>
    <li><div class="title__action"><a href="client/viewClientInvoices" class="btn btn-primary">View Invoices</a> </div></li>
    <li><div class="title__action"><a href="client/viewClientDeliveryDetails" class="btn btn-primary">View Delivery Details</a> </div></li>
    </ul>
</body>
</html>
