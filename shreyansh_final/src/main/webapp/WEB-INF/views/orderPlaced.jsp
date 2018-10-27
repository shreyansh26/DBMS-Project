<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<title>Order placed</title>
<link rel="stylesheet" href="<c:url value="/resources/home/css/main.css" />">
<style>
body {
	background-color: #90ee90;
	padding: 10px;
}
</style>
<body>
Your order has been placed. Your order id is <b>${id}</b>. Please note it for future reference.</br></br>

<div class="title__action"><a id="lg" class="btn btn-warning button-sm" href="download/pdf/${id}.pdf">Download invoice</a></div> </br>
<div class="title__action"><a id="lg" class="btn btn-warning button-sm" href="/dbms/client">Go to home</a></div> </br>
</body>