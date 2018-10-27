<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<title>Edit profile</title>
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
<body>
<h1>Edit profile</h1>
	<form:form method="post" modelAttribute="employee" action="saveEmployeeProfile">
		<table><tr><td>
		Name</td><td>
		<form:input path="name" type="text" /> </td><!-- bind to user.name-->
		<form:errors path="name" /></tr>
		
		<tr><td>Email</td>
		<td>
		<form:input path="email" /> </td><!-- bind to user.name-->
		<form:errors path="email" /></tr>
		
		<tr><td>Date of birth (YYYY-MM-DD)</td>
		<td>
		<form:input path="dateofbirth" /> </td><!-- bind to user.name-->
		<form:errors path="dateofbirth" /></tr>
		
		<tr><td>House No</td>
		<td>
		<form:input path="houseno" /> </td><!-- bind to user.name-->
		<form:errors path="houseno" /></tr>
		
		<tr><td>Street Name</td>
		<td>
		<form:input path="streetname" type="text" /> </td><!-- bind to user.name-->
		<form:errors path="streetname" /></tr>
		
		<tr><td>City</td>
		<td>
		<form:input path="city" type="text" /> </td><!-- bind to user.name-->
		<form:errors path="city" /></tr>
		
		<tr><td>Gender</td>
		<td>
		<form:radiobutton path="gender" value="Male" /> Male
		<form:radiobutton path="gender" value="Female" /> Female </td><!-- bind to user.name-->
		<form:errors path="gender" /></tr>
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td>
			</tr>
		${error}
		<form:hidden path="username" value="${employee.username}" />
		</table>
	</form:form>
	</body>