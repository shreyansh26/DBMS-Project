<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<head>
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 50%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}

body {
	padding: 20px;
}
</style>
<title>Add Raw Material</title>
</head>
<body>
<h2>Add Raw Material</h2>
	<form:form method="post" modelAttribute="rawmaterial" action="rawMaterialAdded">
		<table><tr><td>
		Type</td><td>
		<form:input path="rawmaterialtype" type="text" /></td><!-- bind to user.name-->
		<form:errors path="rawmaterialtype" /></tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td>
			</tr>
		${error}
		</table>
	</form:form>
</body>