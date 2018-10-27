<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<html>
<title>Suppliers</title>
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
	<h2>Suppliers</h2>
	<table>
	  <tr>
	    <th>Name</th>
	    <th>Address</th>
	    <th>Email</th>
	    <th>Phone No.</th>
	    <th>Goods</th>
	    
	  </tr>
		<c:forEach var="fulllist" items="${supplierslist}">
		<tr>
			<td>
			${fulllist[0]}
		    </td>
		    <td>
		    ${fulllist[1]}, ${fulllist[2]}, ${fulllist[3]}
		    </td>
		    <td>
		    ${fulllist[4]}
		    </td>
		    <td>
		    ${fulllist[5]}
		    </td>
		    <td>
		    ${fulllist[6]}
		    </td>
		    </tr>
		</c:forEach>
	</table>
</body>
</html>