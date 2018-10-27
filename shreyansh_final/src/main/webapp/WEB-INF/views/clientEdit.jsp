<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
</style>
<title>Edit Profile</title>
<body>
<h1>Edit profile</h1>
	<form:form method="post" modelAttribute="client" action="saveClientProfile">
		<table><tr><td>
		Name</td><td>
		<form:input path="name" type="text" /> </td><!-- bind to user.name-->
		<form:errors path="name" /></tr>
		
		<tr><td>Building No</td>
		<td>
		<form:input path="buildingno" /> </td><!-- bind to user.name-->
		<form:errors path="buildingno" /></tr>
		
		<tr><td>Street Name</td>
		<td>
		<form:input path="streetname" type="text" /> </td><!-- bind to user.name-->
		<form:errors path="streetname" /></tr>
		
		<tr><td>City</td>
		<td>
		<form:input path="city" type="text" /> </td><!-- bind to user.name-->
		<form:errors path="city" /></tr>
		
		<tr><td>Email</td>
		<td>
		<form:input path="mail" type="text" /> </td><!-- bind to user.name-->
		<form:errors path="mail" /></tr>
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td>
			</tr>
		${error}
		<form:hidden path="username" value="${client.username}" />
		</table>
	</form:form>
</body>