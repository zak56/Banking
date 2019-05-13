<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment Details</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<style>
body {
	background-size: 100% 90%;
	background-image: url("resources/image/bgGrey.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
}
form {
	margin: 0 auto;
	width: 250px;
}

div#mainBox {
	max-width: 50%;
	text-align: center; 
	background-image: url("resources/image/bgPaper.jpg");
	display: block;
	margin: 0 auto;
}
</style>
<body>
<br>
	<div id= "mainBox">
		<form action="appointment_confirmation" method="POST">
			<input type="hidden" name=topic value="${topic}"> <br>
			<input type="hidden" name=location value="${location}"> <input
				type="hidden" name=date value="${date}"> <input
				type="hidden" name=time value="${time}"> Please enter your
			name<input type="text" name=customerName required><br> Please
			enter your Phone number<input type="tel" placeholder="XXX-XXX-XXXX" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" required name=customerPhone><br>
			Please enter your email<input type="text" name=customerEmail><br>

			<input type="submit">
		</form>
	</div>
</body>
</html>