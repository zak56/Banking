<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
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
<style>
body, html {
	overflow: hidden;
	text-align: center;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th {
	padding: 8px;
}

td {
	min-width: 100px;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

#mainBox {
	width: 60%;
	margin: auto;
	align-self: center;
	border: 1px solid black;
	background: #555;
	padding: 10px;
	box-shadow: 5px 10px;
}

#subBox {
	width: 60%;
	margin: auto;
	align-self: center;
	border: 1px solid black;
	background: white;
	padding: 10px;
	box-shadow: 5px 10px;
}

#mainTable {
	table-layout: fixed;
	width: 90%;
	height: 100%;
	max-height: 50%;
	margin-left: 5%;
	margin-right: 5%;
	border: 1px solid black;
}

#dbTable {
	display: block;
	background: #A9A9A9;
	height: 500px;
	width: 100%;
	overflow: scroll;
	border: 1px solid black;
}

/* Style the tab */
.tab {
	align: center;
	overflow: hidden;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
	background-color: inherit;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	transition: 0.3s;
	font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
	background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
	background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
	display: none;
	padding: 6px 12px;
	border: 1px solid #ccc;
	border-top: none;
}

a:link, a:visited {
	border-radius: 5px;
	background-color: grey;
	color: white;
	padding: 5% 3%;
	text-align: center;
	text-decoration: none;
	display: inline;
}

a:hover, a:active {
	background-color: lightgrey;
}
</style>

<head>
<meta charset="ISO-8859-1">
<title>Employee Database</title>
</head>
<body>

	<div id="mainBox">
		<div class="tab">
			<a href="database_employee_holiday">Holidays</a> <a
				href="database_employee_location">Locations</a> <a
				href="database_employee_location_service">Locations Services</a> <a
				href="database_employee_location_OOS">Locations OOS</a> <a
				href="database_employee_location_appointment_time">Appointment
				Times</a> <a href="database_employee_location_active_appointment">Active
				Appointments</a>
		</div>
	</div>

	<div id="subBox">
		<table id="mainTable">
			<tr>
				<th>
					<div id="HolidaysUserInput">
						<%
							String OOS_ID = request.getParameter("OOS_ID");
							String LocationID = request.getParameter("LocationID");
							String Date = request.getParameter("Date");
							if (request.getParameter("submit") != null) {
								PreparedStatement pstatement = null;

								int updateQuery = 0;
								try {
									connection = DriverManager.getConnection(connectionUrl + database, userid, password);
									statement = connection.createStatement();

									String sql = "INSERT INTO `location out of service` (`OOS_ID`, `LocationID`, `Date`) VALUES (?,?,?);";
									pstatement = connection.prepareStatement(sql);
									pstatement.setString(1, OOS_ID);
									pstatement.setString(2, LocationID);
									pstatement.setString(3, Date);

									updateQuery = pstatement.executeUpdate();

									connection.close();
								} catch (Exception e) {
									e.printStackTrace();
								}
							}
						%>
						<form method="get">
							<fieldset>
								<label>OOS ID: <input type="text" name="OOS_ID" /><br></label>
								<label>Location ID: <input type="text" name="LocationID" /><br></label>
								<label>OOS Date: <input type="Date" name="Date" /><br></label>
							</fieldset>
							<br> <input type="submit" name="submit"
								value="Add New Out of Service Date" />
						</form>
					</div>

					<div>
						<%
							String RemoveID = request.getParameter("RemoveID");

							if (request.getParameter("removeSubmit") != null) {
								PreparedStatement pstatement = null;

								int updateQuery = 0;
								try {
									connection = DriverManager.getConnection(connectionUrl + database, userid, password);
									statement = connection.createStatement();

									String sql = "DELETE FROM `location out of service` WHERE `location out of service`.`OOS_ID` = ?";
									pstatement = connection.prepareStatement(sql);
									pstatement.setString(1, RemoveID);

									updateQuery = pstatement.executeUpdate();

									connection.close();
								} catch (Exception e) {
									e.printStackTrace();
								}

							}
						%>
						<form method="get">
							<fieldset>
								<label>Out of Service ID: <input type="text"
									name="RemoveID" /><br></label>
							</fieldset>
							<br> <input type="submit" name="removeSubmit"
								value="Remove a Location" /><br>
							<br>
						</form>
					</div>

				</th>
				<th>
					<div style="overflow-x: auto;">
						<table id="dbTable">
							<tr>
								<td>
									<div id="Holidays">
										<table border="1">
											<tr>
												<td>OOS ID</td>
												<td>Location ID</td>
												<td>Date</td>

											</tr>
											<%
												try {
													connection = DriverManager.getConnection(connectionUrl + database, userid, password);
													statement = connection.createStatement();
													String sql = "select * from `location out of service` ORDER BY `location out of service`.`OOS_ID` ASC";
													resultSet = statement.executeQuery(sql);
													while (resultSet.next()) {
											%>
											<tr>
												<td><%=resultSet.getString("OOS_ID")%></td>
												<td><%=resultSet.getString("LocationID")%></td>
												<td><%=resultSet.getString("Date")%></td>
											</tr>
											<%
												}
													connection.close();
												} catch (Exception e) {
													e.printStackTrace();
												}
											%>
										</table>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</th>
			</tr>
		</table>
	</div>

	<script>
		
	</script>


</body>
</html>