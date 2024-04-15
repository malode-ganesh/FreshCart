<%@page import="com.connectionProvider.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- Error Handling -->
<%@page errorPage="error_page.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<%@include file="Bootstrap/Bootstrap.jsp"%>
<link rel="stylesheet" href="css/login.css">

</head>
<body>

	<div class="col-md-4">
		<form action="stuDashboard.jsp" method="post">
		<div class="card">
			<div class="card-header text-center  p-2">
				<h4>LOGIN HERE</h4>
			</div>
			<div class="card-body">

				<div class="form-group">
					<label for="exampleInputEmail1">Username</label> <input
						type="email" class="form-control" id="exampleInputEmail1" name="email"
						aria-describedby="emailHelp" placeholder="Enter username or email" required>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Password</label> <input
						type="password" class="form-control" id="exampleInputPassword1"
						placeholder="Password" required name="pwd">
				</div>
			</div>
			<div class="card-footer text-center p-2">
				<button type="submit" class="btn btn-sm btn-info"><i class="fa-regular fa-circle-up"></i> Login</button>
				<a href="register.jsp" class="btn btn-sm btn-danger"><i class="fa-solid fa-pen"></i> Register</a>
			</div>
		</div>
		</form>
	</div>
</body>