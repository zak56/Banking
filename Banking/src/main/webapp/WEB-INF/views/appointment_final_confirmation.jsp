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
<title></title>
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
<h1 align = "center">Your appointment has been set.</h1>

			<%
			String ActiveAppointmentID = "AA000";
			String Service = request.getParameter("topic");
			String LocationID = request.getParameter("location");
			String Date = request.getParameter("date");
			String Time = request.getParameter("time");
			String Name = request.getParameter("customerName");
			String Phone = request.getParameter("customerPhone");
			String Email = request.getParameter("customerEmail");
			String Notes = null;

			PreparedStatement pstatement = null;

			int updateQuery = 0;
			try {
				connection = DriverManager.getConnection(connectionUrl + database, userid, password);
				statement = connection.createStatement();

				String sql = "INSERT INTO `active appointment` (`ActiveAppointmentID`, `LocationID`, `Date`, `Time`, `Name`,`Email`, `Phone`, `Service`,`Notes`) VALUES (?,?,?,?,?,?,?,?,?);";
				pstatement = connection.prepareStatement(sql);
				pstatement.setString(1, ActiveAppointmentID);
				pstatement.setString(2, LocationID);
				pstatement.setString(3, Date);
				pstatement.setString(4, Time);
				pstatement.setString(5, Name);
				pstatement.setString(6, Email);
				pstatement.setString(7, Phone);
				pstatement.setString(8, Service);
				pstatement.setString(9, Notes);

				updateQuery = pstatement.executeUpdate();

				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			%>
</body>
<script>
var timer = setTimeout(function() {
    window.location='http://localhost:8181/appointment/'
}, 2000);
</script>
</html>