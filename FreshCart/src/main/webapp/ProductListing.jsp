<%@page import="com.connectionProvider.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Products</title>
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
	</script>

</head>

<body class="container text-center">
	<%!Connection con; %>
	<%
	
	try{
	con = ConnectionProvider.getConnection();
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from fc_product");
	%>
	<div class="row">
		<%
		while (rs.next()) {
			String pName = rs.getString("p_name");
			String category = rs.getString("category");
			String price = rs.getString("price");
			String desc = rs.getString("p_desc");
			byte[] imageData = rs.getBytes("imgData");
			%>
		<div class="col-lg">
			<div class="card border-dark mb-3" style="width:250px">
				<img src="data:image/jpeg;base64, <%= new String(Base64.getEncoder().encode(imageData)) %>"
					class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title"><%out.print(pName); %></h5>
					<p class="card-text"><%out.print(desc);%></p>
					<span><b>Rs.<%out.print(price); %></b></span><br>
					<button class="btn btn-outline-danger" href="#">Delete</button>
					<button class="btn btn-outline-primary">Update</button>
				</div>
			</div>
		</div>
		<%
			}
	}catch(Exception e){
		System.out.println(e);
	}
			%>
	</div>
</body>

</html>