<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Client Sign Up</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="<c:url value="/resources/register/fonts/material-icon/css/material-design-iconic-font.min.css" />">

    <!-- Main css -->
    <link rel="stylesheet" href="<c:url value="/resources/register/css/style.css" />">
</head>
<body>

    <div class="main">

        <h1>Sign up</h1>
        <div class="container">
            <div class="sign-up-content">
                <form:form method="POST" class="signup-form" modelAttribute="user" action="register">

					<label for="name">Username</label>
                    <div class="form-textbox">
                        
                        <form:input path="username" type="text" name="name" id="name" />
                        <form:errors path="username" />
                    </div> </br>
                   
                    <label for="name">Password</label>
                    <div class="form-textbox">
                        <form:input class="text" path="password" type="password" />
                        <form:errors path="password" />
                    </div> </br>
                    
                    <label for="name">Confirm Password</label>
                    <div class="form-textbox">
                        
                        <form:input class="text" path="mPassword" type="password" />
                        <form:errors path="mPassword" />
                    </div> </br>
                    
                    <label for="name">Name</label>
                    <div class="form-textbox">
                        <form:input class="text" path="name" type="text" />
                        <form:errors path="name" />
                    </div> </br>

					<label for="name">Email</label>
                    <div class="form-textbox">
                        <form:input class="text" path="mail" type="email" id="email" />
                        <form:errors path="mail" />
                    </div> </br>

                    <div class="form-textbox">
                        <input type="submit" name="submit" id="submit" class="submit" value="Create account" />
                    </div>
                    <form:hidden path="type" value="client" />
                </form:form>

                <p class="loginhere">
                    Already have an account ?<a href="login" class="loginhere-link"> Log in</a>
                </p>
            </div>
            ${error}
        </div>

    </div>

    <!-- JS -->
    <script src="/resources/register/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/register/js/main.js"></script>
</body>
</html>