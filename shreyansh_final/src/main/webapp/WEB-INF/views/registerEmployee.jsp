<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<head>
<title>Add employee</title>
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
</head>
<body>
<h1>Register Employee</h1>
	<form:form method="post" modelAttribute="user" action="registerEmployee">
		<table><tr><td>
		Username</td><td>
		<form:input path="username" type="text" /> </td><!-- bind to user.name-->
		<form:errors path="username" /> </tr>
		
		<tr><td>
		Password</td><td>
		<form:input path="password" type="password" /> </td><!-- bind to user.name-->
		<form:errors path="password" /></tr>
		
		<tr><td>Confirm password </td>
		<td>
		<form:input path="mPassword" type="password" /> </td>
		<form:errors path="mPassword" /></tr>
		
		<tr><td>Name</td>
		<td>
		<form:input path="name" type="text" /> </td>
		<form:errors path="name" /></tr>
		
		<tr><td>Email</td>
		<td>
		<form:input path="mail" type="text" /> </td><!-- bind to user.name-->
		<form:errors path="mail" /></tr>
		
		<tr><td>Salary</td>
		<td>
		<form:input path="salary" type="number" min="0"/> </td><!-- bind to user.name-->
		<form:errors path="salary" /></tr>
		
		<form:hidden path="type" value="employee" />
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td>
			</tr>
		${error}
		</table>
	</form:form>
	</body>