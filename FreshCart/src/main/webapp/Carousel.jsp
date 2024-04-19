<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="Bootstrap/Bootstrap.jsp" %>
<style>
.d-block{
	border-radius:30px;
}
</style>
</head>
<body>
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="images/c1.PNG" alt="First slide" >
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="images/c2.PNG" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="images/c3.PNG" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev " href="#carouselExampleControls" role="button" data-slide="prev" >
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
	</div>
	<div class="col-md-2"></div>
</div>
</body>
</html>