<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<html>
<title>Employees</title>
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
	<h2>Employees</h2>
	<table>
	  <tr>
	    <th>Username</th>
	    <th>Name</th>
	    <th>Gender</th>
	    <th>Date of birth</th>
	    <th>Email</th>
	    <th>Address</th>
	    <th>Salary</th>
	    
	  </tr>
		<c:forEach var="fulllist" items="${employeelist}">
		<tr>
			<td>
		    ${fulllist[0]}
		    </td>
		    <td>
		    ${fulllist[1]}
		    </td>
		    <td>
		    ${fulllist[2]}
		    </td>
		    <td>
		    ${fulllist[3]}
		    </td>
		    <td>
		    ${fulllist[4]}
		    </td>
		    <td>
		    ${fulllist[5]}, ${fulllist[6]}, ${fulllist[7]}
		    </td>
		    <td>
		    ${fulllist[8]}
		    </td>
		    </tr>
		</c:forEach>
	</table>
</body>
</html>