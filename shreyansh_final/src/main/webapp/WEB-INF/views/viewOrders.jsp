<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<html>
<title>Your orders</title>
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
<body>
	<h2>Your orders</h2>
	<table>
	  <tr>
	    <th>Order Id</th>
	    <th>Type of good</th>
	    <th>Quantity</th>
	    <th>Order Status</th>
	  </tr>
		<c:forEach var="fulllist" items="${orderdetails}">
		    <tr>
		    	<td id="${fulllist[0]}">${fulllist[0]}</td>
		    	<td>${fulllist[1]}</td>
		    	<td>${fulllist[2]}</td>
		    	<td>${fulllist[3]}</td>
		    </tr>
		</c:forEach>
	</table>
</body>
</html>