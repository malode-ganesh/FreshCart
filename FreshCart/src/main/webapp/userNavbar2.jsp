<%@page import="com.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@include file="Bootstrap/Bootstrap.jsp"%>
  <style>
    .cart-icon {
      position: relative;
      font-size: 24px;
    }

    .count {
      position: absolute;
      top: -10px;
      right: -10px;
      background-color: red;
      color: white;
      border-radius: 50%;
      padding: 5px 10px;
      font-size: 12px;
    }
  </style>
</head>

<body class="container-fluid">
  <%!String Uemail;
   String Uname;
%>

  <%
Uemail = (String)request.getAttribute("email"); 
System.out.println("Navbar :"+Uemail);
User u = new User(Uemail);
u.userInfo();
Uname =  u.getName();
%>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <a class="navbar-brand" href="UserDashboard.jsp"> <img src="images/freshCartLogo-2.png" alt="FreshKart"
        width="120px">
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
          <button class="btn btn-sm btn-dark mt-1" onClick="displayResult()"><i
              class="fa-solid fa-square-poll-vertical"></i> Result</button>
        </li>
        <li class="nav-item"><a class="nav-link " href="about.jsp"><i class="fa-solid fa-circle-info"></i> About</a>
        </li>
        <li class="nav-item"><a class="nav-link " href="UserLogin.jsp"><i class=""></i> gjhhj</a></li>

        <li class="nav-item"><a class="nav-link " href="adminLogin.jsp"><i
              class="fa-regular fa-circle-up"></i><%=Uname %></a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li>
          <!-- <h3 class="fa-solid fa-cart-shopping mr-3 text-warning"></h3> -->
          <button type="button" class=" " data-toggle="modal" data-target="#cartModal">
            <div class="cart-icon ">
              <i class="fa-solid fa-cart-shopping text-warning mr-3"></i>
              <span class="count" id="cart-count">0</span>

            </div>
          </button>
        </li>
        <li>
          <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"><i
              class="fa-solid fa-user"></i> <%=Uname %></button>
        </li>
      </ul>
    </div>
  </nav>
  <!-- Account info Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Profile</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div><%=Uemail %></div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-danger">Logout</button>
        </div>
      </div>
    </div>
  </div>
  <!-- Cart Model -->
  <div class="modal fade" id="cartModal" tabindex="-1" role="dialog" aria-labelledby="cartModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="cartModalLabel">Cart Items</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <h6>Items in your cart:</h6>
          <ul id="cart-items">
          	
          </ul>
          <div class="mt-3">Total Amount: <span id="total-amount">Rs.0.00</span></div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-warning">Buy Now</button>
        </div>
      </div>
    </div>
  </div>
</body>

</html>