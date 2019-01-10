<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Customer home page</title>

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


<style type="text/css">
.packet
{
margin-top: 20px;
border:none;
font-style: italic;
font-weight: bolder; 
text-align: center;
width:250px;
font-size: large;
background-color:white;
padding:0px;
}

td
{
padding-top:3px;
border-radius:20px;
}
img
{
padding:10px;
 
}

input[type="number"]
{
width:50px;
text-align: center;
}

body{
margin:0px;
padding:0px;
background:url(images/c.jpg);
background-attachment:fixed;
background-size: cover;

}
a[href]
{
color:red;
}
.logo{
width:100px;
}
a.navbar-brand{
padding:1px;
}
 
</style>

</head>
<body>
<%--
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"><img alt="not shown" class="logo" src="images/zappy-logo.png"></a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="customerHome.jsp">Home</a></li>
      <li><a href="#">View Cart</a></li>
      <li><a href="#">Order History</a></li>
      <li><a href="#">Join Us</a></li>
     </ul>

 </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span>Log out</a></li>
    </ul>
  </div>
</nav>
<br/><br/><br/><br/>
<img alt="" src="images/1.jpg"/> <img alt="" src="images/2.jpg"/><img alt="" src="images/3.jpg"/>
 --%>
<%@include file="header.jsp" %>

<%@page import="java.sql.*" %>
	<%
	String user=(String)session.getAttribute("uid");
	String count=(String)session.getAttribute("count");
	if(user==null)
	{
		response.sendRedirect("index.jsp");
	}
	%>  
<h2 align="center" style="font-style: italic; text-decoration: underline; ">Welcome <%=user%></h2>
${msg}
<%=count %>
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
		      <div class="col-lg-3 col-md-4 col-xs-6" style="padding:0px; ">
	     <table class="packet" border="3" >
		<tr><td><img  src="imgupload/<%=rs.getString("pimage")%>" height="130" width="150"/></td>
		</tr>
		  <tr><td><%=rs.getString("pcategory")%></td> </tr>
	        	  <tr><td><%=rs.getString("pname")%></td> </tr>
	             <tr><td><%=rs.getDouble("pprice")%></td>  </tr>
		       <form action="cartDetails" method="post" >
		       <tr><td>
		       <label>Quantity:</label>
		       <input type="number" name="quantity" value="1" />
		       </td></tr>
		       <tr><td>
		       <%-- <label>product ID:</label> --%>
		       <input type="text" value="<%=rs.getInt("pid")%>" hidden name="pid" />
		       </td></tr>
		       <tr><td>
		       <input type="submit" class="btn btn-primary btn-sm btn-block" value="Add to cart" />
		       </td></tr>
		       </form>
		       <br/>
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
<%@include file="footer.jsp" %>
</body>
</html>