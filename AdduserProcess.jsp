<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Add User</title>
	</head>
<body>
		<h1>Adding User...</h1>
</body>


<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","password");
		Statement smt = con.createStatement();
		String uid = request.getParameter("uid");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String interest = request.getParameter("interest");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String aadhar = request.getParameter("aadhar");
		smt.executeUpdate("insert into user (uid,fname,lname,address,phoneno,aadhar,interest) values('"+uid+"','"+fname+"','"+lname+"','"+address+"','"+phone+"','"+aadhar+"','"+interest+"');");
		session.setAttribute("username", fname);
		session.setAttribute("uid", uid);
		response.sendRedirect("AfterLogin.jsp?prob="+interest);
		
	}catch(Exception e){
		System.out.println(e);
	}

%>
</html>