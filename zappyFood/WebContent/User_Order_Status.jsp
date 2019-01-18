<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Order</title>
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

<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList,bean.orderBean" %>
${msg}
<%
ArrayList<orderBean> list= (ArrayList<orderBean>)request.getAttribute("List");
	  %>
	  <div class="container">
	  <table class="table table-bordered">
	  <tr><th>Quantity</th><th>Unit-Price</th><th>user</th><th>Delivery Address</th><th>Status</th><th>Order Date-Time</th></tr>
	  <%
for(orderBean rs:list)
{
%>
      <tr>
		        
		        <td><%=rs.getQuantity()%></td>
		        <td><%=rs.getTotal()%></td>
		         <td><%=rs.getUser()%></td>
		        <td><%=rs.getAddress()%></td>
		         <td><%if(rs.getStatus()==0) out.println("PROCESSING..");
		         else if(rs.getStatus()==1) out.println("DISPATCH");
		         else if(rs.getStatus()==2) out.println("NOT-IN-Stock");
		         %></td>
		         <td><%=rs.getDatetime()%></td>
		         </tr>
		  <%
	   }
	  %>
	  </table>
	  </div>
	  
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