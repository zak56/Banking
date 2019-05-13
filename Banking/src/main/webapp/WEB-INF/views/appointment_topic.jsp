<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment Topics</title>
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
	<a href="database_employee_holiday">Employee Only</a>

	<div id = "mainBox">
		<form action="appointment_location" method="POST">
			<table style="text-align: center">
				<tr>
					<th colspan="3"><h2>How May We Help You?</h2></th>
				</tr>
				<tr>
					<td><input type="radio" name="topic" value="Checking Account"
						required>Checking Account</td>
				</tr>
				<tr>
					<td><input type="radio" name="topic" value="Saving Account">Saving
						Account</td>
				</tr>
				<tr>
					<td><input type="radio" name="topic" value="Loans">Loans</td>
				</tr>
			</table>
			<br> <input type="submit">
		</form>
	</div>



</body>

</html>