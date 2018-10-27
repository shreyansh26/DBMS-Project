<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Client Login</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="<c:url value="/resources/register/fonts/material-icon/css/material-design-iconic-font.min.css" />">

    <!-- Main css -->
    <link rel="stylesheet" href="<c:url value="/resources/register/css/style.css" />">
</head>
<style>
.errorblock {
	color: #ff0000;
	background-color: #ffEEEE;
}
</style>
<body>

    <div class="main">

        <h1 style="text-align: center;">Log In</h1>
        <%
		String errorString = (String) request.getAttribute("error");
		if (errorString != null && errorString.trim().equals("true")) {
			out.println("<span class=\"errorblock\">Incorrect login name or password. Please try again");
		}
		%>
        <div class="container">
            <div class="sign-up-content">
                <form name='loginForm' action="<c:url value='login' />" method='POST'>

					<label for="name">Username</label>
                    <div class="form-textbox">
                        <input type='text' name='username' value=''>
                    </div> </br>
                   
                    <label for="name">Password</label>
                    <div class="form-textbox">
                        <input type='password' name='password' />
                    </div> </br>
                    
                    <div class="form-textbox">
                        <input type="submit" name="Submit" id="submit" class="submit" value="Submit" />
                        <input name="Reset" type="reset" /></td>
                    </div>
                </form>
            </div>
            ${error}
        </div>

    </div>

    <!-- JS -->
    <script src="/resources/register/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/register/js/main.js"></script>
</body>
</html>