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
<title>Appointment Location</title>
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
				<th colspan="3">Which place is Closest?</th>
			</tr>
			<tr>
			<tr>
				<td>
					<div id="Locations">
						<table border="1">
							<tr>
								<td>Location ID</td>
								<td>Name</td>
								<td>Address</td>
								<td>City</td>
								<td>State</td>
								<td>Zipcode</td>
								<td>Phone</td>
							</tr>
							<%
								String topic = request.getParameter("topic");

								{
									PreparedStatement pstatement = null;

									ResultSet updateQuery;
									try {
										connection = DriverManager.getConnection(connectionUrl + database, userid, password);
										statement = connection.createStatement();

										String sql = "SELECT DISTINCT * FROM `location` join `location service` WHERE `location`.`LocationID` = `location service`.`LocationID` AND `Service` = ?";
										pstatement = connection.prepareStatement(sql);
										pstatement.setString(1, topic);

										updateQuery = pstatement.executeQuery();

										while (updateQuery.next()) {
							%>
							<tr>
								<td><%=updateQuery.getString("LocationID")%></td>
								<td><%=updateQuery.getString("Name")%></td>
								<td><%=updateQuery.getString("Address")%></td>
								<td><%=updateQuery.getString("City")%></td>
								<td><%=updateQuery.getString("State")%></td>
								<td><%=updateQuery.getString("Zip")%></td>
								<td><%=updateQuery.getString("Phone")%></td>
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
				</td>
			</tr>
		</table>

		<br>
		<form action="appointment_date_time" method="POST">
			<input type="hidden" name=topic value="${topic}"> <br>
			<%
				{
					PreparedStatement pstatement = null;

					ResultSet updateQuery;
					try {
						connection = DriverManager.getConnection(connectionUrl + database, userid, password);
						statement = connection.createStatement();

						String sql = "SELECT DISTINCT * FROM `location` join `location service` WHERE `location`.`LocationID` = `location service`.`LocationID` AND `Service` = ?";
						pstatement = connection.prepareStatement(sql);
						pstatement.setString(1, topic);

						updateQuery = pstatement.executeQuery();
			%>
			<select name="location">
				<%
					while (updateQuery.next()) {
				%>
				<option value="<%=updateQuery.getString("LocationID")%>"><%=updateQuery.getString("LocationID")%></option>
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

			<input type="submit">
		</form>
	</div>

</body>
</html>