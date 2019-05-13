<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<%
	String id = request.getParameter("userid");
	String driver = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String database = "Banking";
	String userid = "c##web";
	String password = "1234";
	try {
		Class.forName(driver);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment Confirmation</title>
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

		<%
			String LocationID = request.getParameter("location");

			{
				PreparedStatement pstatement = null;

				ResultSet updateQuery;
				try {
					connection = DriverManager.getConnection(connectionUrl + database, userid, password);
					statement = connection.createStatement();

					String sql = "SELECT * FROM `location` WHERE `location`.`LocationID` = ?";
					pstatement = connection.prepareStatement(sql);
					pstatement.setString(1, LocationID);

					updateQuery = pstatement.executeQuery();

					while (updateQuery.next()) {
		%>
		<%=updateQuery.getString("Name")%><br>
		<%=updateQuery.getString("Address")%><br>
		<%=updateQuery.getString("City")%>,<%=updateQuery.getString("State")%>
		<%=updateQuery.getString("Zip")%><br>
		<%=updateQuery.getString("Phone")%><br>
		<%
			}
					connection.close();
				} catch (Exception e) {

					e.printStackTrace();
				}
			}
		%><br> On ${date} At ${time}00 hrs <br> Reason: ${topic} <br>
		Name: ${customerName} <br> Phone number: ${customerPhone} <br> Email: ${customerEmail}
		<br>

	</div>
	<form action="appointment_final_confirmation" method="POST"
		style="text-align: center">
		<input type= "hidden" name=topic value= "${topic}">
		<input type="hidden" name=location value="${location}">
		<input type= "hidden" name=date value= "${date}">
		<input type= "hidden" name=time value= "${time}">
		<input type= "hidden" name=customerName value= "${customerName}">
		<input type= "hidden" name=customerPhone value= "${customerPhone}">
		<input type= "hidden" name=customerEmail value= "${customerEmail}">
		<br>
		
		 <input type="submit" value="Confirm">
	</form>
</body>
<script>
	
</script>
</html>