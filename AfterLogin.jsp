<%@ page language="java" contentType="text/html; charset=ISO-8859-1"     pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <title>User</title>
</head>

<body>

    <nav nav class="navbar navbar-expand-lg navbar-light">
        <span style="margin-left:2%;">
          
        </span>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup"
            aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <span style="margin-left:84%;">
                <div class="navbar-nav ml-auto">
                    <a class="nav-item nav-link" href="AfterLogin.jsp">Home</a>
                    <a class="nav-item nav-link" href="Logout.jsp">Signout</a>
                </div>
            </span>
        </div>
    </nav>
    <div class="container">
        <div class="jumbotron" style="margin-top:8%">
            <div class="container">

    <% 
      	try{
		      Class.forName("com.mysql.jdbc.Driver");
		      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","password");
		      Statement smt = con.createStatement();
		      String query2="select * from user";
		
		      PreparedStatement ps2=con.prepareStatement(query2);
		
		      ResultSet rs2=ps2.executeQuery(query2);
        	
     %>
        
               
                <h1>User List</h1><hr><br>
                <table border="1" width="800">
                    <tr bgcolor="00FF7F">
                        <th><b>USERID</b></th>
                        <th><b>FIRST NAME</b></th>
                        <th><b>LAST NAME</b></th>
                        <th><b>ADDRESS</b></th>
                        <th><b>PHONE</b></th>
                        <th><b>AADHAR</b></th>
                        <th><b>INTEREST</b></th>
                    </tr>
                    <%  while(rs2.next()){ %>
                    <tr>
                        <td><%=rs2.getString(1)%></td>
                        <td><%=rs2.getString(2)%></td>
                        <td><%=rs2.getString(3)%></td>
                        <td><%=rs2.getString(4)%></td>
                        <td><%=rs2.getString(5)%></td>
                        <td><%=rs2.getString(6)%></td>
                        <td><%=rs2.getString(7)%></td>
                        
                    </tr>
                    <% } %>
                </table><br>
                <%
				}catch(Exception e){
				     System.out.println(e); 		
				      	}
                %>
                <hr />
            </div><br>
            
            <form action="Check.jsp" method="post">
                <label type="check">
                    <h5>Check User Records:</h5>
                </label>
                <input type="text" name="check" size="10"><br>
                    <button type=" submit" class="btn btn-primary">Check</button>
            </form>
            <br>
            
             <form action="Adduser.jsp">
                    <button type="submit" class=" btn btn-primary ">Add User</button>
             </form><br>
				<%
				
					String msg = "";
					try{
						msg = request.getAttribute("msg").toString();
					}catch(Exception e){
						//System.out.println(e);
					}
					if(msg == null)
						msg = "";
				
				%>
            <p>User Records Status : <br><b><%=msg %></b></p>


            <br>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

</body>

</html>