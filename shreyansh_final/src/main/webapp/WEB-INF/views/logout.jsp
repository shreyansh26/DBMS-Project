<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logout</title>
<!-- CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/home/css/main.css" />">

<style>
body {
	padding: 10px;
	background-color: #90ee90;
}

#lg {
	align: center;
}
</style>
</head>
<body>
 <h2>You have successfully logged off from the portal!</h2>
 <div class="title__action"><a id="lg" class="btn btn-warning button-sm" href="/dbms">Back to home</a></div>
</body>
</html>