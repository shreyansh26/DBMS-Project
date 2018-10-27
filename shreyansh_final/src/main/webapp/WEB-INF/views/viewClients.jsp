<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<html>
<title>Clients</title>
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
	<h2>Clients</h2>
	<table>
	  <tr>
	    <th>Username</th>
	    <th>Name</th>
	    <th>Email</th>
	    <th>Address</th>
	    
	  </tr>
		<c:forEach var="fulllist" items="${clientslist}">
		<tr>
			<td>
			<a href="viewSpecificOrder?username=${fulllist[0]}">${fulllist[0]}</a>
		    </td>
		    <td>
		    ${fulllist[1]}
		    </td>
		    <td>
		    ${fulllist[2]}
		    </td>
		    <td>
		    ${fulllist[3]}, ${fulllist[4]}, ${fulllist[5]}
		    </td>
		    </tr>
		</c:forEach>
	</table>
</body>
</html>