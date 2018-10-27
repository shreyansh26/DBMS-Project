<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@page session="true"%>

<html>
<title>List of orders</title>
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
	<h2>List of orders</h2>
	<c:if test="${fn:length(specificOrdersList) > 0}">
	<table>
	  <tr>
	    <th>Order Id</th>
	    <th>Type of good</th>
	    <th>Quantity</th>
	    <th>Order Status</th>
	    <th>Change Status</th>
	  </tr>
		<c:forEach var="fulllist" items="${specificOrdersList}">
			<tr>
		    	<td>${fulllist[0]}</td>
		    	<td>${fulllist[1]}</td>
		    	<td>${fulllist[2]}</td>
		    	<td>${fulllist[3]}</td>
		    	<c:if test="${fulllist[3] == 'Not ready'}">
		    	<td><a href="markSpecificAsComplete?id=${fulllist[0]}&user=${clientusername}&type='${fulllist[1]}'">Mark complete</a>
		    	</td>
		    	</c:if>
		    	<c:if test="${fulllist[3] == 'Done'}">
				<td>Completed</td>
				</c:if>
		    </tr>
		</c:forEach>
	</table>
	</c:if>
	<c:if test="${empty specificOrdersList}">
		No orders found for the client <b>${clientusername}</b>!
	</c:if>
</body>
</html>