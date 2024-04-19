<%@page import="java.sql.*"%>
<%@page import="com.connectionProvider.ConnectionProvider" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!
Connection con;
%>

<%
String email = request.getParameter("email");
String pwd = request.getParameter("pwd");

con = ConnectionProvider.getConnection();
try {
	PreparedStatement pstmt = con.prepareStatement("select * from fc_customer where email=? and pwd=?");
	pstmt.setString(1, email);
	pstmt.setString(2, pwd);
	
	ResultSet rs = pstmt.executeQuery();
	if(rs.next()) {
		HttpSession hs = request.getSession();
		hs.setAttribute("email", email);
		
		RequestDispatcher rd= request.getRequestDispatcher("UserDashboard.jsp");
        rd.forward(request, response);
	}else {
		String errorMsg = "Incorrect username or password";
		request.setAttribute("error", errorMsg);
		RequestDispatcher rd = request.getRequestDispatcher("/UserLogin.jsp");
		rd.forward(request, response);
	}
} catch (SQLException e) {
	System.out.println(e);
}
%>
</body>
</html>