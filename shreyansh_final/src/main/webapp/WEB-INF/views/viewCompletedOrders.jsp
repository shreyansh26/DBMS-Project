<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@page session="true"%>

<html>
<title>Completed orders</title>
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
	<h2>Completed orders</h2>
	<c:if test="${fn:length(invoicelist) > 0}">
	<table>
	  <tr>
	    <th>Order Id</th>
	    <th>Client Username</th>
	    <th>Type of good</th>
	    <th>Quantity</th>
	    <th>Update delivery details</th>
	  </tr>
		<c:forEach var="fulllist" items="${invoicelist}">
			<tr>
		    	<td id="${fulllist[0]}">${fulllist[0]}</td>
		    	<td>${fulllist[1]}</td>
		    	<td>${fulllist[2]}</td>
		    	<td>${fulllist[3]}</td>
		    	<td><a href="updateDeleiveryDetails?user=${fulllist[1]}&orderid='${fulllist[0]}&type='${fulllist[2]}'">Update Delivery details</a>
		    	</td>
		    </tr>
		</c:forEach>
	</table>
	</c:if>
	<c:if test="${empty invoicelist}">
		All completed orders have their delivery details up to date!</b>!
	</c:if>
</body>
</html>