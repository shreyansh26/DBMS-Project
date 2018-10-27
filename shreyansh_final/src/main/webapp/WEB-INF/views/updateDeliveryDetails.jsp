<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<title>Register as Supplier</title>
<body>
	<form:form method="post" modelAttribute="delivery" action="deliveryDetailsUpdated">
		<table><tr><td>
		Client Username</td><td>
		<form:input path="clntusername" type="text" value="${username}" /> </td><!-- bind to user.name-->
		<td><form:errors path="clntusername" /></td></tr>
		
		<tr><td>
		Order ID</td><td>
		<form:input path="orderid" type="text" value="${orderid}"/> </td><!-- bind to user.name-->
		<td><form:errors path="orderid" /></td></tr>
		
		<tr><td>
		Type of good</td><td>
		<form:input path="type" type="text" value="${type}"/> </td><!-- bind to user.name-->
		<td><form:errors path="type" /></td></tr>
		
		<tr><td>
		Mode Of Transport</td><td>
		<form:input path="modeoftransport" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="modeoftransport" /></td></tr>
		
		<tr><td>Phone No.</td>
		<td>
		<form:input path="contactno" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="contactno" /></td></tr>
		
		<tr>
		<tr><td>Date</td>
		<td>
		<form:input path="date" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="date" /></td></tr>
        
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td>
			</tr>
		<tr><td>${error}</td></tr>
		</table>
	</form:form>
	</body>