<%@page import="com.dao.Login"%>
<%@page import="com.entities.Admin" %>
<%@page import="com.connectionProvider.ConnectionProvider"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
</head>
<body>
<%
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	
	PrintWriter pw = response.getWriter();
	
	Connection con = ConnectionProvider.getConnection();
	Login login = new Login(con);
	Admin admin = new Admin(email,pwd);
	
	if(login.VerifyAdmin(admin)){		
		pw.print("Welcome "+email);
		%>
			<%@include file="AdminDashboard.jsp" %>
		<%
		
	}else{
		pw.print("<body><center><br><br><br><h3 style=color:red>Invalid username or password<br>Retry</h3>");
		RequestDispatcher rd = request.getRequestDispatcher("adminLogin.jsp");
		rd.include(request, response);
	}
	
	
	
%>
</body>
</html>