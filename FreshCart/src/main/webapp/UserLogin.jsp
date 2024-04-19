<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="UserLogin.css"> 
</head>
<body class="container-fluid">
<%@include file="Navbar.jsp" %><br><br><br><br>
<% String msg = (String)request.getAttribute("error"); %>
    <% if (msg != null) { %>
    <div class="error-message" id="msg" style="color:green;">
       <center><h2><%= msg %></h2></center> 
    </div>
<% } %>
<%-- <%out.print(request.getAttribute("errorMsg")); %> --%>
<section>
    <div class="container">
      <div class="user signinBx">
        <div class="imgBx"><img src="https://raw.githubusercontent.com/WoojinFive/CSS_Playground/master/Responsive%20Login%20and%20Registration%20Form/img1.jpg" alt="" /></div>
        <div class="formBx">
          <form action="UserDashboard.jsp" method="post">
            <h2>Sign In</h2>
            <input type="email" name="email" placeholder="Username/email" required/>
            <input type="password" name="pwd" placeholder="Password" required/>
            <input type="submit" value="Login" />
            <p class="signup">
              Don't have an account ?
              <a href="#" onclick="toggleForm();">Sign Up.</a>
            </p>
          </form>
        </div>
      </div>
      <div class="user signupBx">
        <div class="formBx">
          <form action="UserRegisterServlet" method="post">
            <h2>Create an account</h2>
            <input type="text" name="name" placeholder="Name" required/>
            <input type="email" name="email" placeholder="Email Address" required/>
            <input type="password" name="pwd" placeholder="Create Password" required/>
            <!-- <input type="password" name="" placeholder="Confirm Password" /> -->
            <input type="submit" name="" value="Sign Up" />
            <p class="signup">
              Already have an account ?
              <a href="#" onclick="toggleForm();">Sign in.</a>
            </p>
          </form>
        </div>
        <div class="imgBx"><img src="https://raw.githubusercontent.com/WoojinFive/CSS_Playground/master/Responsive%20Login%20and%20Registration%20Form/img2.jpg" alt="" /></div>
      </div>
    </div>
  </section>
</body>
<script>
  const toggleForm = () => {
  const container = document.querySelector('.container');
  container.classList.toggle('active');
};

setTimeout(() => {
	var x = document.getElementById("msg");
	x.style.display="none";
}, 2000);
</script>
</html>