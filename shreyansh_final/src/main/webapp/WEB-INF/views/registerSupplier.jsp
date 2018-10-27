<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Supplier Sign Up</title>

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
                <form:form method="POST" class="signup-form" modelAttribute="supplier" action="supplierRegistered">

					<label for="name">Name of Company/Distributor</label>
                    <div class="form-textbox">
                        <form:input path="name" type="text" name="name" id="name" />
                        <form:errors path="name" />
                    </div> </br>
                   
                    <label for="name">Building No.</label>
                    <div class="form-textbox">
                        <form:input class="text" path="buildingno" type="text" />
                        <form:errors path="buildingno" />
                    </div> </br>
                    
                    <label for="name">Street Name</label>
                    <div class="form-textbox">
                        <form:input class="text" path="streetname" type="text" />
                        <form:errors path="streetname" />
                    </div> </br>
                    
					<label for="name">City</label>
                    <div class="form-textbox">
                        <form:input class="text" path="city" type="text" />
                        <form:errors path="city" />
                    </div> </br>

					<label for="name">Phone No.</label>
                    <div class="form-textbox">
                        <form:input class="text" path="phoneno" type="text" />
                        <form:errors path="phoneno" />
                    </div> </br>
                    
                    <label for="name">Email</label>
                    <div class="form-textbox">
                        <form:input class="text" path="email" type="text"/>
                        <form:errors path="email" />
                    </div> </br>

					<h3>What can you supply?</h3>
					<c:forEach var="listitem" items="${rawmaterialtypes}">
						<label for="name">${listitem}:</label>
						    <form:radiobutton style="padding-bottom: 10px;" path="sellingitems[${listitem}]" value="yes"/>
							<form:errors path="sellingitems[${listitem}]" />
        			</c:forEach>
        
                    <div class="form-textbox">
                        <input type="submit" name="submit" id="submit" class="submit" value="Register as Supplier" />
                        <h4>* We will contact you when we require raw materials.</h4>
                    </div>
                </form:form>
            </div>
            ${error}
        </div>

    </div>

    <!-- JS -->
    <script src="/resources/register/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/register/js/main.js"></script>
</body>
</html>