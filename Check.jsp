  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Verifying...</title>
</head>
<body>


<%
	try{
			int i=0;
			RequestDispatcher rd;
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","password");
			Statement smt = con.createStatement();
			String id = request.getParameter("check");
			String query="select * from user where uid="+id;
			ResultSet rs=smt.executeQuery(query);
			String uid;
			String fname;
			String lname;
			String username;
			
			while(rs.next()){
				 i++;
				 uid = String.valueOf(rs.getInt(1));
				 fname = rs.getString(2);
				 lname = rs.getString(3);
				// problem = rs.getString(4);
				 username = fname+' '+lname;
				 rd = request.getRequestDispatcher("Updateuser.jsp");
				 request.setAttribute("uid", uid);
				 request.setAttribute("username",username);
				 session = request.getSession();  
			     session.setAttribute("email",request.getParameter("email"));  
				 //request.setAttribute("problem", problem);
				 rd.forward(request, response);
				 break;
			}
				
			if(i==0){
				rd = request.getRequestDispatcher("AfterLogin.jsp");
				String msg = "User details not present in database.";
				request.setAttribute("msg", msg);
				rd.forward(request, response);
			}
	}catch(Exception e){
		System.out.println(e);
	}
	
		
%>

</body>
</html>