<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="Bootstrap/Bootstrap.jsp"%>
<title>About</title>
</head>
<body class="container-fluid" style="background-color:darkcyan;">
<%@include file="navbar.jsp"%>
<br><br><br>
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<h2 class="text-center" style="font-size:2.9em; font-family: cursive;">About us</h2>
	
		<p class="" style="font-size:1.8em; text-align: justify; font-family:Helvetica;">College Notes Gallery is a web based notes sharing and management system which helps students and teachers to share their notes online effectively.
		 It reduces the wasting of time in manually distributing notes to each individual.
		 It greatly overcomes the lack of availability and converts the manual old school paperwork to a fully automated and managed online system.
		  Classify Notes allows it's users to securely register and log in to their individual accounts and create, read, update, delete notes according to their needs. It provides notes to everyone in a very secure manner. 
		  Multiple users can work in this system at the same time under centralized supervision by administrator. It is a very useful notes management system for Colleges, Schools and other Institutes to manage and share their notes.</p>
		
	</div>
	<div class="col-md-2"></div>	
</div>

	<div >
		<jsp:include page="navBottom.jsp"></jsp:include>
	</div>	
</body>
</html>