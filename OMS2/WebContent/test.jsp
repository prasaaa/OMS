<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Automated Barcode Solution</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="${pageContext.request.contextPath}/vendor/select2-4.0.11/select2-4.0.11/tests/vendor/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/vendor/select2-4.0.11/select2-4.0.11/dist/js/select2.min.js"></script>
<link href="vendor/select2-4.0.11/select2-4.0.11/dist/css/select2.min.css" rel="stylesheet" />

<link href="css/simple-sidebar3.css" rel="stylesheet">


</head>
<body>

	<form action="test.jsp" method="post">
		<br><br>
	
		<select class="js-example-basic-single" required>
			<option selected disabled value="">Select Country</option>
			<option value="srilanka">Sri Lanka</option>
			<option value="india">India</option>
			<option value="pakistan">Pakistan</option>
			<option value="bangladesh">Bangladesh</option>
			<option value="afganistan">Afganistan</option>
			<option value="nepal">Nepal</option>
			<option value="butan">Butan</option>
			<option value="maldives">Maldives</option>
		</select>
		<br><br>
		
		<input type="submit" value="Submit">
	</form>
	<script>
	$(document).ready(function() {
	    $('.js-example-basic-single').select2({
	    	width: "300px",
	    	searchInputPlaceholder: "Search..."
	    });
	});


    </script>
</body>
</html>