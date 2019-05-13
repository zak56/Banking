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
<title>Appointment Date and Time</title>
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
	<div id = "mainBox">
		<table style="margin: auto">
			<tr>
				<th>Time ID</th>
				<th>Time</th>
			</tr>
			<%
				String location = request.getParameter("location");

				{
					PreparedStatement pstatement = null;

					ResultSet updateQuery;
					try {
						connection = DriverManager.getConnection(connectionUrl + database, userid, password);
						statement = connection.createStatement();

						String sql = "SELECT TimeID,Time FROM `location` join `appointment time` WHERE `location`.`LocationID` = `appointment time`.`LocationID` AND `location`.`LocationID` = ? ORDER BY `appointment time`.`TimeID` ASC";
						pstatement = connection.prepareStatement(sql);
						pstatement.setString(1, location);

						updateQuery = pstatement.executeQuery();

						while (updateQuery.next()) {
			%>
			<tr>
				<td><%=updateQuery.getString("TimeID")%></td>
				<td><%=updateQuery.getString("Time")%></td>
			</tr>
			<%
				}
						connection.close();
					} catch (Exception e) {

						e.printStackTrace();
					}
				}
			%>
		</table>
	</div>
	<div style="text-align: center">
		<form action="appointment_detail" method="POST">
			<input type="hidden" name=topic value="${topic}"> <br> <input
				type="hidden" name=location value="${location}"> <br> <input
				type="date" name=date><br>
			<%
				{
					PreparedStatement pstatement = null;

					ResultSet updateQuery;
					try {
						connection = DriverManager.getConnection(connectionUrl + database, userid, password);
						statement = connection.createStatement();

						String sql = "SELECT * FROM `location` join `appointment time` WHERE `location`.`LocationID` = `appointment time`.`LocationID` AND `location`.`LocationID` = ? ORDER BY `appointment time`.`TimeID` ASC";
						pstatement = connection.prepareStatement(sql);
						pstatement.setString(1, location);

						updateQuery = pstatement.executeQuery();
			%>
			<select name="time">
				<%
					while (updateQuery.next()) {
				%>
				<option value="<%=updateQuery.getString("Time")%>"><%=updateQuery.getString("TimeID")%>
					<%=updateQuery.getString("Time")%></option>
				<%
					}
				%>
			</select>
			<%
				connection.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			%>
			<input type="submit"><br>
		</form>
	</div>
</body>
</html>