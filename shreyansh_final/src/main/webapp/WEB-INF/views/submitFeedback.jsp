<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<title>Submit Feedback</title>
<body>
<h2>Submit feedback</h2>
	<form:form method="post" modelAttribute="feedback" action="feedbackSent">
		<table><tr><td>
		Enter feedback</td><td>
		<form:textarea cols="50" rows="10" path="feedbacktext" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="feedbacktext" /></td></tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td>
			</tr>
		<tr><td>${error}</td></tr>
		<form:hidden path="clientusername" value="${client}"/>
		</table>
	</form:form>
</body>