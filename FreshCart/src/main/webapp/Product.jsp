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
    <style>
    </style>
    <%@include file="Bootstrap/Bootstrap.jsp" %>
</head>

<body>
	<%! Connection con;
   		String category;
   		String id;
	%>
	<%
	//to send Username info to navBar
	HttpSession hs1 = request.getSession();
	id = (String)hs1.getAttribute("email");
	request.setAttribute("email", id);
	%>
    <%@include file="userNavbar2.jsp" %>
    <br><br><br><br>
    <h2>Product Page</h2>
    


    <%
    HttpSession hs = request.getSession();
    System.out.println(hs.getAttribute("email"));
    	try{
    		category =(String) request.getAttribute("category");
    		con = ConnectionProvider.getConnection();
    		PreparedStatement pstmt = con.prepareStatement("select * from fc_product where category=?");
    		pstmt.setString(1, category);
    		
    		ResultSet rs = pstmt.executeQuery();
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
    							<button class="btn btn-outline-danger btn-block" onclick="addToCart(this)"
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
    
</body>
<script type="text/javascript">
function addToCart(button) {
    const productId = button.getAttribute("data-product-id");
    const productName = button.getAttribute("data-product-name");
    const productPrice = button.getAttribute("data-product-price");
    const productDescription = button.getAttribute("data-product-description");

    // Update the cart count
    const cartCountElement = document.getElementById('cart-count');
    const currentCount = parseInt(cartCountElement.textContent, 10); // Get the current count
    const newCount = currentCount + 1; // Increase the count by 1

    // Update the cart count element
    cartCountElement.textContent = newCount;
    console.log("Cart count"+newCount);
    // Prepare the data to send to the server (you can use AJAX here)
    const data = {
        productId: productId,
        productName: productName,
        productPrice: productPrice,
        productDescription: productDescription
    };
</script>
</html>