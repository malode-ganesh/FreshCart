
<%@page import="java.sql.*"%>
<%@page import="com.connectionProvider.ConnectionProvider" %>
<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Products</title>
</head>
<body>
<%!
Connection con = ConnectionProvider.getConnection();
%>
<%
	String email =(String) request.getAttribute("email");
System.out.println("Product email :"+email);
%>
<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Products</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Fruits & Vegitables</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Beverages</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="c3-tab" data-toggle="tab" href="#cat3" role="tab" aria-controls="cat3" aria-selected="false">Sancks</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="c4-tab" data-toggle="tab" href="#cat4" role="tab" aria-controls="cat4" aria-selected="false">Foodgrains,Oil & Masala</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="c5-tab" data-toggle="tab" href="#cat5" role="tab" aria-controls="cat5" aria-selected="false">Cleaning & Household</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="c6-tab" data-toggle="tab" href="#cat6" role="tab" aria-controls="cat6" aria-selected="false">Beauty & Hygiene</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="c7-tab" data-toggle="tab" href="#cat7" role="tab" aria-controls="cat7" aria-selected="false">Baby Care</a>
  </li>
</ul>
<div class="tab-content" id="myTabContent">
<!-- all products -->
  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
  		<%
   
    	try{
    		//category =(String) request.getAttribute("category");
    		Statement stmt = con.createStatement();
    		ResultSet rs = stmt.executeQuery("select * from fc_product");
    		%>
    		<div class="row">
    			<%
    				while(rs.next()){
    					String pName = rs.getString("p_name");
    					String cat = rs.getString("category");
    					String price = rs.getString("price");
    					String desc = rs.getString("p_desc");
    					String p_id = rs.getString("p_id");
    					byte[] imageData = rs.getBytes("imgData");
    					%>
    				<div class="col-lg">
    					<div class="card border-dark mb-3" style="width:250px">
    						<img src="data:image/jpeg;base64, <%= new String(Base64.getEncoder().encode(imageData)) %>"
    							class="card-img-top" alt="...">
    						<div class="card-body">
    							<h5 class="card-title"><%out.print(pName); %></h5>
    							<p class="card-text"><%out.print(desc);%></p>
    							<span><h5>Rs.<%out.print(price);%></h5></span>
    							<div class="text-center">
    							<button class="btn btn-outline-danger btn-block" onclick=addToCart(this)
    								data-product-id="<%= p_id %>"
    								    data-product-name="<%= pName %>"
    								    data-product-price="<%= price %>"
    								    data-product-description="<%= desc %>"
    							>Add to cart</button>
    							</div>    							
    						</div>
    					</div>
    				</div>
    				<%
    				}
    			%>
    		</div>
    		<%
    	}catch(Exception e){
    		System.out.println(e);
    	}
    %>
  </div>
  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">Fruits & Vegitables</div>
  <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">Beverages</div>
  <div class="tab-pane fade" id="cat3" role="tabpanel" aria-labelledby="cat3-tab">Sancks</div>
  <div class="tab-pane fade" id="cat4" role="tabpanel" aria-labelledby="cat4-tab">Foodgrains oil etc</div>
  <div class="tab-pane fade" id="cat5" role="tabpanel" aria-labelledby="cat5-tab">cleaning</div>
  <div class="tab-pane fade" id="cat6" role="tabpanel" aria-labelledby="cat6-tab">beauty</div>
  <div class="tab-pane fade" id="cat7" role="tabpanel" aria-labelledby="cat7-tab">baby etc</div>

</div>
</body>
</html>