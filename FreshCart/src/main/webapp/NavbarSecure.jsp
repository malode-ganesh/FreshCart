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
		<a class="navbar-brand" href="index.jsp"> <img src="images/freshCartLogo-2.png" alt="Classify" width="110px">
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
					<button class="btn btn-sm btn-dark mt-1" onClick="displayResult()"><i class="fa-solid fa-square-poll-vertical"></i>Report</button>
				</li>
				<li class="nav-item"><a class="nav-link " href="about.jsp"><i class="fa-solid fa-circle-info"></i> About</a></li>
								<li class="nav-item"><a class="nav-link " href="Contact.jsp"><i class=""></i> Contact</a></li>
				

			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a class="btn btn-danger" href="#"><span class="glyphicon glyphicon-log-in "></span> Logout <i class="fa-solid fa-right-from-bracket"></i></a>
				</li>

			</ul>
		</div>
	</nav>

</body>

</html>