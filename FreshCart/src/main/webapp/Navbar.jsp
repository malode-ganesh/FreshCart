<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<%@include file="Bootstrap/Bootstrap.jsp"%>

</head>

<body class="container-fluid">

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<a class="navbar-brand" href="index.jsp"> <img src="images/freshCartLogo-2.png" alt="FreshKart" width="120px">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="index.jsp"><i class="fa-solid fa-house"></i> Home <span
							class="sr-only">(current)</span></a></li>
				<li class="nav-item">
				<!--btn  -->
				</li>
				<li class="nav-item"><a class="nav-link " href="about.jsp"><i class="fa-solid fa-circle-info"></i> About</a></li>
				<li class="nav-item"><a class="nav-link " href="UserLogin.jsp"><i class=""></i> User Login</a></li>
				<!-- <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Courses </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">BCA</a> <a class="dropdown-item" href="#">BBA</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">MCA</a>
					</div>
				</li> -->
				<li class="nav-item"><a class="nav-link " href="adminLogin.jsp"><i class="fa-regular fa-circle-up"></i> Admin
						Login</a></li>
			</ul>
			<!-- <ul class="nav navbar-nav navbar-right">
      <li><a class="btn btn-info" href="stuReg.jsp"><span class="glyphicon glyphicon-user "></span> Sign Up</a></li>&nbsp;&nbsp;
      <li><a class="btn btn-warning" href="stuLogin.jsp"><span class="glyphicon glyphicon-log-in "></span> Login</a></li>
    </ul> -->
		</div>
	</nav>
	
</body>

</html>