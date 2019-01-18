<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="java.util.ArrayList,bean.productBean"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home page</title>
<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style type="text/css">
table
{
margin-top: 20px;
border:none;
font-style: italic;
font-weight: bolder; 
text-align: center;
width:250px;
font-size: large;
background-color:transparent;
padding:0px;
border-radius: 5px;
}

td
{
border:none;
}

table:hover
{
<!--box-shadow: 5px 10px #888888;-->
}
input[type="number"]
{
width:50px;
text-align: center;
}

body{
letter-spacing:1px;
margin:0px;
padding:0px;
background:url(images/c.jpg);
background-attachment:fixed;
background-size: cover;
font-family: 'Lobster', cursive;

}

img:hover
{
opacity:0.5;
}

input[type="submit"]
{
border-radius:20px;
width:227px;
background-color:#007bff; 
border-color:#007bff;
color:white;
margin-top:2px;
}

h1{
font-family: 'Lobster', cursive;
}

.centered {
  position: absolute;
  top: 30%;
  left: 50%;
  z-index:-1;
  transform: translate(-50%, -50%);
}

</style>
<meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>ZappyFood.in</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
		
		<!-- all css here -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/chosen.min.css">
        <link rel="stylesheet" href="assets/css/ionicons.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="assets/css/meanmenu.min.css">
        <link rel="stylesheet" href="assets/css/bundle.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/responsive.css">
        <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>



<%
	String user=(String)session.getAttribute("uid");
%> 
<%if( user==null)
	{%>
	<%@include file="header.jsp" %>
	<%} %>
	
	<%if( user!=null)
	{%>
	<%@include file="headeruser.jsp" %>
	<h2 align="center" style="font-style: italic; text-decoration: underline; ">Welcome <%=user%></h2>
	<%} %>


${msg}

 <!--Slider start-->

                <div class="slider_area">
                    <div class="slider_list  owl-carousel">
                        <div class="single_slide" style="background-image: url(images/slider.jpg);height:450px;">
                            <div class="container">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="slider__content slider_content_two">
                                            <p>Exclusive Offer -10% Off This Week</p>
                                            <h2>Live <strong>healthy</strong> with a glass</h2>
                                            <h3>of <strong>fruit juice</strong> every day</h3>  
                                            <h6>Starting at<span>Rs.10 Only</span></h6>
                                            <div class="slider_btn">
                                                <a href="#">Shopping now</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="single_slide" style="background-image: url(images/asd.jpg);height:450px;">
                            <div class="container">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="slider__content">
                                            <p class="text-primary">Exclusive Offer -10% Off This Week</p>
                                            <h2 class="text-muted">Live <strong class="text-white">healthy</strong> </h2>
                                            <h2 class="text-muted">  <strong class="text-white">Deliciousness</strong> jumping into the mouth</h2>  
                                            <h6 class="text-primary">Starting at<span>Rs.10 Only</span></h6>
                                            <div class="slider_btn">
                                                <a href="#">Shopping now</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Slider end-->




<div class="banner_area home1_banner mt-30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-4 col-md-6">
                                <div class="single_banner">
                                    <a href="#">
                                        <img src="assets/img/banner/1.jpg" alt="">
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="single_banner">
                                    <a href="#">
                                        <img src="assets/img/banner/2.jpg" alt="">
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="single_banner banner_three">
                                    <a href="#">
                                        <img src="assets/img/banner/3.jpg" alt="">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


<!--Shipping area start-->
                <div class="shipping_area">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="shipping_list d-flex justify-content-between flex-xs-column"
                                style="margin-top:40px; margin-bottom:30px; background:white; "
                                >
                                    <div class="single_shipping_box d-flex">
                                        <div class="shipping_icon">
                                            <img src="assets/img/ship/1.png" alt="shipping icon">
                                        </div>
                                        <div class="shipping_content">
                                            <h6>Free Shipping On Order Over Rs.2000</h6>
                                            <p>Free shipping on all order</p>
                                        </div>
                                    </div>
                                    <div class="single_shipping_box one d-flex">
                                        <div class="shipping_icon">
                                            <img src="assets/img/ship/2.png" alt="shipping icon">
                                        </div>
                                        <div class="shipping_content">
                                            <h6>Money Return</h6>
                                            <p>Back guarantee under 7 days</p>
                                        </div>
                                    </div>
                                    <div class="single_shipping_box two d-flex">
                                        <div class="shipping_icon">
                                            <img src="assets/img/ship/3.png" alt="shipping icon">
                                        </div>
                                        <div class="shipping_content">
                                            <h6>Member Discount</h6>
                                            <p>Support online 24 hours a day</p>
                                        </div>
                                    </div>
                                    <div class="single_shipping_box three d-flex">
                                        <div class="shipping_icon">
                                            <img src="assets/img/ship/4.png" alt="shipping icon">
                                        </div>
                                        <div class="shipping_content">
                                            <h6>Online Support 24/7</h6>
                                            <p>Free shipping on all order</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Shipping area end-->



<%--
<hr style="margin:30px; border-bottom-color:#3678b1;" >
<%@page import="java.sql.*"%>
<div class="container">
  <div class="row">
<%
try {
	Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/zappyfood_db","root","root");
PreparedStatement ps=con.prepareStatement("select * from product_details");
	  ResultSet rs=ps.executeQuery();
	  %>
	  <%
	  while(rs.next())
	  {
		  %>
	        	 
		      <div class="col-lg-3 col-md-4 col-xs-6">
	     <table class="packet" border="3" >
		<tr><td><img src="imgupload/<%=rs.getString("pimage")%>" height="120" width="140"/></td>
		</tr>
		  <tr><td><%=rs.getString("pcategory")%></td> </tr>
	        	  <tr><td><%=rs.getString("pname")%></td> </tr>
	             <tr>  <td><%=rs.getDouble("pprice")%></td>  </tr>
		       
		       <form action="cartDetails" method="post">
		       <tr><td>
		       <label>Quantity:</label>
		       <input type="number" name="quantity" value="1" />
		       </td></tr>
		       <tr><td>
		        <label>pid:</label>
		       <input type="text" name="pid" hidden value="<%=rs.getInt("pid")%>" />
		       </td></tr>
		       <tr><td>
		       <input type="submit" class="btn btn-primary btn-sm btn-block" value="Add to cart" />
		       </td></tr>
		       
		       </form>
		       <br>
	 </table>	  
	  </div>
	  
	     
		  <%
	  }
	  %>
	 
	  <%
	  
	  con.close();
}catch(Exception e)
{
	  System.out.println(e);
}

%>
  </div>
</div>
 --%>
 
 
 
 <% 
 ArrayList<productBean> list1=(ArrayList<productBean>)request.getAttribute("LIST1");
 %>

<div class="container-fluid">
  <h2 style="background:lightblue; text-align:center; border-bottom:solid orange 3px; margin-top:20px;">Ready to Drink</h2>
   
	<div class="row">
	 <%
 for(productBean ee:list1)
   {
	  %>
    <div class="col-lg-3 col-md-4 col-xs-6" >
    
    
	 <table class="set" border="3" >
		
		<tr><td><a href="productDesc?pid=<%=ee.getId()%>"><img src="imgupload/<%=ee.getImage()%>" height="150" width="280"/></a>
		<span class="centered">Description</span>
		</td>
		</tr>
		  <tr><td><b><%=ee.getName()%></b></td> </tr>
		       <tr><td> <b><%=ee.getPrice()%> Rs.</b></td>  </tr>
		      
		     
		   <form action="cartDetails" method="post">
         <tr>  <td><label><strong style="font-size:medium;">Quantity:</strong></label>
		 <input type="number" name="quantity" value="1" min="0" ></td></tr>
		 
		 <input type="text" name="pid" value="<%=ee.getId()%>" hidden /></td></tr>
<tr><td><input type="submit"  value="Add to cart" /></td></tr>
		       
         </form>
		   
    
     
	 </table>
          
      
       </div>
    <%
	 }
	 %>	
  </div>
  
</div>


<% 
 
 ArrayList<productBean> list2=(ArrayList<productBean>)request.getAttribute("LIST2");
 
 %>



<div class="container-fluid">
  <h2 style="background:lightblue; text-align:center; border-bottom:solid orange 3px; margin-top:20px;">Ready to eat</h2>
   <div class="row">
	 <%
 for(productBean ee:list2)
   {
	   
	  %>
    <div class="col-lg-3 col-md-4 col-xs-6" >
    
    
	 <table class="set" border="3" >
		<tr><td><a href="productDesc?pid=<%=ee.getId()%>"><img src="imgupload/<%=ee.getImage()%>"  height="150" width="150"/></td>
		</tr>
		  <tr><td><b><%=ee.getName()%></b></td> </tr>
		       <tr><td> <b><%=ee.getPrice()%> Rs.</b></td>  </tr>
		      
		     
		   <form action="cartDetails" method="post">
         <tr>  <td><label><strong style="font-size:medium;">Quantity:</strong></label>
		 <input type="number" name="quantity" value="1" min="0" ></td></tr>
		 
		 <input type="text" name="pid" value="<%=ee.getId()%>" hidden /></td></tr>
<tr><td><input type="submit"  value="Add to cart" /></td></tr>
         </form>
		   
    
     
	 </table>
          
      
       </div>
    <%
	 }
	 %>	
  </div>
  
</div>

<% 
 
 ArrayList<productBean> list3=(ArrayList<productBean>)request.getAttribute("LIST3");
 
 %>
<div class="container-fluid">
  <h2 style="background:lightblue; text-align:center; border-bottom:solid orange 3px; margin-top:10px;">Ready to cook</h2>
  <div class="row">
	 <%
 for(productBean ee:list3)
   {
	   
	  %>
    <div class="col-lg-3 col-md-4 col-xs-6" >
    
    
	 <table class="set" border="3" >
		<tr><td><a href="productDesc?pid=<%=ee.getId()%>"><img src="imgupload/<%=ee.getImage()%>"  height="150" width="150"/></td>
		</tr>
		  <tr><td><b><%=ee.getName()%></b></td> </tr>
		       <tr><td> <b><%=ee.getId()%> Rs.</b></td>  </tr>
		      
		     
		   <form action="cartDetails" method="post">
         <tr>  <td><label ><strong style="font-size:medium;">Quantity:</strong></label>
		 <input type="number" name="quantity" value="1" min="0" ></td></tr>
		 
		 <input type="text" name="pid" value="<%=ee.getId()%>" hidden /></td></tr>
<tr><td><input type="submit"  value="Add to cart" /></td></tr>
         </form>
		   
    
     
	 </table>
          
      
       </div>
    <%
	 }
	 %>
	  	
  </div>
  
</div>
  
<%@include file="footer.jsp" %>
<!-- all js here -->
        <script src="assets/js/vendor/jquery-1.12.0.min.js"></script>
        <script src="assets/js/popper.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.meanmenu.min.js"></script>
        <script src="assets/js/isotope.pkgd.min.js"></script>
        <script src="assets/js/imagesloaded.pkgd.min.js"></script>
        <script src="assets/js/jquery.counterup.min.js"></script>
        <script src="assets/js/waypoints.min.js"></script>
        <script src="assets/js/ajax-mail.js"></script>
        <script src="assets/js/owl.carousel.min.js"></script>
        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>
</body>
</html>