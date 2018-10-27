<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<html>
<title>All invoices</title>
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
	<h2>All invoices</h2>
	<table>
	  <tr>
	    <th>Client Username</th>
	    <th>Client Name</th>
	    <th>Order ID</th>
	    <th>Generation Date</th>
	    <th>Due Date</th>
	    <th>Amount</th>
	  </tr>
		<c:forEach var="fulllist" items="${invoicelist}">
			<tr>
		    	<td>${fulllist[0]}</td>
		    	<td>${fulllist[1]}</td>
		    	<td><a href="viewAllOrders#${fulllist[2]}">${fulllist[2]}</a></td>
		    	<td>${fulllist[3]}</td>
		    	<td>${fulllist[4]}</td>
		    	<td>${fulllist[5]}</td>
		    </tr>
		</c:forEach>
	</table>
</body>
</html>