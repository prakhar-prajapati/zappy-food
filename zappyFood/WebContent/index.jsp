<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



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


input[type="number"]
{
width:50px;
text-align: center;
}

body{
margin:0px;
padding:0px;
background:url(images/a.jpg);
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
<meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>ZappyFood</title>
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

<%@include file="header.jsp" %>


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
<%@page import="java.sql.*" %>
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
		       <tr><td>
		       <label>Quantity</label>
		       <input type="number" name="quantity" value="1" />
		       </td></tr>
		       <tr><td>
		       <input type="submit" class="btn btn-primary btn-sm btn-block" value="Add to cart" />
		       </td></tr>
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
<%@include file="footer.jsp" %>
</body>
</html>