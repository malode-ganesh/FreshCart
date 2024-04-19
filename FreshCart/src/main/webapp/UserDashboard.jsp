<%@page import="com.connectionProvider.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="com.entities.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>User Dashboard</title>
    <%@include file="Bootstrap/Bootstrap.jsp" %>
</head>

<body class="container-fluid">

    <%!
String email;
String name;
String pwd;
%>

    <%
HttpSession hs = request.getSession();
email = (String)hs.getAttribute("email");

email = request.getParameter("email");
pwd = request.getParameter("pwd");
User user = new User(email,pwd);
//user.userInfo();
//name =  user.getName();
//Set 'name' in the request scope
request.setAttribute("email", email);
hs.setAttribute("email", email);
%>
    <% 
	
	if((email != null) && (user.verifyUser()) ){		
		%>
    <br><br><Br>
    <%@include file="userNavbar2.jsp"%>
    <%@include file="Product2.jsp" %>
    <%
	}else{
		String msg = "Please Login to access this page";
		request.setAttribute("error", msg);
		RequestDispatcher rd = request.getRequestDispatcher("/UserLogin.jsp");
		rd.forward(request, response); 
		
	}

%>

    <script type="text/javascript">
        const cartItems = [];
        var productName;
        function addToCart(button) {
            const productId = button.getAttribute("data-product-id");
             productName = button.getAttribute("data-product-name");
            const productPrice = button.getAttribute("data-product-price");
            const productDescription = button.getAttribute("data-product-description");

            var dd = `
      ${productName} - $${productPrice}
      <button onclick="removeFromCart('${productId}')">-</button>
      <span>1</span>
      <button onclick="addToCart('${productId}')">+</button>
    `;
    console.log("dd :"+dd);
            alert("added"+productName);
            // Create a new li element
            const listItem = document.createElement('li');
            listItem.innerHTML = `
      ${productName} - $${productPrice}
      <button onclick="removeFromCart('${productId}')">-</button>
      <span>1</span>
      <button onclick="addToCart('${productId}')">+</button>
    `;
            // Append the new li element to the cart items list
            const cartItemsList = document.getElementById('cart-items');
            cartItemsList.appendChild(listItem);
            // Update the cart count
            const cartCountElement = document.getElementById('cart-count');
            const currentCount = parseInt(cartCountElement.textContent, 10); // Get the current count
            const newCount = currentCount + 1; // Increase the count by 1

            // Update the cart count element
            cartCountElement.textContent = newCount;
            console.log("Cart count" + newCount);

            // Prepare the data to send to the server (you can use AJAX here)
            const data = {
                productId: productId,
                productName: productName,
                productPrice: productPrice,
                productDescription: productDescription
            }
        }
    </script>
</body>

</html>