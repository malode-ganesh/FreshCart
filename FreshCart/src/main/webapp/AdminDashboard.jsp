<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Dashboard</title>
<%@include file="Bootstrap/Bootstrap.jsp" %>
</head>
<body>
<%@include file="NavbarSecure.jsp" %>
<br><br><br>
<div class="container-fluid">
<div class="text-center">
<h2>Admin Dashboard</h2>
</div>

<!-- Nav tabs -->
<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="home-tab" data-toggle="tab" data-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">Update</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="profile-tab" data-toggle="tab" data-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">Add Product</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="messages-tab" data-toggle="tab" data-target="#messages" type="button" role="tab" aria-controls="messages" aria-selected="false">Orders</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="settings-tab" data-toggle="tab" data-target="#settings" type="button" role="tab" aria-controls="settings" aria-selected="false">Report</button>
  </li>
</ul>

<!-- Tab panes -->
<div class="tab-content">
  <div class="tab-pane active" id="home" role="tabpanel" aria-labelledby="home-tab">
  <center>
        <h4 id="msg" class="msg"><%=request.getAttribute("Message")%></h4><br><br>
    </center>
  <%@include file="ProductListing.jsp" %>
  
  </div>
  <div class="tab-pane" id="profile" role="tabpanel" aria-labelledby="profile-tab"><%@include file="AddProductForm.jsp" %></div>
  <div class="tab-pane" id="messages" role="tabpanel" aria-labelledby="messages-tab">..Edit.</div>
  <div class="tab-pane" id="settings" role="tabpanel" aria-labelledby="settings-tab">...feedback</div>
</div>
</div>

</body>
<script>
	setTimeout(() => {
		myFun();
	}, 2000);

	function myFun() {
		var x = document.getElementById("msg");
		x.style.display = "none";
	}
</script>
</html>