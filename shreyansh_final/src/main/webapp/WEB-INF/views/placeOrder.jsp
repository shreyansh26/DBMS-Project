<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<style>
body {
	padding: 20px;
}
table {
	align: center;
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 50%%;
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
<title>
Place order</title>
<body>
 		<h1>Place order</h1>
 		<form:form method="post" modelAttribute="order" action="placeOrderByClient">
		<table>
		<c:forEach var="fulllist" items="${productsAndPriceList}">
            <tr><td>
			${fulllist[0]} (Price per pc = ${fulllist[1]}): </td><td>
			<form:input path="orderquantity[${fulllist[0]}]" type="number" min="0" /></td>
			<form:errors path="orderquantity[${fulllist[0]}]" /></tr>
        </c:forEach>
		
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td>
			</tr>
		${error}
		<form:hidden path="clientusername" value="${client}" />
		</table>
	</form:form>

</body>
</html>