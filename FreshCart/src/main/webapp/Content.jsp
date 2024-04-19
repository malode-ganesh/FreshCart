<body class="container-fluid">
   <%
   	HttpSession hs2 = request.getSession();
   //String s = (String)hs2.getAttribute("email");
   //hs2.setAttribute("email", s);
   System.out.println("Content email :"+hs2.getAttribute("email"));
   %>
    <br><br><br><br>
    <%@include file="Carousel.jsp" %>
    <br><br>
    <%-- <%@include file="CategoryList.jsp" %> --%>
    <div class="row container-fluid ">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <h3 class="align-left">Top Offers</h3>
            <div class="text-center">
                <span><img src="images/d1.PNG"></span>
                <span><img src="images/d2.PNG"></span>
                <span><img src="images/d3.PNG"></span>
                <span><img src="images/d4.PNG"></span>
            </div>
        </div>
        <div class="col-md-1"></div>
    </div>
    <br><br><br>
    <div class="row container-fluid ">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <h3 class="align-left">Fruits and Vegetables</h3>
            <div class="text-center">
                <a href="CategoryServlet?category=fruitsVegi">
                    <span><img src="images/vegi1.PNG" alt="vegi"></span>
                    <span><img src="images/vegi2.PNG"></span>
                    <span><img src="images/vegi3.PNG"></span>
                    <span><img src="images/vegi4.PNG"></span>
                </a>
            </div>
        </div>
        <div class="col-md-1"></div>
    </div>
    <br><br><br>
    <div class="row container-fluid ">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <h3 class="align-left">Your Daily Staples</h3>
            <div class="text-center">
                <a href="CategoryServlet?category=foodgrains">
                <span><img src="images/staples1.PNG" width="200px" alt="vegi"></span>
                <span><img src="images/staples2.PNG" width="200px"></span>
                <span><img src="images/staples3.PNG" width="200px"></span>
                <span><img src="images/staples4.PNG" width="200px"></span>
                <span><img src="images/staples5.PNG" width="200px"></span>
            </a>
            </div>
        </div>
        <div class="col-md-1"></div>
    </div>
    <br><br><br>
    <div class="row container-fluid ">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <h3 class="align-left">Beverages</h3>
            <div class="text-center">
                <a href="CategoryServlet?category=beverages">
                <span><img src="images/drink1.PNG" width="200px" alt="vegi"></span>
                <span><img src="images/drink3.PNG" width="200px"></span>
                <span><img src="images/drink4.PNG" width="200px"></span>
                <span><img src="images/drink5.PNG" width="200px"></span>
                <span><img src="images/drink6.PNG" width="200px"></span>
            </a>
            </div>
        </div>
        <div class="col-md-1"></div>
    </div>
    <br><br><br>
    <div class="row container-fluid ">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <h3 class="align-left">Snacks Store</h3>
            <div class="text-center">
                <a href="CategoryServlet?category=snacks">
                <span><img src="images/snack1.PNG" alt="vegi"></span>
                <span><img src="images/snack2.PNG"></span>
                <span><img src="images/snack3.PNG"></span>
                <span><img src="images/snack4.PNG"></span>
            </a>
            </div>
        </div>
        <div class="col-md-1"></div>
    </div><br><br>

    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <br><br>
            <h4>FreshKart - Online grocery store</h4>
        </div>
        <div class="col-md-1"></div>
    </div>